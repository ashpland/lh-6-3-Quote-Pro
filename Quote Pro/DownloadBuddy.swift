//
//  DownloadBuddy.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit



class DownloadBuddy: NSObject, DataDownloader {

    static let sharedInstance = DownloadBuddy();
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var downloadTask: URLSessionDownloadTask?
    var errorMessage: String?

    func downloadDataAt(url: URL, completion: @escaping (DownloadResponses<Any>) -> Void) {

        dataTask = defaultSession.dataTask(with: url) {
            data, response, error in defer { self.dataTask = nil }
            
            if let error = error {
                completion(DownloadResponses.failure(error.localizedDescription))
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                completion(DownloadResponses.success(data))
            }
        }
        
        dataTask?.resume()
    }
}
