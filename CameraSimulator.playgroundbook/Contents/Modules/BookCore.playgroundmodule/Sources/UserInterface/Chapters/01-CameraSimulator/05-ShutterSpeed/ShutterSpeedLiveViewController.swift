//
//  ShutterSpeedLiveViewController.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/16.
//

import UIKit
import PlaygroundSupport

class ShutterSpeedLiveViewController: LiveViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var apertureLabel: UILabel!
    @IBOutlet weak var isoLabel: UILabel!
    @IBOutlet weak var shutterSpeedLabel: UILabel!
    @IBOutlet weak var apertureImageView: UIImageView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    //contentView constraints
    @IBOutlet private weak var equalWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var equalHeightConstraint: NSLayoutConstraint!
    
    //imageView constraints
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewRightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfigureView()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        imageView.backgroundColor = .gray
        
        
        if shutterSpeedStart {
            imageView.alpha = 0
            imageView.image = UIImage(named: "\(isoRange_2[currentISOChoice_2])-\(exposureTimePicName[currentExposureTimeChoice])")
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

    
    private func initialConfigureView() {
        
        contentView.backgroundColor = .white
        
        apertureLabel.text = "ƒ/1.4"
        apertureLabel.textAlignment = .center
        isoLabel.text = "ISO"
        isoLabel.textAlignment = .center
        shutterSpeedLabel.text = "Exposure Time"
        shutterSpeedLabel.textAlignment = .center
        shutterSpeedLabel.adjustsFontSizeToFitWidth = true
        
        apertureLabel.alpha = 0.5
        apertureImageView.alpha = 0.5
        
        apertureImageView.image = UIImage(named: "aperture-1.4")
        
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
        
        //labels
        apertureLabel.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.3, height: referenceWidth * 0.2)
        apertureLabel.center.x = referenceWidth * 0.2
        apertureLabel.center.y = referenceWidth * 1.4
        apertureLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.06)
        
        isoLabel.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.3)
        isoLabel.center.x = referenceWidth * 0.5
        isoLabel.center.y = referenceWidth * 1.4
        isoLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.05)
        
        
        shutterSpeedLabel.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.25, height: referenceWidth * 0.2)
        shutterSpeedLabel.center.x = referenceWidth * 0.75
        shutterSpeedLabel.center.y = referenceWidth * 1.39
        shutterSpeedLabel.font = UIFont.boldSystemFont(ofSize: referenceWidth * 0.06)
        
        
        //aperture image view
        apertureImageView.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.2, height: referenceWidth * 0.2)
        apertureImageView.center.x = referenceWidth * 0.2
        apertureImageView.center.y = referenceWidth * 1.55
        
        //picker view
        pickerView.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.5, height: referenceWidth * 0.3)
        pickerView.center.x = referenceWidth * 0.625
        pickerView.center.y = referenceWidth * 1.55
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            currentISOChoice_2 = row
            break
        case 1:
            currentExposureTimeChoice = row
        default:
            break
        }
        
        if shutterSpeedStart {
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.alpha = 0.5
            })
            imageView.image = UIImage(named: "\(isoRange_2[currentISOChoice_2])-\(exposureTimePicName[currentExposureTimeChoice])")
            UIView.animate(withDuration: 0.4, animations: {
                self.imageView.alpha = 1
            })
            if currentExposureTimeChoice == (exposureTime.count - 1) {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Congratulations! You've finished all the pages! Hope you have learned something from this playground and thank you for reading and playing!")
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return isoRange_2[row]
        case 1:
            return exposureTime[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return isoRange_2.count
        case 1:
            return exposureTime.count
        default:
            return 0
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
}
