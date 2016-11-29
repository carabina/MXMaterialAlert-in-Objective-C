//
//  MXMaterialDefaults.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MXMaterialDefaults : NSObject

@property (nonatomic, copy) NSString * _Nonnull defaultTitle;
@property (nonatomic, copy) UIColor * _Nonnull defaultTitleColor;

@property (nonatomic, copy) NSString * _Nonnull defaultDetail;
@property (nonatomic, copy) UIColor * _Nonnull defaultDetailColor;

@property (nonatomic, copy) NSString * _Nonnull defaultPositiveButtonTitle;
@property (nonatomic, copy) UIColor * _Nonnull defaultPositiveButtonTitleColor;
@property (nonatomic, copy) UIColor * _Nonnull defaultPositiveButtonColor;

@property (nonatomic, copy) NSString * _Nonnull defaultNegativeButtonTitle;
@property (nonatomic, copy) UIColor * _Nonnull defaultNegativeButtonTitleColor;
@property (nonatomic, copy) UIColor * _Nonnull defaultNegativeButtonColor;

@property (nonatomic, copy) UIColor * _Nonnull defaultSeparatorColor;
@property (nonatomic, copy) UIColor * _Nonnull defaultBackgroundColor;

+ (instancetype _Nonnull)standardDefaults;
@end
