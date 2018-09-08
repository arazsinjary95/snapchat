/*
See LICENSE.txt for this sample’s licensing information.

Abstract:
Application preview view.
*/

@import UIKit;

@class AVCaptureSession;
@class AVCaptureVideoPreviewLayer;

@interface AVCamPreviewView : UIView

@property (nonatomic, readonly) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@property (nonatomic) AVCaptureSession *session;

@end
