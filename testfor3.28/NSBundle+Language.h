//
//  NSBundle+Language.h
//  testfor3.28
//
//  Created by yuelin on 2020/11/27.
//  Copyright © 2020 yuelin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define GCLocalizedString(KEY) [[NSBundle mainBundle] localizedStringForKey:KEY value:nil table:@"Localizable"]

@interface NSBundle (Language)

+ (void)setLanguage:(NSString *)language;

@end
