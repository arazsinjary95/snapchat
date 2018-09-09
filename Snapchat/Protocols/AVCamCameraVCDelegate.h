//
//  AVCamCameraVCDelegate.h
//  Snapchat
//
//  Created by Araz Sinjary on 9/9/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

#ifndef AVCamCameraVCDelegate_h
#define AVCamCameraVCDelegate_h

@protocol AVCamCameraVCDelegate <NSObject>

-(void)shouldEnableRecordUI:(BOOL)enable;
-(void)shouldEnableCameraUI:(BOOL)enable;
-(void)canStartRecording;
-(void)recordingHasStarted;

@end

#endif /* AVCamCameraVCDelegate_h */
