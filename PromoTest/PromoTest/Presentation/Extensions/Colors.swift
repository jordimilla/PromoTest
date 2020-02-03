//
//  Colors.swift
//  PromoTest
//
//  Created by Jordi Milla on 03/02/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

extension UIColor{

  var hexString:String? {
    if let components = self.cgColor.components {
        if components.count > 2 {
            let r = components[0]
            let g = components[1]
            let b = components[2]
            return  String(format: "%02X%02X%02X", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }else {
            return  String(format: "%02X%02X%02X", (Int)(1 * 255), (Int)(1 * 255), (Int)(1 * 255))
        }
    }
    return nil
  }
}
