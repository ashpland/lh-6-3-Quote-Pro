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
    
    func fetchMashupQuote(completion: @escaping ((QuoteInfo?) -> Void)) {
        self.dataDownloader
            .downloadDataAt(url: apiURL) {
                (firstDownloadResponse) -> Void in
                
                switch (firstDownloadResponse) {
                case .success(let firstDownloadResult):
                    print("nice")
                    if let firstQuote = self.getQuoteFromJSON(rawJSON: firstDownloadResult) {
                        self.dataDownloader.downloadDataAt(url: self.apiURL, completion: { (secondDownloadResponse) in
                            switch (secondDownloadResponse) {
                                
                            case .success(let secondDownloadResult):
                                if let secondQuote = self.getQuoteFromJSON(rawJSON: secondDownloadResult) {
                                    if (!secondQuote.quoteAuthor.isEmpty) {
                                        let newQuote = QuoteInfo(text: firstQuote.quoteText, author: secondQuote.quoteAuthor)
                                        completion(newQuote)
                                    }
                                }
                            default:
                                break
                            }
                        })
                    }
                default:
                   break
                }
        }
    }
    
    
    
    private func getQuoteFromJSON(rawJSON: Data) -> QuoteInfo? {
        
        do {
            if let json = try JSONSerialization.jsonObject(with: rawJSON) as? [String: Any] {
                if let quoteText = json["quoteText"] as? String,
                    !quoteText.isEmpty{
                    
                    if let quoteAuthor = json["quoteAuthor"] as? String {
                        let newQuote = QuoteInfo(text: quoteText, author: quoteAuthor)
                        return newQuote
                    }
                }
            }
        } catch {
            print("Error deserializing JSON: \(error)")
            return nil
        }
        
        return nil
    }
    
    
    
    
}
