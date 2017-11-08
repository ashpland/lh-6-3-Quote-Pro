//
//  Quote.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class Quote: NSObject {
    var quoteText : String?
    var quoteAuthor : String?
    var photo : Photo?
    
    var quoteGetterDelegate : QuoteGetterProtocol
    
    override init() {
        quoteGetterDelegate = ForismaticQuoteGetter()
    }
    
    func setNewQuote() {
        self.quoteGetterDelegate.fetchQuote { (quoteInfo) in
            self.quoteText = quoteInfo?.quoteText ?? ""
            self.quoteAuthor = quoteInfo?.quoteAuthor ?? ""
        }
    }
    
    
}

protocol QuoteGetterProtocol {    
    func fetchQuote(completion: ((_ quoteInfo: QuoteInfo?) -> Void))
}

struct QuoteInfo {
    var quoteText: String?
    var quoteAuthor: String?
}
