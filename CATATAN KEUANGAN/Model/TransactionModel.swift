//
//  TransactionModel.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 01/03/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation

struct TransactionModel {
    let date: Date
    let transaction_type: String
    let transaction_category: String
    let description_trx: String
    let amount: Double
    let status: Int
}


struct TypeTransactionModel {
    var name: String
    var status: Int
    var is_default: Bool
}
