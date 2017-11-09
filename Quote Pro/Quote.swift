//
//  Quote.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class Quote: NSObject {
    var quoteText : String
    var quoteAuthor : String
    var photo : Photo
    
    var quoteGetterDelegate : QuoteGetterProtocol
    
    override init() {
        quoteGetterDelegate = ForismaticQuoteGetter.sharedInstance
        quoteText = ""
        quoteAuthor = ""
        photo = Photo()
    }
    
    func setNewQuoteAndPhoto(completion: @escaping () -> Void) {
        self.setNewQuote {
            self.setNewPhoto {
                completion()
            }
        }
    }
    
    func setNewQuote(completion: @escaping () -> Void ) {
        self.quoteGetterDelegate.fetchQuote { (quoteInfo) in
            if let quoteInfo = quoteInfo {
                self.quoteText = quoteInfo.quoteText
                
                // If there isn't a quote author, set it to Ke$ha 'cause that's great
                self.quoteAuthor = quoteInfo.quoteAuthor.isEmpty ? "Ke$ha" : quoteInfo.quoteAuthor
                completion()
            }
            
            // If quotes are failing, put error handling in here
            else {
                self.setNewQuote {
                    completion()
                }
            }
        }
    }
    
    func setNewPhoto(completion: @escaping () -> Void) {
        self.photo.setNewRandomImage(completion: {
            completion()
        })
    }
    
    
}

protocol QuoteGetterProtocol {    
    func fetchQuote(completion: @escaping ((_ quoteInfo: QuoteInfo?) -> Void))
    func fetchMashupQuote(completion: @escaping ((_ quoteInfo: QuoteInfo?) -> Void))
}

//extension QuoteGetterProtocol {
//    func fetchMashupQuote(completion: @escaping ((_ quoteInfo: QuoteInfo?) -> Void)) {
//        self.fetchQuote(completion: $0)
//    }
//}

struct QuoteInfo {
    var quoteText: String
    var quoteAuthor: String
    
    init(text: String, author: String) {
        self.quoteText = text
        self.quoteAuthor = author
    }
}
