//
//  Copyright © 2016年 KingCQ. All rights reserved.
//  Created by KingCQ on 16/8/15.
//
import Foundation
import Moya

/// http://www.oschina.net/openapi/docs/
/// http://osc_api.mydoc.io/

enum OSCIOService {
    case newsList(para: [String: Int])
    case newBanner, tweetList, blogList, eventList, eventBanner
    case login(username: String, password: String)
    case findUser(name: String)
    case search(content: String)
}

extension OSCIOService: TargetType {

    var baseURL: URL {
        // return NSURL(string: "http://www.oschina.net/action/api")! //XML格式
        return URL(string: "http://www.oschina.net/action/apiv2")! // JSON格式
    }

    var path: String {
        switch self {
        case let .newsList(para):
            return "/news_list/?\(para.keys.first!)=\(para.values.first!)&pageSize=2"
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
        case .login:
            return "/login_validate"
        case .findUser:
            return "/find_user"
        case .search:
            return "/search_list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case let .login(username, password):
            return ["username": username, "pwd": password]
        case .newBanner:
            return ["catalog": 1]
        case .eventBanner:
            return ["catalog": 3]
        case let .findUser(name):
            return ["name": name]
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

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    public var task: Task {
        return .request
    }
}

class GankIO {
    static let HOST = "http://gank.io"
    static let PATH_API = "/api"
    static let PATH_SEARCH = "/search"
}

enum GankIOService {
    // 随机获取某类指定个数的数据
    case randomByKindAndCount(kind: String, count: Int)

    // 某天数据
    case byDay(year: Int, month: Int, day: Int)

    // 获取发过干货的日期
    case historyDays

    // 分页获取某类数据
    case byPageAndKind(kind: String, page: Int, count: Int)

    // 获取某日网站的 html 数据
    case htmlByDay(year: Int, month: Int, day: Int)

    // 分页获取网站的 html 数据
    case htmlByPage(page: Int, count: Int)

    // 搜索
    case search(text: String)
}

extension GankIOService: TargetType {

    var baseURL: URL {
        return URL(string: GankIO.HOST)!
    }

    var path: String {
        switch self {
        case let .randomByKindAndCount(kind, count):
            return "\(GankIO.PATH_API)/random/data/\(kind)/\(count)"
        case let .byDay(year, month, day):
            return "\(GankIO.PATH_API)/day/\(year)/\(month)/\(day)"
        case .historyDays:
            return "\(GankIO.PATH_API)/day/history"
        case let .byPageAndKind(kind, page, count):
            return "\(GankIO.PATH_API)/data/\(kind)/\(count)/\(page)"
        case let .htmlByDay(year, month, day):
            return "\(GankIO.PATH_API)/history/content/day/\(year)/\(month)/\(day)"
        case let .htmlByPage(page, count):
            return "\(GankIO.PATH_API)/history/content/\(count)/\(page)"
        case .search:
            return "\(GankIO.PATH_SEARCH)"
        }
    }

    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case let .search(text):
            return ["q": text]
        default:
            return nil
        }
    }

    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }

    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    public var task: Task {
        return .request
    }
}
