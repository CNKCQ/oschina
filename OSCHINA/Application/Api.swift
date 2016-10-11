//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/8/15.
//
import Foundation
import Moya


///http://www.oschina.net/openapi/docs/
///http://osc_api.mydoc.io/


enum OSCIOService {
    case NewsList, NewBanner, TweetList, BlogList, EventList, EventBanner
    case Login(username: String, password: String)
    case FindUser(name: String)
    case Search(content: String)
}

extension OSCIOService: TargetType {

    var baseURL: NSURL {
//        return NSURL(string: "http://www.oschina.net/action/api")! //XML格式
        return NSURL(string: "http://www.oschina.net/action/apiv2")! //JSON格式
    }

    var path: String {
        switch self {
        case .NewsList:
            return "/news"
        case .NewBanner:
            return "/banner"
        case .TweetList:
            return "/tweet_list"
        case .BlogList:
            return "/blog_list"
        case .EventList:
            return "/event_list"
        case .EventBanner:
            return "/banner"
        case .Login( _, _):
            return "/login_validate"
        case .FindUser(_):
            return "/find_user"
        case .Search(_):
            return "/search_list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .Login:
            return .POST
        default:
            return .GET
        }
    }

    var parameters: [String: AnyObject]? {
        switch self {
        case .Login(let username, let password):
            return ["username": username, "pwd": password]
        case .NewBanner:
            return ["catalog": 1]
        case .EventBanner:
            return ["catalog": 3]
        case .FindUser(let name):
            return ["name":name]
        default:
             return nil
        }
    }

    var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)! // for test
    }

    var multipartBody: [MultipartFormData]? {
        return nil
    }
}
