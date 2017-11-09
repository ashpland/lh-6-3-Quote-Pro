//
//  QuoteBuilderViewController
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var quoteView: QuoteView!
    let thisQuote = Quote()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
        
        
        thisQuote.setNewQuoteAndPhoto {
            self.updateQuoteView(quoteView: self.quoteView, quote: self.thisQuote)
        }
        
        
        
        
        
        
    }
    
    
    private func updateQuoteView(quoteView:QuoteView, quote: Quote) {
        DispatchQueue.main.async {
            quoteView.quoteLabel.text = quote.quoteText
            quoteView.authorLabel.text = quote.quoteAuthor
            quoteView.photoImageView.image = quote.photo.image
        }
    }
    
    
    
    
    // MARK: Actions
    
    @IBAction func newPhoto(_ sender: UIBarButtonItem) {
        thisQuote.setNewPhoto {
            self.updateQuoteView(quoteView: self.quoteView, quote: self.thisQuote)
        }
    }
    
    @IBAction func newQuote(_ sender: UIBarButtonItem) {
        thisQuote.setNewQuote {
            self.updateQuoteView(quoteView: self.quoteView, quote: self.thisQuote)
        }
    }
    
    // Back button pressed
    override func willMove(toParentViewController parent: UIViewController?) {
        thisQuote.combinedImage = snapshot(of: quoteView)
    }
    
    private func snapshot(of view:UIView) -> UIImage? {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let snapshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return snapshot
    }
    

}

