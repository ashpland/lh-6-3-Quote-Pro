//
//  QuoteBuilderViewController
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {

    @IBOutlet weak var quoteView: QuoteView!
    let thisQuote = Quote()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        thisQuote.setNewQuoteAndPhoto {
            DispatchQueue.main.async {
                self.updateQuoteView(quoteView: self.quoteView, quote: self.thisQuote)
            }
        }
        
        
        
        
        
        
    }
    
    
    private func updateQuoteView(quoteView:QuoteView, quote: Quote) {
        quoteView.quoteLabel.text = quote.quoteText
        quoteView.authorLabel.text = quote.quoteAuthor
        quoteView.photoImageView.image = quote.photo.image
    }
    
    
    // MARK: Actions
    
    @IBAction func newPhoto(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func newQuote(_ sender: UIBarButtonItem) {
    }
    

}

