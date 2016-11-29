//
//  MXMaterialDefaults.m
//  MXMaterialAlert-OC-Demo
//
//        _==/          i     i          \==_
//      /XX/            |\___/|            \XX\
//    /XXXX\            |XXXXX|            /XXXX\
//   |XXXXXX\_         _XXXXXXX_         _/XXXXXX|
//  XXXXXXXXXXXxxxxxxxXXXXXXXXXXXxxxxxxxXXXXXXXXXXX
// |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
// XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
// |XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
//  XXXXXX/^^^^"\XXXXXXXXXXXXXXXXXXXXX/^^^^^\XXXXXX
//   |XXX|       \XXX/^^\XXXXX/^^\XXX/       |XXX|
//     \XX\       \X/    \XXX/    \X/       /XX/
//        "\       "      \X/      "      /"
//
//
//     _____ _ _                _    _          _
//    | ____| (_) __ _ ___     / \  | |__   ___| |
//    |  _| | | |/ _` / __|   / _ \ | '_ \ / _ \ |
//    | |___| | | (_| \__ \  / ___ \| |_) |  __/ |
//    |_____|_|_|\__,_|___/ /_/   \_\_.__/ \___|_|
//
//  Created by Elias Abel on 2016/11/29.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXMaterialDefaults.h"

@implementation MXMaterialDefaults

+ (instancetype)standardDefaults {
    static MXMaterialDefaults *instance;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[MXMaterialDefaults alloc] init] ;
    });
    return instance;
}

#pragma mark - Lazy

- (NSString *)defaultTitle {
    if (_defaultTitle == nil) {
        _defaultTitle = NSLocalizedString(@"Notification", nil);
    }
    return _defaultTitle;
}

- (NSString *)defaultDetail {
    if (_defaultDetail == nil) {
        _defaultDetail = NSLocalizedString(@"Attention Please", nil);
    }
    return _defaultDetail;
}

- (NSString *)defaultPositiveButtonTitle {
    if (_defaultPositiveButtonTitle == nil) {
        _defaultPositiveButtonTitle = NSLocalizedString(@"OK", nil);
    }
    return _defaultPositiveButtonTitle;
}

- (NSString *)defaultNegativeButtonTitle {
    if (_defaultNegativeButtonTitle == nil) {
        _defaultNegativeButtonTitle = NSLocalizedString(@"Cancel", nil);
    }
    return _defaultNegativeButtonTitle;
}

- (UIColor *)defaultTitleColor {
    if (_defaultTitleColor == nil) {
        _defaultTitleColor = [UIColor blackColor];
    }
    return _defaultTitleColor;
}

- (UIColor *)defaultDetailColor {
    if (_defaultDetailColor == nil) {
        _defaultDetailColor = [UIColor darkGrayColor];
    }
    return _defaultDetailColor;
}

- (UIColor *)defaultPositiveButtonTitleColor {
    if (_defaultPositiveButtonTitleColor == nil) {
        _defaultPositiveButtonTitleColor = [UIColor whiteColor];
    }
    return _defaultPositiveButtonTitleColor;
}

- (UIColor *)defaultPositiveButtonColor {
    if (_defaultPositiveButtonColor == nil) {
        _defaultPositiveButtonColor = [MXMaterialDefaults defaultFillColor];
    }
    return _defaultPositiveButtonColor;
}

- (UIColor *)defaultNegativeButtonTitleColor {
    if (_defaultNegativeButtonTitleColor == nil) {
        _defaultNegativeButtonTitleColor = [UIColor darkGrayColor];
    }
    return _defaultNegativeButtonTitleColor;
}

- (UIColor *)defaultNegativeButtonColor {
    if (_defaultNegativeButtonColor == nil) {
        _defaultNegativeButtonColor = [UIColor whiteColor];
    }
    return _defaultNegativeButtonColor;
}

- (UIColor *)defaultSeparatorColor {
    if (_defaultSeparatorColor == nil) {
        _defaultSeparatorColor = [MXMaterialDefaults defaultFillColor];
    }
    return _defaultSeparatorColor;
}

- (UIColor *)defaultBackgroundColor {
    if (_defaultBackgroundColor == nil) {
        _defaultBackgroundColor = [UIColor whiteColor];
    }
    return _defaultBackgroundColor;
}

#pragma mark - value getters
/**
 * @brief Gunsmoke Color
 * @return default color
 */
+ (UIColor *)defaultFillColor {
    return [UIColor colorWithRed:0.50 green:0.51 blue:0.54 alpha:1.00];
}

@end





