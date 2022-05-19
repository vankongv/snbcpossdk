//
//  PrinterSampleViewController.m
//  testfor3.28
//
//  Created by yuelin on 2019/5/7.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "PrinterSampleViewController.h"
#import "NSBundle+Language.h"

@interface PrinterSampleViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *myTableview;
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicator;

@end

@implementation PrinterSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = GCLocalizedString(@"Printer Sample");
    self.activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleGray)];
    [self.myTableview addSubview:self.activityIndicator];
    self.activityIndicator.frame= CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-50, 100, 100);
    self.activityIndicator.color = [UIColor redColor];
    self.activityIndicator.hidesWhenStopped = YES;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *region_Cell = @"MyCell";
    NSString *content = @"";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *printerType = [defaults objectForKey:@"printerType"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:region_Cell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:region_Cell];
    }
    switch (indexPath.row) {
        case 0:
            content = GCLocalizedString(@"80mm Supermarket Sample");
            break;
        case 1:
            content = GCLocalizedString(@"56mm Receipt Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 2:
            content = GCLocalizedString(@"80mm Receipt Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 3:
            content = GCLocalizedString(@"80mm Coupon Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 4:
            content = GCLocalizedString(@"80mm Coupon Sample(Rotation90)");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 5:
            content = GCLocalizedString(@"80mm Lottery Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 6:
            content = GCLocalizedString(@"80mm Ticket Or Bank Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 7:
            content = GCLocalizedString(@"80mm Restaurant Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        case 8:
            content = GCLocalizedString(@"80mm Takeaway Sample");
            if ([printerType isEqualToString:@"IMPACT"]) {
                cell.textLabel.textColor = UIColor.grayColor;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            } else {
                cell.textLabel.textColor = UIColor.blackColor;
            }
            break;
        default:
            break;
    }
    cell.textLabel.text = content;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([GCLocalizedString(@"80mm Ticket Or Bank Sample") isEqualToString:@"80毫米车票样张"]) {
        return 9;
    } else {
        return 7;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.activityIndicator startAnimating];
    [self.myTableview setUserInteractionEnabled:false];
    int result = ERR_SUCCESS;
    int nStartY = 0;
    NSString* f_path = @"";
    NSString* f_path2 = @"";
    char path[1000];
    char path2[1000];
    char *bmpName[2];
    char *BmpName[1];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *printerType = [defaults objectForKey:@"printerType"];
    
    if (![self isPrinterReady]) {
        return;
    }
    
    switch (indexPath.row) {
        case 0:
            //Supermarket
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 0);
            ApplicationUnit(_handle, 1);
            
            result = SetTextFontType(_handle, 0);
            result = SetAlignmentMode(_handle, 1);
            result = SetTextDoubleWidthAndHeight(_handle, 0, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Supermarket Ticket")], 1, -1);
            result = SetTextDoubleWidthAndHeight(_handle, 0, 0);
            result = FeedLine(_handle);
            result = FeedLine(_handle);
            result = FeedLine(_handle);
            
            result = SetAlignmentMode(_handle, 0);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Ginger A   Store   #12345REG   #02")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Date:2006-04-09            Time:18:30")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Item         Qty               Amount")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Apple          1               $1.00")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Orange          2               $5.00")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Brush          1               $3.8")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Beer          2               $8.00")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Subtotal:")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Tax:")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Total:                         $17.80")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            
            result = SetAlignmentMode(_handle, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Customer signature")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Thank you")], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Welcome next time")], 1, -1);
            result = FeedLine(_handle);
            
            result = CutPaper(_handle, 1, 80);
            result = Reset(_handle);
            break;
        case 1:
            //56
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
                result = SelectPaperType(_handle, 0);
                result = PrintSetMode(_handle, 0);
                ApplicationUnit(_handle, 1);
                result = SetTextFontType(_handle, 0);
                result = SetAlignmentMode(_handle, 0);
                
                result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Print 56mm Receipt Sample")], 0, nStartY);
                result = FeedLine(_handle);
                result = SetTextCharacterSpace(_handle, 0, 0, 1);
                result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test Text 0 RightSpace")], 0, nStartY);
                result = FeedLine(_handle);
                result = SetTextCharacterSpace(_handle, 0, 2, 1);
                result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test Text 2 RightSpace")], 0, nStartY);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "*****************************", 0, nStartY);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test Barcode - Code 128")], 0, nStartY);
                result = FeedLine(_handle);
                result = PrintBarcode(_handle, "{A*12345ABC*{C90", 1, 0, 73, 2, 7, 1, 2, 16);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test Print Flash Image")], 0, nStartY);
                
                result = FeedLine(_handle);
                result = PrintFlashBitmap(_handle, 1, 5, nStartY, 0);
                result = FeedLine(_handle);
                result = PrintFlashBitmap(_handle, 2, 5, nStartY, 0);
                result = FeedLine(_handle);
                
                result = CutPaper(_handle, 1, 80);
                result = Reset(_handle);
            }
            break;
        case 2:
            //80
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 0);
            ApplicationUnit(_handle, 1);
            
            result = SetTextFontType(_handle, 0);
            result = SetAlignmentMode(_handle, 0);
            
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Print      80mm      Receipt       Sample")], 0, nStartY);
            result = FeedLine(_handle);
            
            result = SetTextCharacterSpace(_handle, 0, 0, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test    Text      0      RightSpace")], 0, nStartY);
            result = FeedLine(_handle);
            result = SetTextCharacterSpace(_handle, 0, 2, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test    Text      2      RightSpace")], 0, nStartY);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "***********************************", 0, nStartY);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test      Barcode - Code 128")], 0, nStartY);
            result = FeedLine(_handle);
            result = PrintBarcode(_handle, "{A*12345ABC*{C90", 1, 0, 73, 3, 7, 1, 2, 16);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"Test      Print      Flash    Image")], 0, nStartY);
            
            result = FeedLine(_handle);
            result = PrintFlashBitmap(_handle, 1, 5, nStartY, 0);
            result = FeedLine(_handle);
            result = PrintFlashBitmap(_handle, 2, 5, nStartY, 0);
            result = FeedLine(_handle);
            
            result = CutPaper(_handle, 1, 80);
            result = Reset(_handle);
            }
            break;
        case 3:
            //Coupon
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            nStartY = 0;
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 1);
            ApplicationUnit(_handle, 1);
            
            result = PageModeSetArea(_handle, 0, 0, 77, 60, 0);
            
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = SetTextBold(_handle, 1);
            nStartY += 16;
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"COUPON")], 0, nStartY);
            
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = SetTextBold(_handle, 0);
            nStartY += 7;
            result = SetTextCharacterSpace(_handle, 0, 0, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"FREE!!!")], 1, nStartY);
            
            nStartY += 4;
            result = PrintFlashBitmap(_handle, 1, 25, nStartY, 3);
            result = PageModePrint(_handle);
            result = PageModeClearBuffer(_handle);
            result = CutPaper(_handle, 1, 30);
            result = Reset(_handle);
            }
            break;
        case 4:
            //Coupon 90
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            nStartY = 0;
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 1);
            ApplicationUnit(_handle, 1);
            
            result = PageModeSetArea(_handle, 0, 0, 77, 77, 3);
            
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = SetTextBold(_handle, 1);
            nStartY += 6;
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"COUPON")], 0, nStartY);
            
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = SetTextBold(_handle, 0);
            nStartY += 7;
            result = SetTextCharacterSpace(_handle, 0, 0, 1);
            result = PrintTextOut(_handle, [self StrToCh:GCLocalizedString(@"FREE!!!")], 1, nStartY);
            
            nStartY += 4;
            result = PrintFlashBitmap(_handle, 1, 30, nStartY, 3);
            
            result = PageModePrint(_handle);
            result = PageModeClearBuffer(_handle);
            result = CutPaper(_handle, 1, 30);
            result = Reset(_handle);
            }
            break;
        case 5:
            //Lottery
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 0);
            ApplicationUnit(_handle, 1);
            if ([GCLocalizedString(@"80mm Lottery Sample") isEqualToString:@"80毫米彩票样张"]) {
                result = SetTextFontType(_handle, 3);
                result = SetTextMagnifyTimes(_handle, 2, 2);
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, [self StrToCh:@"体彩大乐透"], 15, -1);
                result = SetTextMagnifyTimes(_handle, 1, 1);
                result = SetTextBold(_handle, 0);
                result = FeedLine(_handle);
                
                result = SetAlignmentMode(_handle, 0);
                result = PrintTextOut(_handle, [self StrToCh:@"第20101期           2020年10月14日开奖"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"单式票         1倍               合计10元"], 1, -1);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, [self StrToCh:@"  ①    05  10  15  18  20    +    09  11"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"  ②    03  09  18  25  28    +    09  10"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"  ③    09  12  14  15  16    +    05  06"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"  ④    16  21  30  33  35    +    09  11"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"  ⑤    07  09  11  32  33    +    07  10"], 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, [self StrToCh:@"感谢您为公益事业贡献10元"], 13, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"顶呱呱\"奖上奖\"邀您相约环湖赛"], 10, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, [self StrToCh:@"西宁市城中区西门"], 20, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, "01-09999999-101 00004 19/07/17  14:05:32", 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
            } else {
                result = SetTextFontType(_handle, 0);
                result = SetTextMagnifyTimes(_handle, 3, 3);
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "LOTTO", 20, -1);
                result = FeedLine(_handle);
                
                result = SetTextMagnifyTimes(_handle, 1, 1);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, "ANNUAL PAYMENT", 20, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "  A.    11  29  30  38  40  53  06", 1, -1);
                result = FeedLine(_handle);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, "SINGLE DRAW             Apr 02 2016", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "AGENT  123456        Apr 01 2016/16:04", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "CLERK 55555555", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "015596", 1, -1);
                result = FeedLine(_handle);
                
                result = SetTextMagnifyTimes(_handle, 2, 2);
                result = PrintTextOut(_handle, "TRAINING MODE-INVALID", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "NOT FOR SALE", 15, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                
                result = SetTextMagnifyTimes(_handle, 1, 1);
                result = PrintTextOut(_handle, "01234567890123", 15, -1);
                result = FeedLine(_handle);
            }
            result = BarcodePrintPDF417(_handle, "01234567890123", 5, -1, 4, 10, 3, 1, 1, 2, 0, 14);
            result = FeedLine(_handle);
            result = CutPaper(_handle, 1, 30);
            result = Reset(_handle);
            }
            break;
        case 6:
            //Ticket Or Bank
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            result = SelectPaperType(_handle, 0);
            if ([GCLocalizedString(@"80mm Ticket Or Bank Sample") isEqualToString:@"80毫米车票样张"]) {
                nStartY = 0;
                result = PrintSetMode(_handle, 1);
                ApplicationUnit(_handle, 1);
                result = SetTextFontType(_handle, 3);
                
                result = PageModeSetArea(_handle, 0, 0, 77, 55, 0);
                nStartY = 15;
                result = SetTextMagnifyTimes(_handle, 2, 2);
                result = PrintTextOut(_handle, [self StrToCh:@"购票信息单"], 15, nStartY);
                result = SetTextMagnifyTimes(_handle, 1, 1);
                nStartY += 7;
                result = PrintTextOut(_handle, "China Railway Ticket Notice", 10, nStartY);
                result = SetTextMagnifyTimes(_handle, 1, 1);
                nStartY += 7;
                result = PrintTextOut(_handle, ".........................................", 1, nStartY);
                
                nStartY += 8;
                result = PrintTextOut(_handle, [self StrToCh:@"乘车时间:"], 2, nStartY);
                result = PrintTextOut(_handle, [self StrToCh:@"2019年06月25日 11:00"], 17, nStartY);
                
                nStartY += 10;
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, [self StrToCh:@"三亚站"], 5, nStartY);
                
                result = PrintTextOut(_handle, "D7322", 22, nStartY);
                result = PrintTextOut(_handle, [self StrToCh:@"海口东站"], 35, nStartY);
                nStartY += 2;
                result = PrintTextOut(_handle, "________", 20, nStartY);
                
                nStartY += 3;
                result = PrintTextOut(_handle, "Sanya", 5, nStartY);
                result = PrintTextOut(_handle, "Haikoudong", 35, nStartY);
                
                result = PageModePrint(_handle);
                result = PageModeClearBuffer(_handle);
                
                result = PrintSetMode(_handle, 0);
                ApplicationUnit(_handle, 1);
                result = SetTextFontType(_handle, 3);
                
                result = PrintTextOut(_handle, [self StrToCh:@"01车01F号"], 2, -1);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, [self StrToCh:@"二等座"], 22, -1);
                result = PrintTextOut(_handle, [self StrToCh:@"全 支"], 32, -1);
                result = PrintTextOut(_handle, [self StrToCh:@"检票口:"], 42, -1);
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "13A", 52, -1);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, [self StrToCh:@"限乘当日当次车"], 2, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"王某某 1100091992****3212"], 2, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"电子票号: 211520000109199000001"], 2, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"订 单 号:  EWA0012985"], 2, -1);
                result = PrintTextOut(_handle, [self StrToCh:@"票价:"], 38, -1);
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "100", 48, -1);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, [self StrToCh:@"元"], 53, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, ".........................................", 1, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"温馨提示"], 24, -1);//114
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"1.购票信息单不作为乘车凭证使用。\n"], 0, -1);//121
                
                result = PrintTextOut(_handle, [self StrToCh:@"2.需要报销的旅客，可在开车前或乘车日期之日\n起31日内，持有效身份证件到车站指定窗口或\n自动售(取)票机上打印报销凭证，逾期不予办理。\n3.未领取报销凭证且使用电子支付方式购票的\n旅客，在12306网站或手机App上自助办理车票\n退票和改签业务应不晚于开车前30分钟。"], 0, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, ".........................................", 1, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"旅行过程中请保留此单，祝您旅途愉快!"], 1, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"出单地点：三亚站 211号窗口"], 1, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, [self StrToCh:@"出单时间：2019-06-01 08:05:01"], 1, -1);
                result = FeedLine(_handle);
                
                result = BarcodePrintQR(_handle, "123456789", 10, 200, 8, 2, 0, 1, 9);
                result = FeedLine(_handle);
            } else {
                result = PrintSetMode(_handle, 0);
                ApplicationUnit(_handle, 1);
                result = SetTextFontType(_handle, 0);
                
                result = PrintTextOut(_handle, "[Company Slogan]", 1, -1);
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "Bank Account Statement", 26, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, "[Company Name]", 1, -1);
                result = PrintTextOut(_handle, "[DATE]", 45, -1);
                result = FeedLine(_handle);
                
                result = PrintTextOut(_handle, "[Street Address,City,ST ZIP Code]", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "[phone] [fax]", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "[email]", 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "OPENING BALANCE      CLOSEING BALANCE", 5, -1);
                result = FeedLine(_handle);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, "9999                 9999", 10, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                
                result = SetTextBold(_handle, 1);
                result = PrintTextOut(_handle, "DESCRIPTION     DEBIT   CREDIT   TOTAL", 5, -1);
                result = FeedLine(_handle);
                result = SetTextBold(_handle, 0);
                result = PrintTextOut(_handle, "Finance charge on", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "overdue balance", 1, -1);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "at 1.5%", 1, -1);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = FeedLine(_handle);
                result = PrintTextOut(_handle, "TOTAL", 20, -1);
                result = FeedLine(_handle);
            }
            result = CutPaper(_handle, 1, 80);
            result = Reset(_handle);
            }
            break;
        case 7:
            //Restaurant
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 0);
            ApplicationUnit(_handle, 1);
            
            result = SetTextFontType(_handle, 3);
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, [self StrToCh:@"消费分单"], 20, -1);
            result = FeedLine(_handle);
            result = FeedLine(_handle);
            
            result = SetAlignmentMode(_handle, 0);
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = PrintTextOut(_handle, [self StrToCh:@"厅 名:"], 1, -1);
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, [self StrToCh:@"大厅"], 10, -1);
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = PrintTextOut(_handle, [self StrToCh:@"台 名:"], 25, -1);
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, [self StrToCh:@"11号桌"], 35, -1);
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, [self StrToCh:@"账单号:00010104    人数:  2"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"点菜员:孙昊         2017-10-15 12:29"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"点菜器编号:0016"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, [self StrToCh:@"菜名            数量   单位 单价   注释"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"炭底             1       份   5.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"酱料             2       份   3.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"黑椒鸡腿肉       1       份   28.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"特味酱五花       1       份   35.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"宫廷吾桑格       1       份   43.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"烤什锦菌菇       1       份   22.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"芝士鸡蛋卷       1       份   26.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"冷面             1       份   22.00"], 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"小计:                         187.00"], 1, -1);
            result = FeedLine(_handle);
            
            result = CutPaper(_handle, 1, 80);
            result = Reset(_handle);
            }
            break;
        case 8:
            //Takeaway
            if ([printerType isEqualToString:@"IMPACT"]) {
            } else {
            result = SelectPaperType(_handle, 0);
            result = PrintSetMode(_handle, 0);
            ApplicationUnit(_handle, 1);
            
            result = SetTextFontType(_handle, 3);
            
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, [self StrToCh:@"牌号1"], 20, -1);
            result = FeedLine(_handle);
            
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, "dyy1234", 20, -1);
            result = FeedLine(_handle);
            
            result = SetAlignmentMode(_handle, 0);
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"时间: 2015-12-11 11:04"], 1, -1);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"商品           数量          小计"], 1, -1);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"糖醋排骨"], 1, -1);
            result = PrintTextOut(_handle, "1            12.0", 25, -1);
            
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"红烧肉"], 1, -1);
            result = PrintTextOut(_handle, "1            13.0", 25, -1);
            
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"宫保鸡丁"], 1, -1);
            result = PrintTextOut(_handle, "1            8.0", 25, -1);
            result = FeedLine(_handle);
            
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = SetTextMagnifyTimes(_handle, 2, 2);
            result = PrintTextOut(_handle, [self StrToCh:@"金额          33.0"], 1, -1);
            result = FeedLine(_handle);
            
            result = SetTextMagnifyTimes(_handle, 1, 1);
            result = PrintTextOut(_handle, "-----------------------------------------", 1, -1);
            result = FeedLine(_handle);
            result = PrintTextOut(_handle, [self StrToCh:@"谢谢惠顾"], 1, -1);
            result = FeedLine(_handle);
            
            result = CutPaper(_handle, 1, 80);
            result = Reset(_handle);
            }
            break;
        default:
            break;
    }
    [self.activityIndicator stopAnimating];
    [self.myTableview setUserInteractionEnabled:true];
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
    return GCLocalizedString(@"List");
}

- (char *)StrToCh:(NSString *)string {
    char *l_char;
    char CommandBuf[300];
    memset(CommandBuf, 0, sizeof(CommandBuf));
    NSData *data = [string dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
    l_char = (char *)[data bytes];
    memcpy(CommandBuf, l_char, data.length);
    strcpy(l_char, CommandBuf);
    return l_char;
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
