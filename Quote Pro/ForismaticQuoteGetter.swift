//
//  ForismaticQuoteGetter.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class ForismaticQuoteGetter: NSObject, QuoteGetterProtocol {
  
    static let sharedInstance = ForismaticQuoteGetter()
    
    let apiURL = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
    
    var dataDownloader: DataDownloader
    
    override init() {
        dataDownloader = DownloadBuddy.sharedInstance
    }
    
    func fetchQuote(completion: @escaping ((QuoteInfo?) -> Void)) {
        self.dataDownloader
            .downloadDataAt(url: apiURL) {
                (downloadResponse) -> Void in
                
                switch (downloadResponse) {
                case .success(let downloadResult):
                    let newQuote = self.getQuoteFromJSON(rawJSON: downloadResult)
                    completion(newQuote)
                case .failure(let error):
                    assertionFailure(error)
                    completion(nil)
                }
            }
    }
    
    private func getQuoteFromJSON(rawJSON: Data) -> QuoteInfo? {
        
        do {
            if let json = try JSONSerialization.jsonObject(with: rawJSON) as? [String: Any] {
                if let quoteText = json["quoteText"] as? String,
                    !quoteText.isEmpty{
                    let quoteAuthor = json["quoteAuthor"] as? String
                    
                    let newQuote = QuoteInfo(text: quoteText, author: quoteAuthor)
                    
                    return newQuote
                }
                
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
        
        return nil
    }
    
    
    
    
}
