//
//  ViewController.m
//  RoadComplaint
//
//  Created by Dayananda Ampapathina on 10/19/16.
//  Copyright © 2016 Dayananda Ampapathina. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
//#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)launchCamera:(id)sender {
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO){
        return;
    }
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    cameraUI.allowsEditing = YES;
    
    cameraUI.delegate = self;
    
    [self presentViewController:cameraUI animated:YES completion:^{
        //
    }];
}

- (IBAction)launchGallery:(id)sender {
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    cameraUI.mediaTypes = [[NSArray alloc] initWithObjects: (NSString *) kUTTypeImage, nil];
    cameraUI.allowsEditing = YES;
    
    cameraUI.delegate = self;
    
    [self presentViewController:cameraUI animated:YES completion:^{
        //
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    ViewController __weak *weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
        if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
            == kCFCompareEqualTo) {
            UIImage *saveImage;
            if (picker.allowsEditing == YES) {
                saveImage = [info objectForKey:UIImagePickerControllerEditedImage];
            }else{
                saveImage = [info objectForKey:UIImagePickerControllerOriginalImage];
            }
            UIImageWriteToSavedPhotosAlbum(saveImage, nil, nil, nil);
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:^{
        //
    }];
}

@end
