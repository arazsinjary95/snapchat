/*
See LICENSE.txt for this sample’s licensing information.

Abstract:
View controller for camera interface.
*/

@import UIKit;
@class AVCamPreviewView;
@protocol AVCamCameraVCDelegate;

@interface AVCamCameraViewController : UIViewController
@property (nonatomic, weak)  AVCamPreviewView *_previewView;
    @property (retain) id <AVCamCameraVCDelegate> delegate;
- (void)changeCamera;
- (void)toggleMovieRecording;
@end
