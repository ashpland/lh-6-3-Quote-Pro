//
//  QuoteTableViewCell.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-09.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    @IBOutlet weak var quoteImage: UIImageView!
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quoteText: UILabel!
    
    var thisQuote : Quote! {
        didSet {
            self.setupCell()
        }
    }
    
    private func setupCell() {
        self.quoteAuthor.text = self.thisQuote.quoteAuthor
        self.quoteText.text = self.thisQuote.quoteText
        self.quoteImage.image = self.thisQuote.combinedImage
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
