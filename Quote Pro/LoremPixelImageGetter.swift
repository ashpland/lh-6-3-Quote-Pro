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
    
    let apiURL = URL(string: "https://lorempixel.com/628/414")!
    
    var dataDownloader: DataDownloader
    
    override init() {
        self.dataDownloader = DownloadBuddy.sharedInstance
    }
    
    
    func fetchImage(completion: @escaping ((UIImage?) -> Void)) {
        self.dataDownloader
            .downloadDataAt(url: apiURL) {
                (downloadResponse) -> Void in
                
                switch (downloadResponse) {
                    
                case .success(let downloadResult):
                    let newImage = UIImage(data: downloadResult)
                    completion(newImage)
                case .failure(let error):
                    assertionFailure(error)
                    completion(nil)

                }
            }
    
    
    }
    
 
    
    
}


