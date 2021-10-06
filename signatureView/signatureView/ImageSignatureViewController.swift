//
//  ImageSignatureViewController.swift
//  signatureView
//
//  Created by M3ts LLC on 9/15/21.
//

import UIKit

class ImageSignatureViewController: UIViewController {
    
    @IBOutlet weak var imvSignature: UIImageView!
    var singatureImage: UIImage?
    
    @IBOutlet weak var imgBase64: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let image = singatureImage else {return}
        imvSignature.image = image
        let base64ImageString = convertImageToBase64String(image: UIImage())
        print("\n\n+++++++++++ TEST  =>  base64ImageString : \(base64ImageString) +++++++++++ AT LINE : \(#line) +++ OF \(#function) +++ IN \(#file) +++++++++++\n\n")
        let base64Image = decodeBase64(toImage: base64ImageString)
        imgBase64.image = base64Image
    }
    
    func convertImageToBase64String(image : UIImage ) -> String {
        let strBase64 =  image.pngData()?.base64EncodedString()
        return strBase64 ?? ""
    }
    
    func decodeBase64(toImage strEncodeData: String!) -> UIImage {
        if let decData = Data(base64Encoded: strEncodeData, options: .ignoreUnknownCharacters), strEncodeData.count > 0 {
            return UIImage(data: decData)!
        }
        return UIImage()
    }
}
