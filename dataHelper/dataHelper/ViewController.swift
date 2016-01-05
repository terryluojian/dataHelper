//
//  ViewController.swift
//  dataHelper
//
//  Created by jianluo on 16/1/5.
//  Copyright © 2016年 jianluo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileLocation = NSBundle.mainBundle().pathForResource("testCSV", ofType: "csv")!
        
        let error: NSErrorPointer = nil
        
        if let csv = CSV(contentsOfFile: fileLocation, error: error) {
            // Rows
            let rows = csv.rows
            let headers = csv.headers  //=> ["id", "name", "age"]
            let a = csv.rows[0]    //=> ["id": "1", "name": "Alice", "age": "18"]
            let b = csv.rows[1]      //=> ["id": "2", "name": "Bob", "age": "19"]
            print("\n\(headers)\(a)\n\(b)")
            // Columns
            let columns = csv.columns
            let id = csv.columns["id"]  //=> ["Alice", "Bob", "Charlie"]
            let c = csv.columns["content"]    //=> ["18", "19", "20"]
            print("\n\(columns)\(id)\n\(c)")

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

