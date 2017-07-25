//
//  ViewController.swift
//  TableViewResizingCell
//
//  Created by Rajeev Ruparell on 2017-07-25.
//  Copyright © 2017 Agape. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    tableView.estimatedRowHeight = 70
    tableView.rowHeight = UITableViewAutomaticDimension
    
    }

//MARK: - TableView Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyCell
        cell.textView.delegate = self
        return cell
    }
    
    
//MARK: - TextView
    func textViewDidChange(_ textView: UITextView) {
        
        //Animation and Offset code added to fix stuttering
        let currentOffset = tableView.contentOffset
        UIView.setAnimationsEnabled(false)
        tableView.beginUpdates()
        tableView.endUpdates()
        UIView.setAnimationsEnabled(true)
        tableView.setContentOffset(currentOffset, animated: false)
    }
    
}



class MyCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
}


