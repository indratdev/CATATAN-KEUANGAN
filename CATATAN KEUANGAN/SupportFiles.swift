//
//  SupportFiles.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 25/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import UIKit

struct SupportFiles {
    var sizeFontTitle:CGFloat = CGFloat(18)
    var textColor: UIColor = UIColor(named: "black") ?? UIColor.black
    let cornerRadiusValue: CGFloat = 10
    
    var app_name: String {
      return "CATATAN KEUANGAN"
    }
    
    func cancelButtonProcess(controller: ViewController){
        controller.navigationController?.popViewController(animated: true)
        controller.dismiss(animated: true, completion: nil)
    }
}
