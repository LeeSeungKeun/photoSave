//
//  Common_imgae.swift
//  CameraTest
//
//  Created by 이성근 on 2020/09/08.
//  Copyright © 2020 Draw_corp. All rights reserved.
//

import UIKit
extension UIImage {
    /// Save PNG in the Documents directory
    func save(_ name: String) {
        let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let url = URL(fileURLWithPath: path).appendingPathComponent(name)
        try! self.pngData()?.write(to: url)
        print("saved image at \(url)")
    }
}
