//
//  APIClient.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

protocol APIClient {
    func remoteCall(withMethod method: String, path: String, params: [AnyHashable: Any]?, callback: ((Bool, Data?) -> Void))
}

class APIClientMock: APIClient {
    var successMock: Bool = true
    var jsonFilename: String?

    init(jsonFilename: String) {
        self.jsonFilename = jsonFilename
    }

    func remoteCall(withMethod method: String, path: String, params: [AnyHashable: Any]?, callback: ((Bool, Data?) -> Void)) {
        guard let jsonFilename = jsonFilename, successMock else { return callback(successMock, nil) }
        callback(successMock, fetchLocalJson(jsonFilename))
    }

    private func fetchLocalJson(_ path: String) -> Data? {
        let bundlePath = Bundle(for: APIClientMock.self).path(forResource: path, ofType: "json")!
        return try? Data(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)
    }

}
