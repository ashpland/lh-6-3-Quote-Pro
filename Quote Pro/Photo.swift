//
//  Photo.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class Photo: NSObject {

    var image: UIImage?
    
    var imageGetterDelegate : ImageGetterProtocol
    
    override init() {
        self.imageGetterDelegate = LoremPixelImageGetter.sharedInstance
    }
    
    func setNewRandomImage(completion: @escaping () -> Void) {
        self.imageGetterDelegate.fetchImage { (newImage) in
            self.image = newImage
            completion()
        }
    }
}

protocol ImageGetterProtocol {
    func fetchImage(completion: @escaping ((UIImage?) -> Void))
}
    

