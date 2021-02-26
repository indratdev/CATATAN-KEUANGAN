//
//  TransactionViewController.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 26/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController {
    @IBOutlet weak var typeTransactionPickerView: UIPickerView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    let sf = SupportFiles()
    let keu = Keuangan()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeTransactionPickerView.delegate = self
        typeTransactionPickerView.dataSource = self
        
        customUI()
    }
    
    
}

extension TransactionViewController {
    func customUI(){
        submitBtn.layer.cornerRadius = sf.cornerRadiusValue
        submitBtn.backgroundColor = .systemGreen
        submitBtn.setTitle("Simpan", for: .normal)
        submitBtn.setTitleColor(.systemBackground, for: .normal)
        cancelBtn.layer.cornerRadius = sf.cornerRadiusValue
        cancelBtn.setTitle("Batal", for: .normal)
        cancelBtn.backgroundColor = .systemRed
        cancelBtn.setTitleColor(.systemBackground, for: .normal)
        
    }
}

extension TransactionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return keu.typeTransaction.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let data = keu.typeTransaction
        return "\(data[row])"
    }
}
