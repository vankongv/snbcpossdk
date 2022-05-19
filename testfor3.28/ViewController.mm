//
//  ViewController.m
//  testfor3.28
//
//  Created by yuelin on 2019/3/28.
//  Copyright © 2019 yuelin. All rights reserved.
//

#import "ViewController.h"
#import "POSSDK.h"
#import "CommunicationViewController.h"
#import "PrinterSampleViewController.h"
#import "APISampleViewController.h"
#import "DeviceStatusSampleController.h"
#import "AppendixPIViewController.h"
#import "NSBundle+Language.h"

@interface ViewController ()<SendHandleDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) DEVICEHANDLE handle;
@property (nonatomic) BOOL isConnected;
@property (nonatomic, retain) UIBarButtonItem *languageButtonItem;
@property (nonatomic, retain) UIBarButtonItem *returnButtonItem;
@property (weak, nonatomic) IBOutlet UITableView *myTableview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = GCLocalizedString(@"POS SDK Demo");
    _languageButtonItem = [[UIBarButtonItem alloc] initWithTitle:GCLocalizedString(@"Language") style:UIBarButtonItemStylePlain target:self action:@selector(switchBetweenLanguages)];
    self.navigationItem.rightBarButtonItem = _languageButtonItem;
    
    _returnButtonItem = [[UIBarButtonItem alloc] init];
    _returnButtonItem.title = GCLocalizedString(@"Back");
    self.navigationItem.backBarButtonItem = _returnButtonItem;
}

- (void)switchBetweenLanguages {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"AppLanguagesKey"] isEqualToString:@"zh-Hans"]) {
        [NSBundle setLanguage:@"en"];
    } else {
        [NSBundle setLanguage:@"zh-Hans"];
        
    }
    _languageButtonItem.title = GCLocalizedString(@"Language");
    self.navigationItem.title = GCLocalizedString(@"POS SDK Demo");
    _returnButtonItem.title = GCLocalizedString(@"Back");
    [self.myTableview reloadData];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)sendHandleToRootViewController:(DEVICEHANDLE)handle isConnected:(BOOL)isConnected {
    if (handle != nil) {
        self.handle = handle;
        self.isConnected = isConnected;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *region_Cell = @"MyCell";
    NSString *content = @"";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:region_Cell];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:region_Cell];
    }
    switch (indexPath.section) {
        case 0:
            content = GCLocalizedString(@"Connect Printer");
            break;
        case 1:
            content = GCLocalizedString(@"Sample");
            break;
        case 2:
            content = GCLocalizedString(@"Sample");
            break;
        case 3:
            content = GCLocalizedString(@"Sample");
            break;
        case 4:
            content = GCLocalizedString(@"Product Info");
            break;
        default:
            break;
    }
    cell.textLabel.text = content;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    switch (indexPath.section) {
        case 0:
        {
            CommunicationViewController *communication = [story instantiateViewControllerWithIdentifier:@"CommunicationVC"];
            communication.handle = _handle;
            communication.handleDelegate = self;
            [self.navigationController pushViewController:communication animated:true];
            break;
        }
        case 1:
        {
            if (self.isConnected) {
                PrinterSampleViewController *printerSample = [story instantiateViewControllerWithIdentifier:@"PrinterSampleVC"];
                printerSample.handle = _handle;
                [self.navigationController pushViewController:printerSample animated:true];
            } else {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Unconnected Printer") preferredStyle:UIAlertControllerStyleAlert];
                [[alertVC popoverPresentationController] setSourceView:self.view];
                [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
                [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
                

                UIAlertAction *characterType = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertVC addAction:characterType];
                [self presentViewController:alertVC animated:true completion:nil];
            }
            break;
        }
        case 2:
        {
            if (self.isConnected) {
                APISampleViewController *apiSample = [story instantiateViewControllerWithIdentifier:@"apiSampleVC"];
                apiSample.handle = _handle;
                [self.navigationController pushViewController:apiSample animated:true];
            } else {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Unconnected Printer") preferredStyle:UIAlertControllerStyleAlert];
                [[alertVC popoverPresentationController] setSourceView:self.view];
                [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
                [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
                

                UIAlertAction *characterType = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertVC addAction:characterType];
                [self presentViewController:alertVC animated:true completion:nil];
            }
            break;
        }
        case 3:
        {
            if (self.isConnected) {
                DeviceStatusSampleController *deviceStatusSample = [story instantiateViewControllerWithIdentifier:@"deviceStatusSampleVC"];
                deviceStatusSample.handle = _handle;
                [self.navigationController pushViewController:deviceStatusSample animated:true];
            } else {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Unconnected Printer") preferredStyle:UIAlertControllerStyleAlert];
                [[alertVC popoverPresentationController] setSourceView:self.view];
                [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
                [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
                

                UIAlertAction *characterType = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertVC addAction:characterType];
                [self presentViewController:alertVC animated:true completion:nil];
            }
            break;
        }
        case 4:
        {
            if (self.isConnected) {
                AppendixPIViewController *appendixPI = [story instantiateViewControllerWithIdentifier:@"AppendixPIVC"];
                appendixPI.handle = _handle;
                [self.navigationController pushViewController:appendixPI animated:true];
            } else {
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:GCLocalizedString(@"Tips") message:GCLocalizedString(@"Unconnected Printer") preferredStyle:UIAlertControllerStyleAlert];
                [[alertVC popoverPresentationController] setSourceView:self.view];
                [[alertVC popoverPresentationController] setSourceRect:CGRectMake(0,0,1,1)];
                [[alertVC popoverPresentationController] setPermittedArrowDirections:UIPopoverArrowDirectionUp];
                

                UIAlertAction *characterType = [UIAlertAction actionWithTitle:GCLocalizedString(@"OK") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertVC addAction:characterType];
                [self presentViewController:alertVC animated:true completion:nil];
            }
            break;
        }
        default:
            break;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"";
    switch (section) {
        case 0 :
            title = GCLocalizedString(@"Communication");
            break;
        case 1 :
            title = GCLocalizedString(@"Printer");
            break;
        case 2 :
            title = GCLocalizedString(@"API");
            break;
        case 3 :
            title = GCLocalizedString(@"Device Status");
            break;
        case 4 :
            title = GCLocalizedString(@"Appendix");
            break;
        default :
            break;
    }
    return title;
}

@end
