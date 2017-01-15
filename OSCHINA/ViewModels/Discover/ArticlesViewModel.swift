//
//  Copyright © 2016年 Jack. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper

class ArticlesViewModel: BaseViewModel {
    var articleEntities: [ArticleEntity] = []
    override init() {
        super.init()
    }
    
    func refresh() -> Observable<[ArticleEntity]> {
        page = 1
        return getArticleInfoByPage(page: page)
    }
        
    /* 分页获取更多 */
    func loadMore() -> Observable<[ArticleEntity]> {
        return getArticleInfoByPage(page: page + 1)
    }
    
    private func getArticleInfoByPage(page:Int) -> Observable<[ArticleEntity]> {
        return Observable
            .zip(
                provider.request(GankIOService.byPageAndKind(kind: "福利", page: page, count: self.offset)).filter(statusCodes: 200...201).observeOn(backgroundWorkScheduler).map({ response -> [ArticleEntity] in
                    if let result = Mapper<BaseModel<ArticleEntity>>().map(JSONString: String(data: response.data, encoding:  String.Encoding.utf8)!) {
                        return result.results!
                    } else {
                        throw response as! Error
                    }
                }),
                provider
                    .request(GankIOService.byPageAndKind(kind: "休息视频", page: page, count: self.offset))
                    .filter(statusCodes: 200...201)
                    .observeOn(backgroundWorkScheduler)
                    .map({ response -> [ArticleEntity] in
                        if let result = Mapper<BaseModel<ArticleEntity>>().map(JSONString: String(data: response.data,encoding:  String.Encoding.utf8)!){
                            return result.results!
                        }else{
                            throw response as! Error
                        }
                    }),
                resultSelector: { (girls, videos) -> [ArticleEntity] in
                    for item in girls{
                        item.desc = item.desc! + " " + self.getFirstVideoDescByPublishTime(videos: videos,publishedAt: item.publishedAt!)
                    }
                    return girls
                }
            )
            .do(onNext:  { (entities) in
                if !entities.isEmpty{
                    if page == 1{
                        // new or refresh data
                        self.articleEntities = entities
                    }else{
                        self.articleEntities += entities
                        self.page = page
                        
                    }
                }
            })
            .observeOn(MainScheduler.instance)
    }
    
    private func getFirstVideoDescByPublishTime(videos: [ArticleEntity],publishedAt: Date) -> String {
        var videoDesc = ""
        for item in videos {
            if item.publishedAt == nil {
                item.publishedAt = item.createdAt
            }
            let videoPublishedAt = item.publishedAt
            if DateUtil.areDatesSameDay(dateOne: videoPublishedAt!, dateTwo: publishedAt){
                videoDesc = item.desc!
                break
            }
        }
        return videoDesc
    }
}
