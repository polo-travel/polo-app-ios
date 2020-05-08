//
//  ImageExtension.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 23/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
