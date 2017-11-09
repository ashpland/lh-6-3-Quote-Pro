//
//  DownloadProtocols.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import Foundation

protocol DataDownloader {
    func downloadDataAt(url: URL, completion: @escaping (DownloadResponses<Any>) -> Void)
}


enum DownloadResponses<Value> {
    case success(Data)
    case failure(String)
}
