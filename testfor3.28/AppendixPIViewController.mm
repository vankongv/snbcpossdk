//
//  AppendixPIViewController.m
//  testfor3.28
//
//  Created by yuelin on 2019/5/9.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "AppendixPIViewController.h"
#import "NSBundle+Language.h"

@interface AppendixPIViewController ()

@property (weak, nonatomic) IBOutlet UILabel *queryItemLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *FVLabel;
@property (weak, nonatomic) IBOutlet UILabel *firmwareLabel;
@property (weak, nonatomic) IBOutlet UILabel *SVLabel;
@property (weak, nonatomic) IBOutlet UILabel *softwareLabel;
@property (weak, nonatomic) IBOutlet UILabel *VILabel;
@property (weak, nonatomic) IBOutlet UILabel *vendorLabel;
@property (weak, nonatomic) IBOutlet UILabel *PNLabel;
@property (weak, nonatomic) IBOutlet UILabel *printerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *HSLabel;
@property (weak, nonatomic) IBOutlet UILabel *hardwareLabel;
@property (weak, nonatomic) IBOutlet UIButton *queryBtn;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation AppendixPIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = GCLocalizedString(@"Product Info");
    self.queryItemLabel.text = GCLocalizedString(@"QueryItem");
    self.resultLabel.text = GCLocalizedString(@"Result");
    self.FVLabel.text = GCLocalizedString(@"FirmwareVersion");
    self.SVLabel.text = GCLocalizedString(@"SoftwareVersion");
    self.VILabel.text = GCLocalizedString(@"VendorInfomation");
    self.PNLabel.text = GCLocalizedString(@"PrinterName");
    self.HSLabel.text = GCLocalizedString(@"HardwareSerial Number");
    [self.queryBtn setTitle:GCLocalizedString(@"Query") forState:UIControlStateNormal];
    
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.frame= CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50, 100, 100);
    self.activityIndicator.color = [UIColor redColor];
    self.activityIndicator.hidesWhenStopped = YES;
}

- (IBAction)queryAction:(id)sender {
    
    if (![self isPrinterReady]) {
        return;
    }
    
    [self.activityIndicator startAnimating];
    [self.view setUserInteractionEnabled:false];
    
    int result = ERR_SUCCESS;
    
    char returnValue[100];
    memset(returnValue, 0, 100);
    unsigned long realLength = 0;
    result = FirmwareVersion(_handle, returnValue, 100, &realLength);
    NSString *firmwareVersion;
    if (result != ERR_SUCCESS) {
        firmwareVersion = [self errorCodeInfo:result];
    } else {
        firmwareVersion = [NSString stringWithUTF8String:returnValue];
    }
    
    char returnValue2[100];
    memset(returnValue2, 0, 100);
    unsigned long realLength2 = 0;
    result = SoftwareVersion(_handle, returnValue2, 100, &realLength2);
    NSString *softwareVersion;
    if (result != ERR_SUCCESS) {
        softwareVersion = [self errorCodeInfo:result];
    } else {
        softwareVersion = [NSString stringWithUTF8String:returnValue2];
    }
    
    char returnValue3[100];
    memset(returnValue3, 0, 100);
    unsigned long realLength3 = 0;
    result = VendorInformation(_handle, returnValue3, 100, &realLength3);
    NSString *vendorInformation;
    if (result != ERR_SUCCESS) {
        vendorInformation = [self errorCodeInfo:result];
    } else {
        vendorInformation = [NSString stringWithUTF8String:returnValue3];
    }
    
    char returnValue4[100];
    memset(returnValue4, 0, 100);
    unsigned long realLength4 = 0;
    result = PrinterName(_handle, returnValue4, 100, &realLength4);
    NSString *printerName;
    if (result != ERR_SUCCESS) {
        printerName = [self errorCodeInfo:result];
    } else {
        printerName = [NSString stringWithUTF8String:returnValue4];
    }
    
    /*
    char returnValue5[100];
    memset(returnValue5, 0, 100);
    unsigned long realLength5 = 0;
    result = ResolutionRatio(_handle, returnValue5, 100, &realLength5);
    NSMutableString *resolutionStr = [NSMutableString stringWithFormat:@""];
    if (returnValue5[0] == 0x01) {
        [resolutionStr appendFormat:@"203x"];
    } else if (returnValue5[0] == 0x02) {
        [resolutionStr appendFormat:@"180x"];
    }
    if (returnValue5[1] == 0x01) {
        [resolutionStr appendFormat:@"203"];
    } else if (returnValue5[1] == 0x02) {
        [resolutionStr appendFormat:@"180"];
    }
    */
     
    char returnValue6[100];
    memset(returnValue6, 0, 100);
    unsigned long realLength6 = 0;
    result = HardwareSerialNumber(_handle, returnValue6, 100, &realLength6);
    NSString *hardwareSerialNumber;
    if (result != ERR_SUCCESS) {
        hardwareSerialNumber = [self errorCodeInfo:result];
    } else {
        hardwareSerialNumber = [NSString stringWithUTF8String:returnValue6];
    }
    
    self.firmwareLabel.text = firmwareVersion;
    self.softwareLabel.text = softwareVersion;
    self.vendorLabel.text = vendorInformation;
    self.printerNameLabel.text = printerName;
    self.hardwareLabel.text = hardwareSerialNumber;
    [self.activityIndicator stopAnimating];
    [self.view setUserInteractionEnabled:true];
}

- (NSString *)errorCodeInfo:(int)errorCode {
    NSString *info;
    switch (errorCode) {
        case ERR_SUCCESS:
            break;
        case ERR_FAIL:
            info = GCLocalizedString(@"Failed");
            break;
        case ERR_HANDLE:
            info = GCLocalizedString(@"Invalid handle");
            break;
        case ERR_PARAMATER:
            info = GCLocalizedString(@"Invalid parameter");
            break;
        case ERR_FILE:
            info = GCLocalizedString(@"File parameter error");
            break;
        case ERR_READ:
            info = GCLocalizedString(@"Read data error");
            break;
        case ERR_WRITE:
            info = GCLocalizedString(@"Write data error");
            break;
        case ERR_NOT_SUPPORT:
            info = GCLocalizedString(@"Not support");
            break;
        case ERR_BITMAP_INVAILD:
            info = GCLocalizedString(@"Invalid bitmap");
            break;
        case ERR_LOADDLL_FAILURE:
            info = GCLocalizedString(@"Load library failed");
            break;
        case ERR_FIRNOSUPPORT:
            info = GCLocalizedString(@"Firmware not supported");
            break;
        case ERR_UNKOWN_ERROR:
            info = GCLocalizedString(@"Unknown error");
            break;
        default:
            info = GCLocalizedString(@"Other error");
            break;
    }
    return info;
}

- (BOOL)isPrinterReady {
    int result = ERR_SUCCESS;
    char returnValue[100];
    unsigned long realLength = 0;
    memset(returnValue, 0, 100);
    int isOnlineStatus = 1;  //0-offline,1-online
    int isCoverOpened = 0;   //0-false,1-true
    int isPaperEnd = 0;      //0-false,1-true
    
    result = AutoQueryStatus(_handle, returnValue, 100, 1, &realLength);
    
    (returnValue[0] & 0x08) == 0x08 ? isOnlineStatus = 0 : 1;
    (returnValue[0] & 0x20) == 0x20 ? isCoverOpened = 1 : 0;
    (returnValue[2] & 0x0C) == 0x0C ? isPaperEnd = 1 : 0;
    
    if ((isOnlineStatus == 0) || (isCoverOpened == 1) || (isPaperEnd ==1)) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Printer status abnormal, please confirm and try again.") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:alertAction];
        [self presentViewController:alertVC animated:true completion:nil];
        return false;
    }
    
    return true;
}

@end
