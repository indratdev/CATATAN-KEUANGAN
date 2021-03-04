//
//  TransactionTableViewCell.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 03/03/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    static let identifier = "TransactionAllIdentifier"
    static let keu = Keuangan()
    static let sf = SupportFiles()
    
    var setDataLayout: TransactionDetails! {
        didSet {
            if let type = setDataLayout.transaction_type, let desc = setDataLayout.description_trx {
                typeLabel.text = type
                descriptionLabel.text = desc
                amountLabel.text = String(setDataLayout.amount)
                setTextColor(value: type)
            }
        }

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setTextColor(value: String){
        typeLabel.font = UIFont.boldSystemFont(ofSize: TransactionTableViewCell.sf.sizeFontType)
        if value == "PENDAPATAN" {
            typeLabel.textColor = .systemGreen
        }else{
            typeLabel.textColor = .systemRed
        }
    }
}
