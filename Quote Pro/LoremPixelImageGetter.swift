//
//  LoremPixelImageGetter.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class LoremPixelImageGetter: NSObject, ImageGetterProtocol {
    
    
   
    static let sharedInstance = LoremPixelImageGetter()
    
    let apiURL = URL(string: "http://lorempixel.com/200/300")!
    
    var fileDownloader: FileDownloader
    var dataDownloader: DataDownloader
    
    override init() {
        self.fileDownloader = DownloadBuddy.sharedInstance
        self.dataDownloader = DownloadBuddy.sharedInstance
    }
    
    
    func fetchImage(completion: @escaping ((UIImage?) -> Void)) {
//        
    }
    
    
//    func fetchImage(completion: @escaping ((UIImage?) -> Void)) {
//        self.fileDownloader
//            .downloadFileAt(url: apiURL, completion:{
//                (downloadResponse) -> Void in
//
//                switch (downloadResponse) {
//                case .success(let downloadResult):
//                    if let localURL = downloadResult as? URL {
//                        let newImage = UIImage(
//
//                    }
//                }
//
//                completion(nil)
//
//
//            })
//
//
//    }

    
    
}
