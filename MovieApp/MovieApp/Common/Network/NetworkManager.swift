//
//  NetworkManager.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Alamofire

class NetworkManager: NSObject {
    static let shared = NetworkManager()
    
    let manager: Alamofire.SessionManager = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 20
            return Alamofire.SessionManager(
                configuration: configuration)            
        }()

    public func isConnectedToInternet() -> Bool {
        return currentReachabilityStatus != .notReachable
    }
}

