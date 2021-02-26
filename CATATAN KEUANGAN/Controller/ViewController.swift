//
//  ViewController.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 25/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewStatus: UIView!
    @IBOutlet weak var viewTransaction: UIView!
    
    let sf = SupportFiles()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       initialLoad()
    }
}


extension ViewController {
    
    func initialLoad(){
        viewStatus.layer.cornerRadius = sf.cornerRadiusValue
        viewTransaction.layer.cornerRadius = sf.cornerRadiusValue
    }
}

