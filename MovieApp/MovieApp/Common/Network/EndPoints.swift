//
//  EndPoints.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation

import Foundation
import UIKit

struct API {
    static let baseUrl = "http://pretest-qa.dcidev.id"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Register: Endpoint {
        case register
        case otpMatch
        case otpRequest
        case remove

        public var path: String {
            switch self {
            case .register:
                return "/api/v1/register"
            case .otpMatch:
                return "/api/v1/register/otp/match"
            case .otpRequest:
                return "/api/v1/register/otp/request"
            case .remove:
                return "/api/v1/register/remove"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
    
    enum Oauth: Endpoint {
        case signIn

        public var path: String {
            switch self {
            case .signIn:
                return "POST /api/v1/oauth/sign_i"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
    
    enum Profile: Endpoint {
        case career
        case education
        case profile
        case me

        public var path: String {
            switch self {
            case .career:
                return "/api/v1/profile/career"
            case .education:
                return "/api/v1/profile/education"
            case .profile:
                return "/api/v1/profile"
            case .me:
                return "/api/v1/profile/me"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
    
    enum Upload: Endpoint {
        case cover
        case profileDefault
        case deleteProfile
        case profile

        public var path: String {
            switch self {
            case .cover:
                return "/api/v1/uploads/cover"
            case .profileDefault:
                return "/api/v1/uploads/profile/default"
            case .deleteProfile:
                return "/api/v1/uploads/profile"
            case .profile:
                return "/api/v1/uploads/profile"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
    
    enum Message: Endpoint {
        case getMessagge
        case postMessage

        public var path: String {
            switch self {
            case .getMessagge:
                return "/api/v1/message/{user_id}"
            case .postMessage:
                return "/api/v1/message/send"
            }
        }

        public var url: String {
            return "\(API.baseUrl)\(path)"
        }
    }
}
