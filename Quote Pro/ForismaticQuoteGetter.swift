//
//  ForismaticQuoteGetter.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class ForismaticQuoteGetter: NSObject, QuoteGetterProtocol {
  
    let apiURL = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")
    
    var jsonDownloader: JSONDownloader
    
    override init() {
        jsonDownloader = DownloadBuddy()
    }
    
    func fetchQuote(completion: ((QuoteInfo?) -> Void)) {
        self.jsonDownloader
            .downloadJSONAt(url: apiURL!, completion:{
                (downloadResponse) -> Void in
                
                switch (downloadResponse) {
                    
                case .success(let downloadResult):
                    if let download = downloadResult as? Data {
                        let newQuote = self.getQuoteFromJSON(rawJSON: download)
                        completion(newQuote)
                    }
                    else {
                        assertionFailure("Download result isn't Data")
                        completion(nil)
                    }
                    
                case .failure(let error):
                    assertionFailure(error.localizedDescription)
                    completion(nil)
                }
            })
    }
    
    private func getQuoteFromJSON(rawJSON: Data) -> QuoteInfo? {
        
        var newQuote = QuoteInfo()
        
        do {
            if let json = try JSONSerialization.jsonObject(with: rawJSON) as? [String: Any] {
                if let quoteText = json["quoteText"] as? String {
                    newQuote.quoteText = quoteText
                }
                if let quoteAuthor = json["quoteAuthor"] as? String {
                    newQuote.quoteAuthor = quoteAuthor
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
        
        return newQuote
    }
    
    
    
    
}
