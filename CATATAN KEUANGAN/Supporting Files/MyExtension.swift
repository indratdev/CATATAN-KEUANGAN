import Foundation
import UIKit

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


extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertWarning(message: String){
        let alertController = UIAlertController(title: "Peringatan", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // add image
        let imageIcon = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        imageIcon.image = UIImage(named: "warning_ic")
        alertController.view.addSubview(imageIcon)
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertSaving(){
        let alertController = UIAlertController(title: "Konfirmasi", message: "Apakah Anda Yakin Untuk Simpan Data ?", preferredStyle: .alert)
        let actionOK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let actionCancel = UIAlertAction(title: "BATAL", style: .cancel, handler: nil)
        
        alertController.addAction(actionOK)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
