//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Rajat Bhatt on 25/11/16.
//  Copyright © 2016 RAJATsadasfdsfds. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private let emotionFaces: Dictionary<String, FacialExpression> = [
        "angry": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Frown),
        "happy": FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried": FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischevious": FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
    ]
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController.contentViewController
//        if let navcon = destinationVC as? UINavigationController{
//            destinationVC = navcon.visibleViewController ?? destinationVC
//        }
        if let faceVC = destinationVC as? FaceViewController{
            if let identifier = segue.identifier {
                if let expression = emotionFaces[identifier]{
                    faceVC.expression = expression
                    if let sendingButton = sender as? UIButton {
                        faceVC.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController{
            return navcon.visibleViewController!
        } else {
            return self
        }
    }
}