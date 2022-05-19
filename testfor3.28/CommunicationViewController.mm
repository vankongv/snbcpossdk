//
//  CommunicationViewController.m
//  testfor3.28
//
//  Created by yuelin on 2019/5/27.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "CommunicationViewController.h"
#import "NSBundle+Language.h"

@interface CommunicationViewController ()<UITextFieldDelegate>

@property (nonatomic, retain) NSString *printerType;
@property (nonatomic, retain) NSString *portTypeMethod;
@property (nonatomic, retain) NSArray *printerArr;
@property (nonatomic, retain) NSString *selectPrinterName;
@property (nonatomic, retain) NSString *wifiPortNo;
@property (nonatomic) BOOL isConnected;

@property (weak, nonatomic) IBOutlet UILabel *selectPrinterTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectPrinterTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *selectPortTypeLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectPortTypeBtn;
@property (weak, nonatomic) IBOutlet UILabel *searchAndConnectLabel;
@property (weak, nonatomic) IBOutlet UIButton *searchPrinterBtn;
@property (weak, nonatomic) IBOutlet UILabel *PrinterNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *connectPrinterBtn;
@property (weak, nonatomic) IBOutlet UIButton *returnBtn;
@property (weak, nonatomic) IBOutlet UITextField *portNoTextfield;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation CommunicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.frame= CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50, 100, 100);
    self.activityIndicator.color = [UIColor redColor];
    self.activityIndicator.hidesWhenStopped = YES;
    self.navigationItem.title = GCLocalizedString(@"Communication");
    self.selectPrinterTypeLabel.text = GCLocalizedString(@"Select Printer");
    [self.selectPrinterTypeBtn setTitle:GCLocalizedString(@"Printer Type") forState:UIControlStateNormal];
    self.selectPortTypeLabel.text = GCLocalizedString(@"Select Port");
    [self.selectPortTypeBtn setTitle:GCLocalizedString(@"Port Type") forState:UIControlStateNormal];
    self.searchAndConnectLabel.text = GCLocalizedString(@"Search&Connect");
    [self.searchPrinterBtn setTitle:GCLocalizedString(@"Search Printer") forState:UIControlStateNormal];
    self.PrinterNameLabel.text = GCLocalizedString(@"PrinterName");
    [self.connectPrinterBtn setTitle:GCLocalizedString(@"Connect Printer") forState:UIControlStateNormal];
    [self.returnBtn setTitle:GCLocalizedString(@"Return") forState:UIControlStateNormal];
    self.navigationItem.hidesBackButton = true;
    self.wifiPortNo = @"9100";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    self.portNoTextfield.hidden = true;
    [self.searchPrinterBtn setEnabled:false];
    [self.connectPrinterBtn setEnabled:false];
}

- (IBAction)selectPrinterType:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Please select printer type") preferredStyle:UIAlertControllerStyleActionSheet];

    [[alertVC popoverPresentationController] setSourceView:self.view];
    [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
    [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
    
    NSLog(@"selectPrinterType whew lets do this!");

    
    UIAlertAction *characterType1 = [UIAlertAction actionWithTitle:@"BTP-M300" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"IMPACT";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-M300", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType2 = [UIAlertAction actionWithTitle:@"BTP-R180" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R180", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType3 = [UIAlertAction actionWithTitle:@"BTP-R180II" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R180II", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType4 = [UIAlertAction actionWithTitle:@"BTP-L580II" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-L580II", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType5 = [UIAlertAction actionWithTitle:@"BTP-R580II" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R580II", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType6 = [UIAlertAction actionWithTitle:@"BTP-R681" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R681", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType7 = [UIAlertAction actionWithTitle:@"BTP-R880NP" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R880NP", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType8 = [UIAlertAction actionWithTitle:@"BTP-R980" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R980", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType9 = [UIAlertAction actionWithTitle:@"BTP-R980III" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R980III", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType10 = [UIAlertAction actionWithTitle:@"BTP-R990" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-R990", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType11 = [UIAlertAction actionWithTitle:@"BTP-S80" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-S80", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType12 = [UIAlertAction actionWithTitle:@"BTP-U60" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-U60", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    UIAlertAction *characterType13 = [UIAlertAction actionWithTitle:@"BTP-U80" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.printerType = @"POS";
        [self initPrinter];
        [self.selectPrinterTypeBtn setTitle:[NSString stringWithFormat:@" %@ : BTP-U80", GCLocalizedString(@"Printer Type")] forState:UIControlStateNormal];
    }];
    [alertVC addAction:characterType1];
    [alertVC addAction:characterType2];
    [alertVC addAction:characterType3];
    [alertVC addAction:characterType4];
    [alertVC addAction:characterType5];
    [alertVC addAction:characterType6];
    [alertVC addAction:characterType7];
    [alertVC addAction:characterType8];
    [alertVC addAction:characterType9];
    [alertVC addAction:characterType10];
    [alertVC addAction:characterType11];
    [alertVC addAction:characterType12];
    [alertVC addAction:characterType13];
    [self presentViewController:alertVC animated:true completion:nil];
}

- (void)initPrinter {
    if ([self.printerType isEqual:@"POS"]) {
        if (_handle == nil) {
            _handle = Init("POS");
        }
    } else if ([self.printerType isEqual:@"IMPACT"]) {
        if (_handle == nil) {
            _handle = Init("IMPACT");
        }
    }
    if (_handle == (DEVICEHANDLE)ERR_PARAMATER || _handle == (DEVICEHANDLE)ERR_FAIL || _handle == (DEVICEHANDLE)ERR_LOADDLL_FAILURE) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Init Printer Error") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *characterType1 = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:characterType1];
        [self presentViewController:alertVC animated:true completion:nil];
    } else {
        if (self.portTypeMethod != nil) {
            [self.searchPrinterBtn setEnabled:true];
        }
    }
}

- (IBAction)initPrinterAction:(id)sender {
    //initPrinter
}

- (IBAction)selectPortType:(id)sender {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Please select port type") preferredStyle:UIAlertControllerStyleActionSheet];
    
    [[alertVC popoverPresentationController] setSourceView:self.view];
    [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
    [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];

    UIAlertAction *portType1 = [UIAlertAction actionWithTitle:GCLocalizedString(@"BlueTooth") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.portTypeMethod = @"BlueTooth";
        [self.selectPortTypeBtn setTitle:[NSString stringWithFormat:@" %@ : %@",GCLocalizedString(@"Port Type"), GCLocalizedString(@"BlueTooth")] forState:UIControlStateNormal];
        self.portNoTextfield.hidden = true;
        if (self.printerType != nil) {
            [self.searchPrinterBtn setEnabled:true];
        }
    }];
    UIAlertAction *portType2 = [UIAlertAction actionWithTitle:GCLocalizedString(@"Wifi") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.portTypeMethod = @"Wifi";
        [self.selectPortTypeBtn setTitle:[NSString stringWithFormat:@" %@ : %@",GCLocalizedString(@"Port Type"), GCLocalizedString(@"Wifi")] forState:UIControlStateNormal];
        self.portNoTextfield.hidden = false;
        if (self.printerType != nil) {
            [self.searchPrinterBtn setEnabled:true];
        }
    }];
    UIAlertAction *portType3 = [UIAlertAction actionWithTitle:GCLocalizedString(@"BlueTooth MFI") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.portTypeMethod = @"BlueTooth MFI";
        [self.selectPortTypeBtn setTitle:[NSString stringWithFormat:@" %@ : %@",GCLocalizedString(@"Port Type"), GCLocalizedString(@"BlueTooth MFI")] forState:UIControlStateNormal];
        self.portNoTextfield.hidden = true;
        if (self.printerType != nil) {
            [self.searchPrinterBtn setEnabled:true];
        }
    }];
    [alertVC addAction:portType1];
    [alertVC addAction:portType2];
    [alertVC addAction:portType3];
    [self presentViewController:alertVC animated:true completion:nil];
}

- (IBAction)searchPrintAction:(id)sender {
    [self.activityIndicator startAnimating];
    [self.view setUserInteractionEnabled:false];
    int printerNumber = 0;
    char printerNameList[1000];
    int portType = 0;
    if ([self.portTypeMethod isEqualToString:@"BlueTooth"]) {
        portType = PORT_BLT;
    } else if ([self.portTypeMethod isEqualToString:@"Wifi"]) {
        portType = PORT_ETHERNET;
    } else if ([self.portTypeMethod isEqualToString:@"BlueTooth MFI"]) {
        portType = PORT_BLT_MFI;
    }
    int result = EnumDeviceInfo(portType, printerNameList, 1000, &printerNumber);
    NSString *str = [NSString stringWithUTF8String:printerNameList];
    self.printerArr = [str componentsSeparatedByString:@"@"];
    if (self.printerArr.count == 0) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"No printer found") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:alertAction];
        [self presentViewController:alertVC animated:true completion:nil];
    } else {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Please select printer") preferredStyle:UIAlertControllerStyleActionSheet];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        for (int i = 0 ; i < self.printerArr.count; i++) {
            UIAlertAction *printerName = [UIAlertAction actionWithTitle:[NSString stringWithFormat:@"%s", [self.printerArr[i] UTF8String]] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.PrinterNameLabel.text = self.printerArr[i];
                self.selectPrinterName = self.printerArr[i];
                [self.connectPrinterBtn setEnabled:true];
            }];
            [alertVC addAction:printerName];
        }
        [self presentViewController:alertVC animated:true completion:nil];
    }
    [self.activityIndicator stopAnimating];
    [self.view setUserInteractionEnabled:true];
}

- (IBAction)connectPrintAction:(id)sender {
    [self.activityIndicator startAnimating];
    [self.view setUserInteractionEnabled:false];
    int result = ERR_SUCCESS;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL connected = [defaults boolForKey:@"isConnected"];
    if (connected) {
        result = ClosePort(_handle);
        if (result != ERR_SUCCESS) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Close port failed") preferredStyle:UIAlertControllerStyleAlert];
            [[alertVC popoverPresentationController] setSourceView:self.view];
            [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
            [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
            

            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alertVC addAction:alertAction];
            [self presentViewController:alertVC animated:true completion:nil];
            return;
        } else {
            self.handle = nil;
            [self initPrinter];
        }
    }
    if ([self.portTypeMethod isEqualToString:@"BlueTooth"]) {
        if ([self.selectPrinterName containsString:@"|"]) {
            NSArray *tmpArr = [self.selectPrinterName componentsSeparatedByString:@"|"];
            if (tmpArr.count > 2) {
                NSString *tmpStr = [NSString stringWithFormat:@"%s|%s", [tmpArr[1] UTF8String], [tmpArr[2] UTF8String]];
                char *selectPrinter = (char *)[tmpStr UTF8String];
                result = OpenBlueToothPort(_handle, selectPrinter);
            }
            else if ([self.selectPrinterName containsString:@"|"]) {
                NSArray *tmpArr = [self.selectPrinterName componentsSeparatedByString:@"|"];
                char *selectPrinter = (char *)[tmpArr[1] UTF8String];
                result = OpenBlueToothPort(_handle, selectPrinter);
            } else {
                char *selectPrinter = (char *)[self.selectPrinterName UTF8String];
                result = OpenBlueToothPort(_handle, selectPrinter);
            }
        } else {
            char *selectPrinter = (char *)[self.selectPrinterName UTF8String];
            result = OpenBlueToothPort(_handle, selectPrinter);
        }
    } else if ([self.portTypeMethod isEqualToString:@"Wifi"]) {
        if ([self.selectPrinterName containsString:@"|"]) {
            NSArray *tmpArr = [self.selectPrinterName componentsSeparatedByString:@"|"];
            char *selectPrinter = (char *)[tmpArr[1] UTF8String];
            result = OpenNetPort(_handle, selectPrinter, self.wifiPortNo.intValue, 0, 0);
        } else {
            char *selectPrinter = (char *)[self.selectPrinterName UTF8String];
            result = OpenNetPort(_handle, selectPrinter, self.wifiPortNo.intValue, 0, 0);
        }
    } else if ([self.portTypeMethod isEqualToString:@"BlueTooth MFI"]) {
        if ([self.selectPrinterName containsString:@"|"]) {
            NSArray *tmpArr = [self.selectPrinterName componentsSeparatedByString:@"|"];
            char *selectPrinter = (char *)[tmpArr[1] UTF8String];
            result = OpenBlueToothPortMFI(_handle, selectPrinter);
        } else {
            char *selectPrinter = (char *)[self.selectPrinterName UTF8String];
            result = OpenBlueToothPortMFI(_handle, selectPrinter);
        }
    }
    if (result == 0) {
        [self.activityIndicator stopAnimating];
        [self.view setUserInteractionEnabled:true];
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Connect Successful") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *characterType1 = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            self.isConnected = true;
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:self.printerType forKey:@"printerType"];
            [defaults setBool:YES forKey:@"isConnected"];
            [defaults synchronize];
            if ([self.handleDelegate respondsToSelector:@selector(sendHandleToRootViewController:isConnected:)]) {
                [self.handleDelegate sendHandleToRootViewController:self.handle isConnected:self.isConnected];
            }
            [self.navigationController popViewControllerAnimated:true];
        }];
        [alertVC addAction:characterType1];
        [self presentViewController:alertVC animated:true completion:nil];
    } else {
        [self.activityIndicator stopAnimating];
        [self.view setUserInteractionEnabled:true];
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Connect Failure") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *characterType1 = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:characterType1];
        [self presentViewController:alertVC animated:true completion:nil];
    }
}

- (IBAction)goBackAction:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

- (void)tapClick {
    UITextField *textfield = (UITextField *)[self.view viewWithTag:300];
    self.wifiPortNo = textfield.text;
    [textfield resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    UITextField *textfield = (UITextField *)[self.view viewWithTag:300];
    self.wifiPortNo = textfield.text;
    [textfield resignFirstResponder];
    return true;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    UITextField *textfield = (UITextField *)[self.view viewWithTag:300];
    self.wifiPortNo = textfield.text;
}

@end
