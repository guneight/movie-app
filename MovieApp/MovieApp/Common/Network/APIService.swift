//
//  APIService.swift
//  MovieApp
//
//  Created by AlephHV2D on 02/07/21.
//

import Foundation
import Alamofire

typealias MovieResponse<T: Codable> = (ResponseObject<T>?, Error?) -> Void
typealias MovieBEResponse<T: Codable> = (T?, Error?) -> Void
typealias MovieDownloadResponse = (DownloadResponse<Data>?, Error?) -> Void

protocol APIConfig {
    var endpoint: String { get set }
    var method: HTTPMethod { get set }
    var encoding: ParameterEncoding { get set }
    var headers: HTTPHeaders { get set }
    var params: Parameters? { get set }
}

struct AlamofireHelper {
    static func cancelAllRequests() {
        let sessionManager = NetworkManager.shared.manager
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}

class JSONWrapper<T: Codable> {
    func generateMockModel(filename: String, completion: @escaping ((ResponseObject<T>?, Error?) -> Void)) {
        if let path = Bundle(for: type(of: self)).path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let model = try decoder.decode(ResponseObject<T>.self, from: data)
                completion(model, nil)
            } catch {
                completion(nil, error)
            }
        } else {
            completion(nil, NSError(domain: "", code: -1009, userInfo: [NSLocalizedDescriptionKey: "JSON File not found"]))
        }
    }
    
    func generateModel(from textJSON: String, completion: @escaping ((ResponseObject<T>?, Error?) -> Void)) {
        do {
            let data = Data(textJSON.utf8)
            let model = try JSONDecoder().decode(ResponseObject<T>.self, from: data)
            completion(model, nil)
        } catch {
            completion(nil, error)
        }
    }
}

class APIService<T: Codable> {
    static func getObject(setup: APIConfig, completion: @escaping MovieResponse<T>) -> DataRequest {
        if NetworkManager.shared.isConnectedToInternet() {
            return NetworkManager.shared.manager.request(setup.endpoint,
                                                         method: setup.method,
                                                         parameters: setup.params,
                                                         encoding: setup.encoding,
                                                         headers: setup.headers)
                .responseJSON { response in
                    switch response.result {
                    case .success(_):
                        do {
                            guard let data = response.data else { return }
                            let decoder = JSONDecoder()
                            let model = try decoder.decode(ResponseObject<T>.self, from: data)
                            completion(model, nil)
                        } catch let error as NSError {
                            print("Error occured => \(error.localizedDescription)")
                            completion(nil, error)
                        }
                    case .failure(let error):
                        print(error)
                        if let error = error as NSError?{
                            let error = NSError(domain: "", code: error.code, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])
                            completion(nil, error)
                        } else {
                            completion(nil, error)
                        }
                    }
                }
        } else {
            let error = NSError(domain: "", code: -1009, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])
            completion(nil, error)
            return Alamofire.request("//")
        }
    }

    static func getMovieObject(setup: APIConfig, completion: @escaping MovieBEResponse<T>) -> DataRequest {
        print(setup)
        if NetworkManager.shared.isConnectedToInternet() {
            return Alamofire.request(setup.endpoint,
                method: setup.method,
                parameters: setup.params,
                encoding: setup.encoding,
                headers: setup.headers)
                .responseJSON { response in
                    print(response)
                    switch response.result {
                    case .success(_):
                        do {
                            guard let data = response.data else { return }
                            let decoder = JSONDecoder()
                            let model = try decoder.decode(T.self, from: data)
                            completion(model, nil)
                        } catch let error as NSError {
                            completion(nil, error)
                        }
                    case .failure(let error):
                        completion(nil, error)
                    }
            }
        } else {
            let error = NSError(domain: "", code: -1009, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])
            completion(nil, error)
            return Alamofire.request("//")
        }
    }
}

class APIDownloadService {
    static func downloadObject(filePath: String, setup: APIConfig, completion: @escaping MovieDownloadResponse) -> DownloadRequest {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent(filePath)
            return (documentsURL, [.removePreviousFile])
        }
        return NetworkManager.shared.manager.download(setup.endpoint, headers: setup.headers, to: destination).responseData { (data) in
            switch data.result {
            case .success(_):
                completion(data, nil)
            case .failure(let error):
                print(error)
                if let error = error as NSError? {
                    let error = NSError(domain: "", code: error.code, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])
                    completion(nil, error)
                } else {
                    completion(nil, error)
                }
            }
        }
    }
}
