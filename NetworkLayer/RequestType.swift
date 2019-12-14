//
//  RequestType.swift, 
//  CoinTracker
//
    

import Foundation
import Moya
import Alamofire

public enum RequestType: TargetType {
    
    case historicalPrice(currency: String, startDate: String, endDate: String)
    case currentPrice
    
    public var baseURL: URL {
        return URL(string: "https://api.coindesk.com/v1/bpi")!
    }
    
    public var path: String {
        switch self {
        case .historicalPrice: return "/historical/close.json"
        case .currentPrice: return "/currentPrice.json"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case let .historicalPrice(currency, startDate, endDate): return .requestParameters(parameters: ["currency": currency,
                                                                                                        "start": startDate,
                                                                                                        "end": endDate],
                                                                                                   encoding: URLEncoding.queryString)
        case .currentPrice: return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}
