//
//  ViewController.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-08.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let testQuote = Quote()
        
        testQuote.setNewQuoteAndPhoto {
            print("Quote: \(testQuote.quoteText) \nAuthor: \(testQuote.quoteAuthor)")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

