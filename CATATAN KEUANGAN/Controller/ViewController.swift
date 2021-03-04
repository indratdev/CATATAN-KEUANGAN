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
    @IBOutlet weak var transactionTableView: UITableView!
    
    let sf = SupportFiles()
    let keu = Keuangan()
    //    var data: [TransactionModel] = [TransactionModel]()
    var data: [TransactionDetails]?
    let transactionCell = TransactionTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoad()
        checkDataCategory()
        loadDelegate()
        
        //        keu.resetAllRecords(in: "TypeTransaction")
        //        keu.resetAllRecords(in: "CategoryTransaction")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reloadTableView()
    }
    
    func loadDelegate(){
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
        
        let uib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        transactionTableView.register(uib, forCellReuseIdentifier: TransactionTableViewCell.identifier)
    }
    
}


extension ViewController {
    func initialLoad(){
        let datas = [viewStatus, viewTransaction, transactionTableView]
        sf.settViewCornerRadius(view: datas)
    }
    
    func checkDataCategory(){
        let countCategory = keu.existCategoryTransaction()
        if countCategory == 0 {
            keu.insertMasterCategory()
        }else{
            print("master category data already exist: \(countCategory)")
        }
    }
    
    func reloadTableView(){
        self.data = keu.fetchTransactionAll()
        //        let aaa = keu.fetchTransactionAll()
        DispatchQueue.main.async {
            self.transactionTableView.reloadData()
        }
    }
}

// MARK: Table View
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionTableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.identifier, for: indexPath) as! TransactionTableViewCell
        cell.setDataLayout = data![indexPath.row]
        
        return cell
    }
    
    // automatic height row table
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
}
