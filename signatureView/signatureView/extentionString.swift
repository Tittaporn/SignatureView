//
//  extentionString.swift
//  signatureView
//
//  Created by M3ts LLC on 9/16/21.
//

import Foundation
import UIKit

extension String {
    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),let data = try? Data(contentsOf: url),let image = UIImage(data: data) {
            return image
        }
        return nil
    }
}

struct AppUtility {
    // Lock landscape or portrait mode on the screen
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    // Added method to adjust lock and rotate to the desired orientation
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation:UIInterfaceOrientation) {
        self.lockOrientation(orientation)
       // print("\n\n+++++++++++ TEST  => orientation orientation : \(orientation) \(rotateOrientation) +++++++++++ AT LINE : \(#line) +++ OF \(#function) +++ IN \(#file) +++++++++++\n\n")
        UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        print("\n\n+++++++++++ TEST  => orientation orientation : \(orientation) \(rotateOrientation) +++++++++++ AT LINE : \(#line) +++ OF \(#function) +++ IN \(#file) +++++++++++\n\n")
        UINavigationController.attemptRotationToDeviceOrientation()
    }
}
