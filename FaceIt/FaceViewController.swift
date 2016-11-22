//
//  ViewController.swift
//  FaceIt
//
//  Created by Rajat Bhatt on 21/11/16.
//  Copyright © 2016 RAJATsadasfdsfds. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController {

    @IBOutlet weak var faceView: FaceView!{
        didSet {
            updateUI()
        }
    }
    
    var expression = FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile){
        didSet{
            updateUI()
        }
    }
    
    private let mouthCurvatures = [FacialExpression.Mouth.Frown: -1.0, .Grin: 0.5, .Smile: 1.0, .Smirk: -0.5, .Neutral: 0.0]
    private let eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed: 0.5, .Furrowed: -0.5, .Normal: 0.0]
    
    func updateUI() {
        switch expression.eyes {
        case .Open: faceView.eyesOpen = true
        case .Closed: faceView.eyesOpen = false
        case .Squinting: faceView.eyesOpen = false
        }
        faceView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        faceView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
    }

}

