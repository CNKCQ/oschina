//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/8/15.
//
import Foundation
import Moya


///http://www.oschina.net/openapi/docs/
///http://osc_api.mydoc.io/


enum OSCIOService {
    case newsList, newBanner, tweetList, blogList, eventList, eventBanner
    case login(username: String, password: String)
    case findUser(name: String)
    case search(content: String)
}

extension OSCIOService: TargetType {

    var baseURL: URL {
//        return NSURL(string: "http://www.oschina.net/action/api")! //XML格式
        return URL(string: "http://www.oschina.net/action/apiv2")! //JSON格式
    }

    var path: String {
        switch self {
        case .newsList:
            return "/news"
        case .newBanner:
            return "/banner"
        case .tweetList:
            return "/tweet_list"
        case .blogList:
            return "/blog_list"
        case .eventList:
            return "/event_list"
        case .eventBanner:
            return "/banner"
        case .login( _, _):
            return "/login_validate"
        case .findUser(_):
            return "/find_user"
        case .search(_):
            return "/search_list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .POST
        default:
            return .GET
        }
    }

    var parameters: [String: AnyObject]? {
        switch self {
        case .login(let username, let password):
            return ["username": username as AnyObject, "pwd": password as AnyObject]
        case .newBanner:
            return ["catalog": 1 as AnyObject]
        case .eventBanner:
            return ["catalog": 3 as AnyObject]
        case .findUser(let name):
            return ["name":name as AnyObject]
        default:
             return nil
        }
    }

    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)! // for test
    }

    var multipartBody: [MultipartFormData]? {
        return nil
    }
}
