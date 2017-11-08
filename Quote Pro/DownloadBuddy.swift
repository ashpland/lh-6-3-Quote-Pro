//
//  DownloadBuddy.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit



class DownloadBuddy: NSObject, JSONDownloader, FileDownloader {
    
    let defaultSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask?
    var errorMessage: String?

    func downloadJSONAt(url: URL, completion: (DownloadResponses<Any>) -> Void) {
        
        
        
        
        
        
        completion(DownloadResponses.success("Nice"))
    }
    
    
    
//    func downloadJSONAt(url: URL, completion: (Data, Error) -> Void) {
//
//        dataTask = defaultSession.dataTask(with: url) {
//            data, response, error in defer { self.dataTask = nil }
//
//
//            if let error = error {
//                self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
//            } else if let data = data,
//                let response = response as? HTTPURLResponse,
//                response.statusCode == 200 {
//                self.updateSearchResults(data)
//                // 6
//                DispatchQueue.main.async {
//                    completion(<#T##Data#>, <#T##Error#>)
//
//                }
//            }
//        }
//        // 7
//        dataTask?.resume()
//
//
//
//
//    }
    
    
}
