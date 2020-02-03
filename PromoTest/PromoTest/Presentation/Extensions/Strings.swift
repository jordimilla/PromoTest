//
//  Strings.swift
//  PromoTest
//
//  Created by Jordi Milla on 03/02/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import UIKit

extension String {
    func htmlAttributed(family: String?, size: CGFloat, color: UIColor) -> NSAttributedString? {

      let sizeInPx = (size * 0.75)

      do {
        let htmlCSSString = "<style>" +
          "html *" +
          "{" +
          "font-size: \(sizeInPx)pt !important;" +
          "color: \(color.hexString ?? "#000000") !important;" +
          "font-family: \(family ?? "SFUIText-Regular"), SFUIText !important;" +
        "}</style> \(self)"

        guard let data = htmlCSSString.data(using: String.Encoding.utf8) else {
          return nil
        }

        return try NSAttributedString(data: data,
                                      options: [.documentType: NSAttributedString.DocumentType.html,
                                                .characterEncoding: String.Encoding.utf8.rawValue],
                                      documentAttributes: nil)
      } catch {
        print("error: ", error)
        return nil
      }
    }
}
