//
//  Keuangan.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 26/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//
import Foundation
import UIKit
import CoreData

struct Keuangan {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var typeTransaction: [String] {
        let type = ["PENDAPATAN","PENGELUARAN"]
        return type
    }
    
    func existCategoryTransaction() -> Int {
        let categoryTrx = NSFetchRequest<NSFetchRequestResult>(entityName: "CategoryTransaction")
        do {
            let data = try context.fetch(categoryTrx)
            return data.count
        }catch(let err){
            print("Error : \(err)")
        }
        return 0
    }
    
    func insertMasterCategory(){
        let entity = NSEntityDescription.entity(forEntityName: "CategoryTransaction", in: context)!
        let task1 = NSManagedObject(entity: entity, insertInto: context)
        let task2 = NSManagedObject(entity: entity, insertInto: context)
        let task3 = NSManagedObject(entity: entity, insertInto: context)
        let task4 = NSManagedObject(entity: entity, insertInto: context)
        
        let task5 = NSManagedObject(entity: entity, insertInto: context)
        let task6 = NSManagedObject(entity: entity, insertInto: context)
        let task7 = NSManagedObject(entity: entity, insertInto: context)
        let task8 = NSManagedObject(entity: entity, insertInto: context)
        let task9 = NSManagedObject(entity: entity, insertInto: context)
        let task10 = NSManagedObject(entity: entity, insertInto: context)
        
        // PENDAPATAN
        task1.setValue("GAJI", forKey: "name")
        task1.setValue(1, forKey: "status")
        task1.setValue("PENDAPATAN", forKey: "type")
        task2.setValue("BONUS", forKey: "name")
        task2.setValue(1, forKey: "status")
        task2.setValue("PENDAPATAN", forKey: "type")
        task3.setValue("PENJUALAN", forKey: "name")
        task3.setValue(1, forKey: "status")
        task3.setValue("PENDAPATAN", forKey: "type")
        task4.setValue("PENDAPATAN LAIN-LAIN", forKey: "name")
        task4.setValue(1, forKey: "status")
        task4.setValue("PENDAPATAN", forKey: "type")
        
        //PENGELUARAN
        task5.setValue("MAKAN & MINUM", forKey: "name")
        task5.setValue(1, forKey: "status")
        task5.setValue("PENGELUARAN", forKey: "type")
        task6.setValue("BELANJA UMUM", forKey: "name")
        task6.setValue(1, forKey: "status")
        task6.setValue("PENGELUARAN", forKey: "type")
        task7.setValue("KOMUNIKASI", forKey: "name")
        task7.setValue(1, forKey: "status")
        task7.setValue("PENGELUARAN", forKey: "type")
        task8.setValue("TAGIHAN LISTRIK", forKey: "name")
        task8.setValue(1, forKey: "status")
        task8.setValue("PENGELUARAN", forKey: "type")
        task9.setValue("TAGIHAN PDAM", forKey: "name")
        task9.setValue(1, forKey: "status")
        task9.setValue("PENGELUARAN", forKey: "type")
        task10.setValue("TRANSPORTASI", forKey: "name")
        task10.setValue(1, forKey: "status")
        task10.setValue("PENGELUARAN", forKey: "type")
        
        
        do {
            try context.save()
            print("save master category success")
        }catch(let err){
            print("Error insert master category: \(err)")
        }
    }
    
    func insertMasterTypeTransaction(){
        let newData = TypeTransaction(context: self.context)
        newData.is_default = true
        newData.name = "PENGELUARAN"
        newData.status = 1
        
        do {
            try self.context.save()
            print("sukses")
        }catch (let err){
            print("Error save master type: \(err)")
        }
    }
    
    
    func resetAllRecords(in entity : String) // entity = Your_Entity_Name
    {
        
        let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
            print("Delete Success")
        }
        catch
        {
            print ("There was an error")
        }
    }
    
    func saveTransaction(data: TransactionModel){
        let entity = NSEntityDescription.entity(forEntityName: "TransactionDetails", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        
        task.setValue(data.date, forKey: "trasaction_date")
        task.setValue(data.transaction_type, forKey: "transaction_type")
        task.setValue(data.transaction_category, forKey: "transaction_category")
        task.setValue(data.description_trx, forKey: "description_trx")
        task.setValue(data.amount, forKey: "amount")
        task.setValue(data.status, forKey: "status")
        do {
            try context.save()
            print("Save Trasaction Success")
        }catch(let err){
            print("Error in save transaction :\(err)")
        }
    }
    
    func fetchTransactionAll() -> [TransactionDetails] {
        var data: [TransactionDetails] = []
        do {
            data = try context.fetch(TransactionDetails.fetchRequest())
        }catch(let err){
            print("Error fetch trx All : \(err)")
        }
        
        return data
    }
    
    func fetchTransactionAll2() -> [TransactionModel] {
        var trx = [TransactionModel]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "TransactionDetails")
        do {
            let result = try context.fetch(fetchRequest) as! [NSManagedObject]
            result.forEach { (data) in
                trx.append(
                    TransactionModel(
                        date: data.value(forKey: "trasaction_date") as! Date
                        , transaction_type: data.value(forKey: "transaction_type") as! String
                        , transaction_category: data.value(forKey: "transaction_category") as! String
                        , description_trx: data.value(forKey: "description_trx") as! String
                        , amount: data.value(forKey: "amount") as! Double
                        , status: data.value(forKey: "status") as! Int
                    )
                )
            }
            
        }catch(let err){
            print("Error when saving: \(err)")
        }
        return trx
    }
    
}



