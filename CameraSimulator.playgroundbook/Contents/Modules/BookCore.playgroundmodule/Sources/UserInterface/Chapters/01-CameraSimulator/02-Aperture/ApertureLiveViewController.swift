//
//  ApertureLiveViewController.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/7.
//

import UIKit
import PlaygroundSupport

class ApertureLiveViewController: LiveViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var apertureImageView: UIImageView!
    @IBOutlet weak var apertureLabel: UILabel!
    
    //contentView constraints
    @IBOutlet private weak var equalWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var equalHeightConstraint: NSLayoutConstraint!
    
    
    //imageView constraints
    @IBOutlet private weak var frontImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var frontImageViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var frontImageViewRightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backImageViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var backImageViewRightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfigureView()
        
        contentView.bringSubviewToFront(frontImageView)
        
        
        
        if apertureStart {
            frontImageView.alpha = 0
            backImageView.alpha = 0
            frontImageView.image = UIImage(named: "aperture-foreground")
            backImageView.image = UIImage(named: "aperture-background")
            
            let originalImage: UIImage = UIImage(named: "aperture-background")!
            
            switch currentApertureChoice {
            case .small:
                apertureLabel.alpha = 1
                apertureImageView.alpha = 1
                apertureImageView.image = UIImage(named: "aperture-11")
                apertureLabel.text = "ƒ/11"
                
                backImageView.image = generateBlurImage(blur: 1, for: originalImage)
                break
            case .medium:
                apertureLabel.alpha = 1
                apertureImageView.alpha = 1
                apertureImageView.image = UIImage(named: "aperture-2.8")
                apertureLabel.text = "ƒ/2.8"
                
                backImageView.image = generateBlurImage(blur: 4, for: originalImage)
                break
            case .large:
                apertureLabel.alpha = 1
                apertureImageView.alpha = 1
                apertureImageView.image = UIImage(named: "aperture-1.4")
                apertureLabel.text = "ƒ/1.4"
                
                backImageView.image = generateBlurImage(blur: 15, for: originalImage)
                break
            }
            
            if currentApertureChoice == .large {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Congratulations! You can go to the next page to learn more!")
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                self.backImageView.alpha = 1
                self.frontImageView.alpha = 1
            })
            
        } else {
            frontImageView.backgroundColor = .gray
            frontImageView.image = UIImage(named: "Cover")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureView()
    }
    
    lazy var context: CIContext = {
        return CIContext(options: nil)
    }()
    
    private func generateBlurImage(blur: Float, for originalImage: UIImage) -> UIImage {
        let inputImage = CIImage(image: originalImage)
        let filter = CIFilter(name: "CIGaussianBlur")!
        filter.setValue(inputImage, forKey:kCIInputImageKey)
        filter.setValue(blur, forKey: kCIInputRadiusKey)
        let outputCIImage = filter.outputImage!
        let rect = CGRect(origin: CGPoint.zero, size: originalImage.size)
        let cgImage = context.createCGImage(outputCIImage, from: rect)
        return UIImage(cgImage: cgImage!)
    }
    
    private func initialConfigureView() {
        
        contentView.backgroundColor = .white
        
        apertureImageView.contentMode = .scaleAspectFit
        
        apertureLabel.textColor = .black
        apertureLabel.adjustsFontSizeToFitWidth = true
        apertureLabel.textAlignment = .center
        
        apertureLabel.alpha = 0
        apertureImageView.alpha = 0
        
        configureView()
    }
    
    private func configureView() {
        referenceWidth = contentView.bounds.width
        
        //contentView bounds
        if view.bounds.width / view.bounds.height > (437.0 / 834.0) {
            equalWidthConstraint.isActive = false
            equalHeightConstraint.isActive = true
        } else {
            equalWidthConstraint.isActive = true
            equalHeightConstraint.isActive = false
        }
        
        //imageView configuration
        let paddingConstant = referenceWidth * 0.05
        frontImageViewTopConstraint.constant = CGFloat(paddingConstant * 3)
        frontImageViewLeftConstraint.constant = CGFloat(paddingConstant)
        frontImageViewRightConstraint.constant = CGFloat(paddingConstant)
        
        backImageViewTopConstraint.constant = CGFloat(paddingConstant * 3)
        backImageViewLeftConstraint.constant = CGFloat(paddingConstant)
        backImageViewRightConstraint.constant = CGFloat(paddingConstant)
        
        
        //aperture image view configuration
        apertureImageView.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.3, height: referenceWidth * 0.3)
        apertureImageView.center.x = referenceWidth * 0.35
        apertureImageView.center.y = referenceWidth * 1.55
        
        
        //aperture label configuration
        apertureLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.07)
        apertureLabel.center.x = referenceWidth * 0.68
        apertureLabel.center.y = referenceWidth * 1.55
        
    }

}
