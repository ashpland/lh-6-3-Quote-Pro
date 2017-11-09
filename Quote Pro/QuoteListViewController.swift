//
//  QuoteListViewController.swift
//  Quote Pro
//
//  Created by Andrew on 2017-11-09.
//  Copyright © 2017 hearthedge. All rights reserved.
//

import UIKit

class QuoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var quoteArray = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = self.tableView.bounds.size.height / 2.5
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quoteArray.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell

        cell.thisQuote = quoteArray[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            quoteArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
        
        let activityViewController = UIActivityViewController(activityItems: [quoteArray[indexPath.row].combinedImage!], applicationActivities: nil)
        navigationController?.present(activityViewController, animated: true)

        
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "NewQuoteSegue") {
            let quoteBuilderVC = segue.destination as? QuoteBuilderViewController
            let newQuote = Quote()
            quoteArray.append(newQuote)
            quoteBuilderVC?.thisQuote = newQuote
        }
    }
}
