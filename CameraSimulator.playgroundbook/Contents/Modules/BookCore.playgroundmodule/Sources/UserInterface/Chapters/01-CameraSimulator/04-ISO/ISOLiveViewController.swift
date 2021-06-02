//
//  ISOLiveViewController.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/16.
//

import UIKit
import PlaygroundSupport

class ISOLiveViewController: LiveViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isoLabel: UILabel!
    @IBOutlet weak var apertureLabel: UILabel!
    @IBOutlet weak var apertureImageView: UIImageView!
    @IBOutlet weak var isoPickerView: UIPickerView!
    
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
        
        imageView.backgroundColor = .gray
        
        
        if isoStart {
            imageView.alpha = 0
            imageView.image = UIImage(named: "ISO-\(isoRange_1[currentISOChoice_1])")
        } else {
            imageView.image = UIImage(named: "Cover")
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.imageView.alpha = 1
        })
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        isoPickerView.delegate = self
        isoPickerView.dataSource = self
        
        configureView()
    }

    
    private func initialConfigureView() {
        
        contentView.backgroundColor = .white
        isoLabel.text = "ISO"
        isoLabel.textAlignment = .center
        apertureLabel.text = "ƒ/1.4"
        apertureLabel.textAlignment = .center
        apertureImageView.image = UIImage(named: "aperture-1.4")
        apertureImageView.contentMode = .scaleAspectFit
        
        imageView.contentMode = .scaleAspectFill
        
        apertureLabel.alpha = 0.5
        apertureImageView.alpha = 0.5
        
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
        
        //aperture label configuration
        apertureLabel.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.3)
        apertureLabel.center.x = referenceWidth * 0.28
        apertureLabel.center.y = referenceWidth * 1.45
        apertureLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.08)
        
        //aperture image view configuration
        apertureImageView.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.25, height: referenceWidth * 0.25)
        apertureImageView.center.x = referenceWidth * 0.28
        apertureImageView.center.y = referenceWidth * 1.65
        
        //iso label configuration
        isoLabel.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.3)
        isoLabel.center.x = referenceWidth * 0.72
        isoLabel.center.y = referenceWidth * 1.45
        isoLabel.font = UIFont.systemFont(ofSize: referenceWidth * 0.08)

        //iso picker view configuration
        isoPickerView.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.25)
        isoPickerView.center.x = referenceWidth * 0.72
        isoPickerView.center.y = referenceWidth * 1.65
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentISOChoice_1 = row
        if isoStart {
            UIView.animate(withDuration: 0.2, animations: {
                self.imageView.alpha = 0.5
            })
            imageView.image = UIImage(named: "ISO-\(isoRange_1[currentISOChoice_1])")
            UIView.animate(withDuration: 0.4, animations: {
                self.imageView.alpha = 1
            })
            if pickerView.selectedRow(inComponent: 0) == (isoRange_1.count - 1) {
                PlaygroundPage.current.assessmentStatus = .pass(message: "Congratulations! You can go to the next page to learn more!")
            }
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return isoRange_1[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return isoRange_1.count
    }

}
