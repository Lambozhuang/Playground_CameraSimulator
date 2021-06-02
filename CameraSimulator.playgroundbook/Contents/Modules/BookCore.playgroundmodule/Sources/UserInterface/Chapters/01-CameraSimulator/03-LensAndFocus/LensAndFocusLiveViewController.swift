//
//  FocusLiveViewController.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/14.
//

import UIKit
import PlaygroundSupport

class LensAndFocusLiveViewController: LiveViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var focusLabel: UILabel!
    
    //contentView constraints
    @IBOutlet private weak var equalWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var equalHeightConstraint: NSLayoutConstraint!
    
    //imageView constraints
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewRightConstraint: NSLayoutConstraint!
    
    //pickerView constraints
    @IBOutlet weak var pickerViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var pickerViewWidth: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfigureView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        
        
        let currentImage: UIImage = UIImage(named: "length-\(currentLensChoice.focalLengthRange[pickerView.selectedRow(inComponent: 0)])")!
        let currentBlurImage: UIImage = generateBlurImage(blur: Float(focusDistance.count - pickerView.selectedRow(inComponent: 1) - 1), for: currentImage)
        if lensAndFocusStart {
            imageView.alpha = 0
            imageView.image = currentBlurImage
        } else {
            imageView.image = UIImage(named: "Cover")
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.imageView.alpha = 1
        })
        
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
        rangeLabel.textAlignment = .center
        focusLabel.textAlignment = .center
        imageView.contentMode = .scaleAspectFill
        
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
        imageViewTopConstraint.constant = CGFloat(paddingConstant * 3)
        imageViewLeftConstraint.constant = CGFloat(paddingConstant)
        imageViewRightConstraint.constant = CGFloat(paddingConstant)
        
        //pickerView configuration
        pickerViewWidth.constant = referenceWidth * 0.8
        pickerViewTopConstraint.constant = referenceWidth * 0.35
        
        //labels
        rangeLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.05)
        rangeLabel.center.x = referenceWidth * 0.3
        rangeLabel.center.y = referenceWidth * 1.4
        
        focusLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.05)
        focusLabel.center.x = referenceWidth * 0.7
        focusLabel.center.y = referenceWidth * 1.4
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if lensAndFocusStart {
            switch component {
            case 0:
                let currentImage: UIImage = UIImage(named: "length-\(currentLensChoice.focalLengthRange[row])")!
                let currentBlurImage: UIImage = generateBlurImage(blur: Float(focusDistance.count - pickerView.selectedRow(inComponent: 1)), for: currentImage)
                imageView.image = currentBlurImage
                break
            case 1:
                let currentImage: UIImage = UIImage(named: "length-\(currentLensChoice.focalLengthRange[pickerView.selectedRow(inComponent: 0)])")!
                let currentBlurImage: UIImage = generateBlurImage(blur: Float(focusDistance.count - pickerView.selectedRow(inComponent: 1)), for: currentImage)
                imageView.image = currentBlurImage
                break
            default:
                break
            }
            
            if currentLensChoice == .telephoto && pickerView.selectedRow(inComponent: 1) == focusDistance.count - 1 {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Congratulations! You can go to the next page to learn more!")
            }
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(currentLensChoice.focalLengthRange[row])
        } else if component == 1 {
            return focusDistance[row]
        }
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return currentLensChoice.focalLengthRange.count
        } else if component == 1 {
            return 10
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
}
