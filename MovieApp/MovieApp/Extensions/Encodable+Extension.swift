//
//  Encodable+Extension.swift
//  MovieApp
//
//  Created by AlephHV2D on 03/07/21.
//

import Foundation

import Foundation
extension Encodable {
    var dictionary: [String: Any]? {
        let encoder: JSONEncoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        guard let data = try? encoder.encode(self) else { return nil }
        return (try? JSONSerialization
            .jsonObject(with: data, options: .allowFragments))
            .flatMap { $0 as? [String: Any] }
    }
}
