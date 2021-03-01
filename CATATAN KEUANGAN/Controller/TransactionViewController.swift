//
//  TransactionViewController.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 26/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import UIKit
import CoreData
import CurrencyTextField

class TransactionViewController: UIViewController {
    @IBOutlet weak var typeTransactionPickerView: UIPickerView!
    @IBOutlet weak var categoryTransactionPickerView: UIPickerView!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    let sf = SupportFiles()
    let keu = Keuangan()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemType: [TypeTransactionModel]?
    var itemCategory: [CategoryTransaction]?
    var selectedTypeTrx: String = ""
    var selectedCategory: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeTransactionPickerView.delegate = self
        typeTransactionPickerView.dataSource = self
        categoryTransactionPickerView.delegate = self
        categoryTransactionPickerView.dataSource = self
        descriptionTextField.delegate = self
        amountTextField.delegate = self
        
        customUI()
        defaultValue()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadCategoryTrx(with: self.selectedTypeTrx)
        
    }
    
    
    // MARK: Submit Button
    @IBAction func submitBtnPressed(_ sender: UIButton) {
        print(getDatePicker())
        print(selectedCategory)
        print(selectedTypeTrx)
    }
    
    
    
    func fetchTypeTransaction(){
        let typeContext = NSFetchRequest<NSFetchRequestResult>(entityName: "TypeTransaction")
        do {
            let data = try context.fetch(typeContext)
            DispatchQueue.main.async {
                self.typeTransactionPickerView.reloadAllComponents()
            }
        }catch(let err){
            print("error pickerview: \(err)")
        }
    }
    //
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
    
    
}

// MARK: UI & Default
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
        
        amountTextField.keyboardType = UIKeyboardType.decimalPad
        descriptionTextField.autocapitalizationType = .allCharacters
    }
    
    func defaultValue(){
        let datas = typeTransactionPickerView.selectedRow(inComponent: 0)
        let category = categoryTransactionPickerView.selectedRow(inComponent: 0)
        self.selectedTypeTrx = keu.typeTransaction[datas]
        self.selectedCategory = itemCategory?[0].name ?? "kkk"
        
    }
    
}

// MARK: Picker View
extension TransactionViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case typeTransactionPickerView:
            return keu.typeTransaction.count
        case categoryTransactionPickerView:
            return itemCategory?.count ?? 0
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case typeTransactionPickerView:
            return keu.typeTransaction[row]
            
        case categoryTransactionPickerView:
            self.selectedCategory = self.itemCategory?[row].name ?? ""
            let data = self.itemCategory?[row].name
            return data
            
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case typeTransactionPickerView:
            self.selectedTypeTrx = keu.typeTransaction[row]
            DispatchQueue.main.async {
                self.loadCategoryTrx(with: self.selectedTypeTrx)
            }
            
        case categoryTransactionPickerView:
            self.selectedCategory = itemCategory?[row].name ?? ""
        default:
            return
        }
        
        
    }
}

// MARK: Date Picker
extension TransactionViewController  {
    func getDatePicker() -> Date {
        myDatePicker.datePickerMode = .date
        return myDatePicker.date
    }
}


// MARK: CORE DATA
extension TransactionViewController {
    func loadCategoryTrx(with type: String){
        do {
            let request = CategoryTransaction.fetchRequest() as NSFetchRequest<CategoryTransaction>
            let pred = NSPredicate(format: "type CONTAINS %@", type)
            request.predicate = pred
            
            self.itemCategory = try context.fetch(request)
            DispatchQueue.main.async {
                self.categoryTransactionPickerView.reloadAllComponents()
                //                print(self.itemCategory)
            }
        }catch(let err){
            print(err)
        }
    }
}

extension TransactionViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.text = textField.text?.uppercased()
//    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = textField.text?.uppercased()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        switch textField {
        case amountTextField:
            textField.text = "Rp. 0.00"
            return false
        default:
            return false
        }
        
    }
    
    //Textfield delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text: NSString = (textField.text ?? "") as NSString
        let finalString = text.replacingCharacters(in: range, with: string)

        // 'currency' is a String extension that doews all the number styling
        amountTextField.text = finalString.currency

        // returning 'false' so that textfield will not be updated here, instead from styling extension
        return false
    }
}


extension String {
    var currency: String {
        // removing all characters from string before formatting
        let stringWithoutSymbol = self.replacingOccurrences(of: "Rp", with: "")
        let stringWithoutComma = stringWithoutSymbol.replacingOccurrences(of: ",", with: "")

        let styler = NumberFormatter()
        styler.minimumFractionDigits = 0
        styler.maximumFractionDigits = 0
        styler.currencySymbol = "Rp"
        styler.numberStyle = .currency

        if let result = NumberFormatter().number(from: stringWithoutComma) {
            return styler.string(from: result)!
        }

        return self
    }
}
