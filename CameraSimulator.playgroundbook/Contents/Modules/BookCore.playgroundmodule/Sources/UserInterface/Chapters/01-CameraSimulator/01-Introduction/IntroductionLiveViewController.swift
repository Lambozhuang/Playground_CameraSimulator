//
//  IntroductionLiveViewController.swift
//  BookCore
//
//  Created by Lambo.T.Zhuang on 2021/4/1.
//

import UIKit
import PlaygroundSupport

public class IntroductionLiveViewController: LiveViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    //contentView constraints
    @IBOutlet private weak var equalWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var equalHeightConstraint: NSLayoutConstraint!
    
    
    //imageView constraints
    @IBOutlet private weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewLeftConstraint: NSLayoutConstraint!
    @IBOutlet private weak var imageViewRightConstraint: NSLayoutConstraint!

    @IBOutlet weak var stage1_title1: UILabel!
    @IBOutlet weak var stage1_title2: UILabel!
    
    @IBOutlet weak var stage2_title1: UILabel!
    @IBOutlet weak var stage2_imageView1: UIImageView!
    @IBOutlet weak var stage2_imageView2: UIImageView!
    @IBOutlet weak var stage2_imageView3: UIImageView!
    @IBOutlet weak var stage2_imageView4: UIImageView!
    @IBOutlet weak var stage2_imageView5: UIImageView!
    
    @IBOutlet weak var stage2_label1: UILabel!
    @IBOutlet weak var stage2_label2: UILabel!
    @IBOutlet weak var stage2_label3: UILabel!
    @IBOutlet weak var stage2_label4: UILabel!
    @IBOutlet weak var stage2_label5: UILabel!
    
    @IBOutlet weak var stage3_title: UILabel!
    @IBOutlet weak var stage3_button: UIButton!
    
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    private var viewNeedLayout: Bool = true
    
    private var animationStage: Int = 0
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        referenceWidth = contentView.bounds.width
        
        initialConfigureView()
        
        animate(forStage: animationStage)
        
        
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        configureView()
    }
    
    @IBAction func previousButtonPressed(_ sender: Any) {
        animationStage -= 1
        animate(forStage: animationStage)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        animationStage += 1
        animate(forStage: animationStage)
    }
    
    @IBAction func stage3ButtonPressed(_ sender: Any) {
        PlaygroundPage.current.assessmentStatus = .pass(message: nil)
        PlaygroundPage.current.navigateTo(page: .next)
    }
    
    
    private func animate(forStage index: Int) {
        
        switch index {
        case 0: // intro

            self.stage1_title1.transform = CGAffineTransform(translationX: 0, y: 100)
            self.stage1_title2.transform = CGAffineTransform(translationX: 0, y: 100)
            self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            UIView.animate(withDuration: 0.5, animations: { //preparation
                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
//                self.imageView.backgroundColor = .lightGray
                self.contentView.backgroundColor = .white
                self.stage2_title1.alpha = 0
                self.stage2_label1.alpha = 0
                self.stage2_label2.alpha = 0
                self.stage2_label3.alpha = 0
                self.stage2_label4.alpha = 0
                self.stage2_label5.alpha = 0
                
                self.stage2_imageView1.alpha = 0
                self.stage2_imageView2.alpha = 0
                self.stage2_imageView3.alpha = 0
                self.stage2_imageView4.alpha = 0
                self.stage2_imageView5.alpha = 0
                
                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
                self.previousButton.isEnabled = false
                self.nextButton.isEnabled = false
            }, completion: {_ in
                UIView.animate(withDuration: 1.5, animations: {
                    self.stage1_title1.alpha = 1
                    self.stage1_title1.transform = CGAffineTransform(translationX: 0, y: 0)
                }, completion: {_ in
                    UIView.animate(withDuration: 1.5, animations: {
                        self.stage1_title2.alpha = 1
                        self.stage1_title2.transform = CGAffineTransform(translationX: 0, y: 0)
                        self.imageView.alpha = 1
                    }, completion: {_ in
                        UIView.animate(withDuration: 0.5, animations: {
                            self.nextButton.alpha = 1
                            self.nextButton.isEnabled = true
                        }, completion: nil)
                    })
                })
            })
            break
            
        case 1:
            UIView.animate(withDuration: 1, animations: {
                self.stage1_title1.alpha = 0
                self.stage1_title2.alpha = 0
                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
                self.imageView.transform = CGAffineTransform(scaleX: 5, y: 5)
                self.imageView.alpha = 0
                
                self.stage2_title1.transform = CGAffineTransform(translationX: 0, y: -50)
                
                self.stage3_title.alpha = 0
                
                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
                self.stage3_button.alpha = 0
                self.previousButton.isEnabled = false
                self.nextButton.isEnabled = false
                self.stage3_button.isEnabled = false
            }, completion: {_ in
                UIView.animate(withDuration: 1.5, animations: {
                    self.stage2_title1.alpha = 1
                    self.stage2_title1.transform = CGAffineTransform(translationX: 0, y: 50)
                }, completion: {_ in
                    UIView.animate(withDuration: 1, animations: {
                        //images
                        self.stage2_imageView1.alpha = 1
                        self.stage2_imageView2.alpha = 1
                        self.stage2_imageView3.alpha = 1
                        self.stage2_imageView4.alpha = 1
                        self.stage2_imageView5.alpha = 1
                    }, completion: {_ in
                        UIView.animate(withDuration: 0.7, animations: {
                            self.stage2_label1.alpha = 1
                        }, completion: {_ in
                            UIView.animate(withDuration: 0.7, animations: {
                                self.stage2_label2.alpha = 1
                            }, completion: {_ in
                                UIView.animate(withDuration: 0.7, animations: {
                                    self.stage2_label3.alpha = 1
                                }, completion: {_ in
                                    UIView.animate(withDuration: 0.7, animations: {
                                        self.stage2_label4.alpha = 1
                                    }, completion: {_ in
                                        UIView.animate(withDuration: 0.7, animations: {
                                            self.stage2_label5.alpha = 1
                                        }, completion: {_ in
                                            UIView.animate(withDuration: 0.5, animations: {
                                                self.previousButton.alpha = 1
                                                self.nextButton.alpha = 1
                                                self.previousButton.isEnabled = true
                                                self.nextButton.isEnabled = true
                                            }, completion: nil)
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
            break
        case 2:
            
            imageView.image = UIImage(named: "Cover")
            
            UIView.animate(withDuration: 1, animations: {
                self.stage2_title1.alpha = 0
                
                self.stage2_label1.alpha = 0
                self.stage2_label2.alpha = 0
                self.stage2_label3.alpha = 0
                self.stage2_label4.alpha = 0
                self.stage2_label5.alpha = 0

                self.stage2_imageView1.alpha = 0
                self.stage2_imageView2.alpha = 0
                self.stage2_imageView3.alpha = 0
                self.stage2_imageView4.alpha = 0
                self.stage2_imageView5.alpha = 0

                self.previousButton.alpha = 0
                self.nextButton.alpha = 0
                self.previousButton.isEnabled = false
                self.nextButton.isEnabled = false
                
            }, completion: {_ in
                self.stage3_title.transform = CGAffineTransform(translationX: 0, y: 100)
                UIView.animate(withDuration: 1.5, animations: {
                    self.imageView.transform = CGAffineTransform(scaleX: 1, y: 1)
                    self.stage3_title.transform = CGAffineTransform(translationX: 0, y: 0)
                    self.stage3_title.alpha = 1
                    self.imageView.alpha = 1
                }, completion: {_ in
                    UIView.animate(withDuration: 0.5, animations: {
                        self.stage3_button.alpha = 1
                        self.stage3_button.isEnabled = true
                        self.previousButton.alpha = 1
                        self.previousButton.isEnabled = true
                        
                    }, completion: nil)
                })
            })
            break
        default:
            return
        }
    }
    
    private func initialConfigureView() {
        
        contentView.backgroundColor = .white
        imageView.backgroundColor = .white
        
        stage1_title1.textColor = .black
        stage1_title2.textColor = .black
        stage1_title1.adjustsFontSizeToFitWidth = true
        stage1_title2.adjustsFontSizeToFitWidth = true
        
        stage2_label1.textColor = .black
        stage2_label2.textColor = .black
        stage2_label3.textColor = .black
        stage2_label4.textColor = .black
        stage2_label5.textColor = .black
        stage2_label1.adjustsFontSizeToFitWidth = true
        stage2_label2.adjustsFontSizeToFitWidth = true
        stage2_label3.adjustsFontSizeToFitWidth = true
        stage2_label4.adjustsFontSizeToFitWidth = true
        stage2_label5.adjustsFontSizeToFitWidth = true
        
        stage2_label1.alpha = 0
        stage2_label2.alpha = 0
        stage2_label3.alpha = 0
        stage2_label4.alpha = 0
        stage2_label5.alpha = 0
        
        stage3_title.alpha = 0
        stage3_title.textColor = .black
        stage3_button.alpha = 0
        stage3_button.tintColor = .systemBlue
        stage3_button.isEnabled = false

        stage1_title1.textAlignment = .center
        stage1_title2.textAlignment = .center
        
        contentView.bringSubviewToFront(stage1_title1)
        contentView.bringSubviewToFront(stage1_title2)
        
        stage1_title1.alpha = 0
        stage1_title2.alpha = 0
        stage2_title1.alpha = 0
        
        previousButton.tintColor = .systemBlue
        nextButton.tintColor = .systemBlue
        
        previousButton.alpha = 0
        nextButton.alpha = 0
        
        imageView.image = UIImage(named: "ReferenceLine_vertical_withFrame")
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0
        
        stage2_imageView1.image = UIImage(named: "camera_aperture")
        stage2_imageView1.contentMode = .scaleAspectFit
        stage2_imageView1.alpha = 0
        
        stage2_imageView2.image = UIImage(named: "camera_shutter")
        stage2_imageView2.contentMode = .scaleAspectFit
        stage2_imageView2.alpha = 0
        
        stage2_imageView3.image = UIImage(named: "camera_lens")
        stage2_imageView3.contentMode = .scaleAspectFit
        stage2_imageView3.alpha = 0
        
        stage2_imageView4.image = UIImage(named: "camera_imageSensor")
        stage2_imageView4.contentMode = .scaleAspectFit
        stage2_imageView4.alpha = 0
        
        stage2_imageView5.image = UIImage(named: "camera_body")
        stage2_imageView5.contentMode = .scaleAspectFit
        stage2_imageView5.alpha = 0
        
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
        
        stage2_imageView1.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.23, height: referenceWidth * 0.23)
        stage2_imageView2.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.23, height: referenceWidth * 0.23)
        stage2_imageView3.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.23, height: referenceWidth * 0.23)
        stage2_imageView4.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.23, height: referenceWidth * 0.23)
        stage2_imageView5.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.23, height: referenceWidth * 0.23)
        
        stage2_imageView1.center.x = referenceWidth * 0.2
        stage2_imageView1.center.y = referenceWidth * 0.52
        
        stage2_imageView2.center.x = referenceWidth * 0.2
        stage2_imageView2.center.y = referenceWidth * 0.77
        
        stage2_imageView3.center.x = referenceWidth * 0.2
        stage2_imageView3.center.y = referenceWidth * 1.02
        
        stage2_imageView4.center.x = referenceWidth * 0.2
        stage2_imageView4.center.y = referenceWidth * 1.27
        
        stage2_imageView5.center.x = referenceWidth * 0.2
        stage2_imageView5.center.y = referenceWidth * 1.52
        
        
        
        //text configuration
        stage1_title1.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.5, height: referenceWidth * 0.2)
                
        stage1_title2.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.6, height: referenceWidth * 0.2)

        stage1_title1.center.x = referenceWidth * 0.5
        stage1_title1.center.y = referenceWidth * 1.45
        
        stage1_title2.center.x = referenceWidth * 0.5
        stage1_title2.center.y = referenceWidth * 1.55
        
        stage2_title1.numberOfLines = 5
        stage2_title1.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.8, height: referenceWidth * 0.4)
        stage2_title1.font = UIFont.systemFont(ofSize: referenceWidth * 0.065)
        stage2_title1.center.x = referenceWidth * 0.5
        stage2_title1.center.y = referenceWidth * 0.2
        
        stage2_label1.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.2)
        stage2_label2.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.2)
        stage2_label3.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.2)
        stage2_label4.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.2)
        stage2_label5.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.4, height: referenceWidth * 0.2)
        
        stage2_label1.center.x = referenceWidth * 0.65
        stage2_label1.center.y = referenceWidth * 0.52
        
        stage2_label2.center.x = referenceWidth * 0.65
        stage2_label2.center.y = referenceWidth * 0.77
        
        stage2_label3.center.x = referenceWidth * 0.65
        stage2_label3.center.y = referenceWidth * 1.02
        
        stage2_label4.center.x = referenceWidth * 0.65
        stage2_label4.center.y = referenceWidth * 1.27
        
        stage2_label5.center.x = referenceWidth * 0.65
        stage2_label5.center.y = referenceWidth * 1.52
        
        
        stage3_title.frame = CGRect(x: 0, y: 0, width: referenceWidth * 0.75, height: referenceWidth * 0.35)
        stage3_title.center.x = referenceWidth * 0.5
        stage3_title.center.y = referenceWidth * 1.45
        stage3_title.font = UIFont.systemFont(ofSize: referenceWidth * 0.045)
        
        //buttons configure
        if animationStage == 0 {
            previousButton.isEnabled = false
        } else {
            previousButton.isEnabled = true
        }
        
        previousButton.transform = CGAffineTransform(scaleX: referenceWidth * 0.003, y: referenceWidth * 0.003)
        nextButton.transform = CGAffineTransform(scaleX: referenceWidth * 0.003, y: referenceWidth * 0.003)
        
        previousButton.center.x = referenceWidth * 0.3
        previousButton.center.y = referenceWidth * 1.7
        
        nextButton.center.x = referenceWidth * 0.7
        nextButton.center.y = referenceWidth * 1.7
        
        
        stage3_button.transform = CGAffineTransform(scaleX: referenceWidth * 0.0015, y: referenceWidth * 0.0015)
        stage3_button.center.x = referenceWidth * 0.5
        stage3_button.center.y = referenceWidth * 1.6

    }
     
}
