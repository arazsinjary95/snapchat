//
//  CameraVC.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/8/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class CameraVC: AVCamCameraViewController, AVCamCameraVCDelegate {

    @IBOutlet weak var previewView: AVCamPreviewView!
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        self._previewView = previewView
        
        super.viewDidLoad()
        
        
    }

    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
   
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should ebable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }

}

