//
//  SessionManager.swift, 
//  CoinTracker
//
    

import Foundation
import Moya
import SwiftyJSON

public class SessionManager {
    
    public static let shared = SessionManager()
    
    private init() {}
    
    public func request(requestType: RequestType, completion handler: @escaping (Swift.Result<JSON, Error>) -> Void) {
        let provider = MoyaProvider<RequestType>()
        provider.request(requestType) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(data: response.data)
                    handler(Swift.Result.success(json))
                } catch let error {
                    handler(Swift.Result.failure(error))
                    return
                }
            case let .failure(error):
                handler(Swift.Result.failure(error))
            }
        }
    }
    
}
