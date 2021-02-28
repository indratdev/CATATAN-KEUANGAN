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
    let keu = Keuangan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoad()
        checkDataCategory()

//        keu.resetAllRecords(in: "TypeTransaction")
//        keu.resetAllRecords(in: "CategoryTransaction")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
}


extension ViewController {
    
    func initialLoad(){
        viewStatus.layer.cornerRadius = sf.cornerRadiusValue
        viewTransaction.layer.cornerRadius = sf.cornerRadiusValue
    }
    
    func checkDataCategory(){
        let countCategory = keu.existCategoryTransaction()
        if countCategory == 0 {
            keu.insertMasterCategory()
        }else{
            print("master category data already exist: \(countCategory)")
        }
    }
}

