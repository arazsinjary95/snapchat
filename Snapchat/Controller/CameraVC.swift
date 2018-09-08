//
//  CameraVC.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/8/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class CameraVC: AVCamCameraViewController {

    @IBOutlet weak var previewView: AVCamPreviewView!
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        
        super.viewDidLoad()
        
        
    }

    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    

}

