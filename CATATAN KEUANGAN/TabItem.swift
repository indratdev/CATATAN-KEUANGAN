//
//  TabItem.swift
//  CATATAN KEUANGAN
//
//  Created by IndratS on 25/02/21.
//  Copyright © 2021 IndratSaputra. All rights reserved.
//

import Foundation
import UIKit

enum TabItem: String, CaseIterable {
    case home = "home"
    case report = "report"
    case setting = "setting"
    
//    var viewController: UIViewController {
//        switch self {
//        case .home:
//            return HomeViewController()
//        case .report:
//            return ReportViewController()
//        case .setting:
//            return SettingViewController()
//        }
//    }
//
//    //icon
//    var icon: UIImage {
//        switch self {
//        case .home:
//            return UIImage(named: "ic_home")
//        case .report:
//            return UIImage(named: "ic_report")
//        case .setting:
//            return UIImage(named: "ic_setting")
//        }
//    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
