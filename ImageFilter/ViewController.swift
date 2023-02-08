//
//  ViewController.swift
//  ImageFilter
//
//  Created by Ryotaro Yabuzuka on 2023/02/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let ciImage = CIImage(image: imageView.image!)
        
        //filterのタイプを表す
        //CIPhotoEffectMonoはモノクロの設定
//        let filter = CIFilter(name: "CIPhotoEffectMono")!
        
        let filter = sepiaFilter(ciImage!, intensity: 0.9)
        self.imageView.image = UIImage(ciImage: filter!)

    }
    
    func sepiaFilter(_ input: CIImage, intensity: Double) -> CIImage? {

           let sepiaFilter = CIFilter(name: "CISepiaTone")
           sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
           sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
           return sepiaFilter?.outputImage
       }

}

