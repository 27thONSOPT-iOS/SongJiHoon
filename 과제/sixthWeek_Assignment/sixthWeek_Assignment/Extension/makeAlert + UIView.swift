//
//  makeAlert + UIView.swift
//  sixthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/27.
//

import Foundation
import UIKit

public func makeAlert(title : String, message : String, vc : UIViewController)
{
    let alertViewController = UIAlertController(title: title, message: message,
                                                preferredStyle: .alert)
    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
    alertViewController.addAction(action)
    vc.present(alertViewController, animated: true, completion: nil)
}

