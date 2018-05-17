//
//  APIClient.swift
//  Stash
//
//  Created by Gino Wu on 5/16/18.
//  Copyright © 2018 Gino Wu. All rights reserved.
//

import Foundation

protocol APIClient {
    func remoteCall(withMethod method: String, path: String, params: [AnyHashable: Any]?, callback: ((Bool, Any?) -> Void))
}

class APIClientMock: APIClient {
    var successMock: Bool = true
    var jsonFilename: String?

    init(jsonFilename: String) {
        self.jsonFilename = jsonFilename
    }

    func remoteCall(withMethod method: String, path: String, params: [AnyHashable: Any]?, callback: ((Bool, Any?) -> Void)) {
        guard let jsonFilename = jsonFilename, successMock else { return callback(successMock, nil) }
        callback(successMock, fetchLocalJson(jsonFilename))
    }

    private func fetchLocalJson<T>(_ path: String) -> T {
        let bundlePath = Bundle(for: APIClientMock.self).path(forResource: path, ofType: "json")!
        var parsedFile: T? = nil
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: bundlePath), options: .mappedIfSafe)

            if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as Any? {
                parsedFile = jsonResult as? T
            } else {
                assert(false, "Could not seralize local json")
            }
        } catch {
            assert(false, "Error Could not read json")
        }

        return parsedFile!
    }

}
