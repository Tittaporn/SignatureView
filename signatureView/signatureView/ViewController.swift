//
//  ViewController.swift
//  signatureView
//
//  Created by M3ts LLC on 9/15/21.
//

import UIKit
import SwiftSignatureView
class ViewController: UIViewController {
    
    var singatureImage: UIImage?
    @IBOutlet weak var signatureView: SwiftSignatureView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        print("No signature image!")
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        signatureView.clear()
    }
    
    @IBAction func acceptButtonTapped(_ sender: Any) {
        print("Save signature image!")
        singatureImage = signatureView.getCroppedSignature()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "acceptAndSegueToImageVC" {
            guard let destinationVC = segue.destination as? ImageSignatureViewController else {return}
            destinationVC.singatureImage = singatureImage
        }
    }
    
    
}

