import Foundation
import UIKit

struct Validate {
    
    // validasi textfield jika ada yang kosong
    func validateTextField(tf: [UITextField]) -> Bool {
        for data in tf {
            if data.text!.isEmpty {
                return false
            }
        }
        return true
    }
    
}
