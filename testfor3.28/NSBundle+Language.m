//
//  NSBundle+Language.m
//  testfor3.28
//
//  Created by yuelin on 2020/11/27.
//  Copyright © 2020 yuelin. All rights reserved.
//

#import "NSBundle+Language.h"
#import <objc/runtime.h>

static NSString *const GCLanguageKey = @"AppLanguagesKey";

@interface BundleEx : NSBundle

@end

@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    NSString *currentLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:GCLanguageKey];
    currentLanguage = currentLanguage ? currentLanguage : @"en";
    NSBundle *currentLanguageBundle = currentLanguage ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:currentLanguage ofType:@"lproj"]] : nil;
    return currentLanguageBundle ? [currentLanguageBundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (Language)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    });
}

+ (void)setLanguage:(NSString *)language {
    [[NSUserDefaults standardUserDefaults] setObject:language forKey:GCLanguageKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
