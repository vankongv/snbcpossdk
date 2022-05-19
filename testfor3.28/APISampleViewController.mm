//
//  APISampleViewController.m
//  testfor3.28
//
//  Created by yuelin on 2019/5/9.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "APISampleViewController.h"
#import "NSBundle+Language.h"

@interface APISampleViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (nonatomic, retain) NSString *dataString;

@end

@implementation APISampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = GCLocalizedString(@"API Sample");
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *region_Cell = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:region_Cell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:region_Cell];
    }
    NSString *content = @"";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *printerType = [defaults objectForKey:@"printerType"];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    content = @"ApplicationUnit";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 1:
                    content = @"SetPrintDensity";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 2:
                    content = @"SetPaperType";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    content = @"PrintTextOut";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 1:
                    content = @"UniversalTextOut";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 2:
                    content = @"LineHeight";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 3:
                    content = @"TextBold";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 4:
                    content = @"DWidthHeight";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 5:
                    content = @"Alignment";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 6:
                    content = @"CharacterSpace";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 7:
                    content = @"FontType";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 8:
                    content = @"MagnifyTimes";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 9:
                    content = @"UpsideDown";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 10:
                    content = @"OppositeColor";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 11:
                    content = @"UnderLine";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 12:
                    content = @"Rotate";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                    content = @"DownloadPrintLogo";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 1:
                    content = @"PrintBitmap";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    content = @"Barcode";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 1:
                    content = @"QrCode";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                case 2:
                    content = @"Pdf417";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                    content = @"PageMode";
                    if ([printerType isEqualToString:@"IMPACT"]) {
                        cell.textLabel.textColor = UIColor.grayColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    } else {
                        cell.textLabel.textColor = UIColor.blackColor;
                        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    }
                    break;
                default:
                    break;
            }
            break;
        case 5:
            switch (indexPath.row) {
                case 0:
                    content = @"Feed";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 1:
                    content = @"CutPaper";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                case 2:
                    content = @"KickOutDrawer";
                    cell.textLabel.textColor = UIColor.blackColor;
                    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    cell.textLabel.text = content;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0 :
            return 3;
            break;
        case 1 :
            return 13;
            break;
        case 2 :
            return 2;
            break;
        case 3 :
            return 3;
            break;
        case 4 :
            return 1;
            break;
        case 5 :
            return 3;
            break;
        default :
            break;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int result = ERR_SUCCESS;
    int nStartY = 0;
    char dataBuffer[1000];
    NSString* f_path = @"";
    char path[1000];
    NSString* Flash_path = @"";
    NSString* Flash_path2 = @"";
    char FlashPath[1000];
    char FlashPath2[1000];
    char *bmpName[2];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *printerType = [defaults objectForKey:@"printerType"];
    
//    if (![self isPrinterReady]) {
//        return;
//    }
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    ApplicationUnit(_handle, 1);
                    result = PrintTextOut(_handle, "Test Unit mm\n", 20, -1);
                        
                    ApplicationUnit(_handle, 0);
                    result = PrintTextOut(_handle, "Test Unit dot\n", 80, -1);
                    
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                case 1:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    result = PrintDensity(_handle, 30);
                    result = PrintTextOut(_handle, "Test PrintDensity 30\n", 1, -1);
                    result = PrintDensity(_handle, 100);
                    result = PrintTextOut(_handle, "Test PrintDensity 100\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                case 2:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    result = SelectPaperType(_handle, 0);
                    result = PrintTextOut(_handle, "Test SelectPaperType\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                default:
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                    result = PrintTextOut(_handle, "Test PrintTextOut\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 1:
                    result = UniversalTextOut(_handle, "univeriasl\n", 1, -1, 2, 2, 0, 0x00);
                    result = UniversalTextOut(_handle, "univeriasl\n", 1, -1, 2, 2, 0, 0x1F88);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 2:
                    result = SetTextLineHight(_handle, 100);
                    result = PrintTextOut(_handle, "Test LineHeight1\n", 1, -1);
                    result = SetTextLineHight(_handle, 200);
                    result = PrintTextOut(_handle, "Test LineHeight2\n", 1, -1);
                    result = PrintTextOut(_handle, "Test LineHeight3\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 3:
                    result = SetTextBold(_handle, 1);
                    result = PrintTextOut(_handle, "Text Bold\n", 0, -1);
                    result = SetTextBold(_handle, 0);
                    result = PrintTextOut(_handle, "Cancel Bold\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 4:
                    result = SetTextDoubleWidthAndHeight(_handle, 1, 1);
                    result = PrintTextOut(_handle, "DWidthHeight\n", 0, -1);
                    result = SetTextDoubleWidthAndHeight(_handle, 0, 0);
                    result = PrintTextOut(_handle, "Cancel DWidthHeight\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 5:
                    result = SetAlignmentMode(_handle, 0);
                    result = PrintTextOut(_handle, "Alignment left\n", 0, -1);
                    result = SetAlignmentMode(_handle, 1);
                    result = PrintTextOut(_handle, "Alignment center\n", 0, -1);
                    result = SetAlignmentMode(_handle, 2);
                    result = PrintTextOut(_handle, "Alignment right\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 6:
                    result = SetTextCharacterSpace(_handle, 10, 10, 1);
                    result = PrintTextOut(_handle, "Test CharacterSpace\n", 1, -1);
                    result = SetTextCharacterSpace(_handle, 0, 0, 1);
                    result = PrintTextOut(_handle, "Test CharacterSpace\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 7:
                    result = SetTextFontType(_handle, 1);
                    result = PrintTextOut(_handle, "Test TextFontColor\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 8:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    result = SetTextMagnifyTimes(_handle, 1, 1);
                    result = PrintTextOut(_handle, "1x Text\n", 1, -1);
                    result = SetTextMagnifyTimes(_handle, 2, 2);
                    result = PrintTextOut(_handle, "2x Text\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                case 9:
                    result = SetTextUpsideDownMode(_handle, 1);
                    result = PrintTextOut(_handle, "Test UpsideDown\n", 1, -1);
                    result = SetTextUpsideDownMode(_handle, 0);
                    result = PrintTextOut(_handle, "Cancel UpsideDown\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 10:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    result = SetTextOppositeColor(_handle, 1);
                    result = PrintTextOut(_handle, "Test Opposite Color\n", 0, -1);
                    result = SetTextOppositeColor(_handle, 0);
                    result = PrintTextOut(_handle, "Cancel Opposite Color\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                case 11:
                    result = SetTextUnderline(_handle, 1);
                    result = PrintTextOut(_handle, "Test UnderLine\n", 0, -1);
                    result = SetTextUnderline(_handle, 0);
                    result = PrintTextOut(_handle, "Cancel UnderLine\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 12:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    result = SetTextRotate(_handle, 1);
                    result = PrintTextOut(_handle, "Test Rotate 90\n", 0, -1);
                    result = SetTextRotate(_handle, 0);
                    result = PrintTextOut(_handle, "Cancel Rotate\n", 0, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
//                    nStartY = 0;
//                    nStartY += 6;
//                    f_path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Look.bmp"];
//                    memset(path, 0, 1000);
//                    strcpy(path, (char *)[f_path UTF8String]);
//                    result = DownloadRAMBitmapByFile(_handle, path, 6);
//                    result = PrintRAMBitmap(_handle, 6, 1, nStartY, 0);
//                    result = PrintRAMBitmap(_handle, 6, 1, nStartY, 3);
                    //result = PrintTrueType(_handle, "Test Truetype", 0, -1, "∫⁄ÃÂ", 20, 20, 0);
                    Flash_path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Kitty.bmp"];
//                    Flash_path2 = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Look.bmp"];
                    memset(FlashPath, 0, 1000);
//                    memset(FlashPath2, 0, 1000);
                    strcpy(FlashPath, (char *)[Flash_path UTF8String]);
//                    strcpy(FlashPath2, (char *)[Flash_path2 UTF8String]);
                    bmpName[0] = FlashPath;
//                    bmpName[1] = FlashPath2;
                    result = DownloadFlashBitmapByFile(_handle, bmpName, 1);
                    result = PrintFlashBitmap(_handle, 1, 1, -1, 0);
//                    result = PrintFlashBitmap(_handle, 2, 1, -1, 3);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    memset(path, 0, 1000);
                    memset(FlashPath, 0, 1000);
//                    memset(FlashPath2, 0, 1000);
                    break;
                case 1:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    memset(path, 0, 1000);
                    f_path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Look.bmp"];
                    strcpy(path, (char *)[f_path UTF8String]);
                    result = PrintBitmapByMode(_handle, path, 0, -1, 0);
                    result = PrintBitmapByMode(_handle, path, 0, -1, 1);
//                    memset(path, 0, 1000);
//                    f_path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"Kitty.bmp"];
//                    strcpy(path, (char *)[f_path UTF8String]);
//                    result = PrintBitmap(_handle, path, 0, nStartY, 0);
//                    result = PrintBitmap(_handle, path, 0, nStartY, 2);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    memset(path, 0, 1000);
                    }
                    break;
                default:
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    nStartY = -1;
                    memset(dataBuffer, 0, 1000);
                    ApplicationUnit(_handle, 0);
                    //UPC-A
                    _dataString = @"041667024930";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "UPC-A\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 65, 2, 30, 0, 2, 12);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 65, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //UPC-C
                    _dataString = @"01234567890";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "UPC-C\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 66, 2, 30, 0, 2, 11);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 66, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //JAN13(EAN13)
                    _dataString = @"1234567890123";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "JAN13(EAN13)\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 67, 2, 30, 0, 2, 13);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 67, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //JAN8(EAN8)
                    _dataString = @"12345678";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "JAN8(EAN8)\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 68, 2, 30, 0, 2, 8);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 68, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //code39
                    _dataString = @"1234";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "code39\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 69, 2, 30, 0, 2, 4);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 69, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //INTERLEAVED 2 OF 5
                    _dataString = @"12345670";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "INTERLEAVED 2 OF 5\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 70, 2, 30, 0, 2, 8);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 70, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //CODEBAR
                    _dataString = @"A40156B";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "CODEBAR\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 71, 2, 30, 0, 2, 7);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 71, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //CODE 93
                    _dataString = @"TEST93";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "CODE 93\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 72, 2, 30, 0, 2, 6);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 72, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //CODE 128
                    _dataString = @"{A*12345ABC*{C90";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "CODE 128\n", 0, nStartY);
                    result = PrintBarcode(_handle, dataBuffer, 1, nStartY, 73, 2, 30, 0, 2, 16);
                    result = PrintBarcodeSimple(_handle, dataBuffer, 1, nStartY, 73, 300, 100, 2);
                    memset(dataBuffer, 0, 1000);
                    //Maxicode
//                    _dataString = @"01234567890123";
//                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
//                    result = PrintTextOut(_handle, "Maxicode\n", 0, nStartY);
//                    result = BarcodePrintMaxicode(_handle, dataBuffer, 1, nStartY, 14);
//                    memset(dataBuffer, 0, 1000);
                    //GS1DataBar
//                    _dataString = @"01234567890123";
//                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
//                    result = PrintTextOut(_handle, "\nGS1DataBar\n", 0, nStartY);
//                    result = BarcodePrintGS1DataBar(_handle, dataBuffer, 1, nStartY, 1, 3, 64, 2, 1, 4, 1, 1, 14);
//                    memset(dataBuffer, 0, 1000);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                case 1:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    memset(dataBuffer, 0, 1000);
                    _dataString = @"123456789";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "QRCode\n", 0, -1);
                    result = BarcodePrintQR(_handle, dataBuffer, 10, -1, 8, 2, 0, 1, 9);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    memset(dataBuffer, 0, 1000);
                    }
                    break;
                case 2:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    memset(dataBuffer, 0, 1000);
                    _dataString = @"01234567890123";
                    strcpy(dataBuffer, (char *)[_dataString UTF8String]);
                    result = PrintTextOut(_handle, "PDF417\n", 0, -1);
                    result = FeedLine(_handle);
                    result = BarcodePrintPDF417(_handle, dataBuffer, 1, -1, 4, 5, 3, 1, 1, 1, 0, 14);
                    result = FeedLine(_handle);
                    //result = BarcodePrintPDF417Simple(_handle, dataBuffer, 1, -1, 100, 10);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    memset(dataBuffer, 0, 1000);
                    }
                    break;
                default:
                    break;
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                    if ([printerType isEqualToString:@"IMPACT"]) {
                    } else {
                    nStartY = 0;
                    PrintSetMode(_handle, 1);
                    ApplicationUnit(_handle, 1);
                    result = PageModeSetArea(_handle, 0, 0, 77, 100, 0);
                    nStartY += 6;
                    result = PrintTextOut(_handle, "Page Mode Printer", 1, nStartY);
                    nStartY += 8;
                    result = PrintTextOut(_handle, "PageMode", 1, nStartY);
                    nStartY += 4;
                    result = PrintTextOut(_handle, "Page Test", 28, nStartY);
                    nStartY += 3;
                    result = PrintTextOut(_handle, "Test Text", 1, nStartY);
                    result = PageModePrint(_handle);
                    result = PageModeClearBuffer(_handle);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    }
                    break;
                default:
                    break;
            }
            break;
        case 5:
            switch (indexPath.row) {
                case 0:
                    result = PrintTextOut(_handle, "Test FeedLine 1\n", 0, -1);
                    result = FeedLine(_handle);
                    result = PrintTextOut(_handle, "Test FeedLine 10\n", 0, -1);
                    result = FeedLineNumber(_handle, 10);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                case 1:
                    result = PrintTextOut(_handle, "Test CutPaper\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    break;
                case 2:
                    result = KickOutDrawer(_handle, 0, 20, 20);
                    result = PrintTextOut(_handle, "Test KickOutDrawer\n", 1, -1);
                    result = CutPaper(_handle, 1, 10);
                    result = Reset(_handle);
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    if (result != ERR_SUCCESS) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Print sample failed.") preferredStyle:UIAlertControllerStyleAlert];
        [[alertVC popoverPresentationController] setSourceView:self.view];
        [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
        [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
        

        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertVC addAction:alertAction];
        [self presentViewController:alertVC animated:true completion:nil];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";
    switch (section) {
        case 0 :
            title = GCLocalizedString(@"Basic Setting");
            break;
        case 1 :
            title = GCLocalizedString(@"Text Print");
            break;
        case 2 :
            title = GCLocalizedString(@"Bitmap Print");
            break;
        case 3 :
            title = GCLocalizedString(@"Barcode Print");
            break;
        case 4 :
            title = GCLocalizedString(@"PageMode");
            break;
        case 5 :
            title = GCLocalizedString(@"Other");
            break;
        default :
            break;
    }
    return title;
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
