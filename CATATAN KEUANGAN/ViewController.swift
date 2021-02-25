//
//  ViewController.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 25/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var appNameLabel: UILabel!
    
    let sf = SupportFiles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initialLoad()
    }
}


extension ViewController {
    func initialLoad(){
        // title app
        appNameLabel.text = sf.app_name
        appNameLabel.textAlignment = .center
        appNameLabel.textColor = sf.textColor
        appNameLabel.font = UIFont.boldSystemFont(ofSize: sf.sizeFontTitle)
        
    }
}

