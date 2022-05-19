//
//  DeviceStatusSampleController.m
//  testfor3.28
//
//  Created by yuelin on 2019/5/9.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "DeviceStatusSampleController.h"
#include <sys/stat.h>
#import "NSBundle+Language.h"

@interface DeviceStatusSampleController ()

@property (weak, nonatomic) IBOutlet UILabel *queryItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *OLLabel;
@property (weak, nonatomic) IBOutlet UILabel *onlineSLabel;
@property (weak, nonatomic) IBOutlet UILabel *PCSLabel;
@property (weak, nonatomic) IBOutlet UILabel *printerCSLabel;
@property (weak, nonatomic) IBOutlet UILabel *PELabel;
@property (weak, nonatomic) IBOutlet UILabel *paperELabel;
@property (weak, nonatomic) IBOutlet UIButton *queryBtn;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation DeviceStatusSampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = GCLocalizedString(@"Device Status");
    self.queryItemLabel.text = GCLocalizedString(@"QueryItem");
    self.resultLabel.text = GCLocalizedString(@"Result");
    self.OLLabel.text = GCLocalizedString(@"Online Status");
    self.PCSLabel.text = GCLocalizedString(@"Printer Cover Status");
    self.PELabel.text = GCLocalizedString(@"Paper End");
    [self.queryBtn setTitle:GCLocalizedString(@"Query") forState:UIControlStateNormal];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.frame= CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50, 100, 100);
    self.activityIndicator.color = [UIColor redColor];
    self.activityIndicator.hidesWhenStopped = YES;
}

- (IBAction)queryAction:(id)sender {
    
    [self.activityIndicator startAnimating];
    [self.view setUserInteractionEnabled:false];
    int result = ERR_SUCCESS;
    char returnValue[100];
    unsigned long realLength = 0;
    memset(returnValue, 0, 100);
    
    //RealTime
    /*
    result = RealTimeQueryStatus(_handle, returnValue, 1, &realLength);
    NSMutableString *stateStr = [NSMutableString stringWithFormat:@""];
    if ((returnValue[0] & 0x01) == 0x01) {
        [stateStr appendFormat:@"两个钱箱都关闭,"];
    }
    if ((returnValue[0] & 0x02) == 0x02) {
        [stateStr appendFormat:@"脱机,"];
    }
    if ((returnValue[0] & 0x04) == 0x04) {
        [stateStr appendFormat:@"上盖开,"];
    }
    if ((returnValue[0] & 0x08) == 0x08) {
        [stateStr appendFormat:@"未按走纸键,"];
    }
    if ((returnValue[0] & 0x10) == 0x10) {
        [stateStr appendFormat:@"有错误情况,"];
    }
    if ((returnValue[0] & 0x20) == 0x20) {
        [stateStr appendFormat:@"有不可恢复错误,"];
    }
    if ((returnValue[0] & 0x40) == 0x40) {
        [stateStr appendFormat:@"纸将尽,"];
    }
    if ((returnValue[0] & 0x80) == 0x80) {
        [stateStr appendFormat:@"缺纸,"];
    }
    if (![stateStr isEqual:@""]) {
        NSRange deleteRange = {[stateStr length] - 1, 1};
        [stateStr deleteCharactersInRange:deleteRange];
    }
    memset(returnValue, 0, 100);
    */
     
    //NonRealTime
    /*
    result = NonRealTimeQueryStatus(_handle, returnValue, 1, &realLength);
    NSMutableString *stateStr1 = [NSMutableString stringWithFormat:@""];
    if ((returnValue[0] & 0x03) == 0x03) {
        [stateStr1 appendFormat:@"纸将尽,"];
    }
    if ((returnValue[0] & 0x0C) == 0x0C) {
        [stateStr1 appendFormat:@"缺纸,"];
    }
    if ((returnValue[0] & 0x30) == 0x30) {
        [stateStr1 appendFormat:@"无钱箱打开,"];
    }
    if (![stateStr1 isEqual:@""]) {
        NSRange deleteRange = {[stateStr1 length] - 1, 1};
        [stateStr1 deleteCharactersInRange:deleteRange];
    }
    memset(returnValue, 0, 100);
    */
    
    //Auto
    result = AutoQueryStatus(_handle, returnValue, 100, 1, &realLength);
    if (result != ERR_SUCCESS) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Query status failed!") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:alertAction];
        [self presentViewController:alertVC animated:true completion:nil];
    } else {
        (returnValue[0] & 0x08) == 0x08 ? self.onlineSLabel.text = GCLocalizedString(@"Offline") : self.onlineSLabel.text = GCLocalizedString(@"Ready");
        (returnValue[0] & 0x20) == 0x20 ? self.printerCSLabel.text = GCLocalizedString(@"Open") : self.printerCSLabel.text = GCLocalizedString(@"Closed");
        (returnValue[2] & 0x0C) == 0x0C ? self.paperELabel.text = GCLocalizedString(@"Abnormal") : self.paperELabel.text = GCLocalizedString(@"Normal");
    }
    [self.activityIndicator stopAnimating];
    [self.view setUserInteractionEnabled:true];
}

@end
