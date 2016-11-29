//
//  MXMaterialAlert.h
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXMaterialAlertView.h"
#import "MXMaterialDefaults.h"
#import "MXMaterialAlertButton.h"

@interface MXMaterialAlert : NSOperation
@property (nonatomic, copy, readonly) NSString * _Nullable titleString;
@property (nonatomic, copy, readonly) NSString * _Nullable detailString;
@property (nonatomic, copy, readonly) NSArray <NSString *>* _Nonnull buttonsTitle;
@property (nonatomic, strong) MXMaterialAlertView * _Nonnull materialAlertView;
/**
 *  Set MXMaterialAlert Action Button Title and Click Action
 *
 *  @param buttonTitle Title of clicked button
 *  @param buttonIndex Index of clicked button
 *
 *  @return The MXMaterialAlert Instance
 */
@property (nonatomic, copy) MXMaterialAlertActionBlock _Nullable onClickListener;

/**
 *  Build an Instance of MXMaterialAlert (MXMaterialAlertDefault)
 *
 *  @param format Formatted NSString
 *
 *  @return An MXMaterialAlert Instance
 */
+ (instancetype _Nonnull)make:(NSString * _Nullable)format, ...;
+ (instancetype _Nonnull)makeWithTitle:(NSString * _Nullable)title format:(NSString * _Nullable)format, ...;

+ (instancetype _Nonnull)makeWithTitle:(NSString * _Nullable)title defail:(NSString * _Nullable)detail;

- (void)addButton:(MXMaterialAlertButton * _Nullable)button;
- (void)addButton:(NSString * _Nullable)title forType:(MXMaterialAlertButtonType)type;
- (void)insertButton:(NSString * _Nullable)title forType:(MXMaterialAlertButtonType)type atIndex:(NSUInteger)index;

/**
 *  Show MXMaterialAlert
 */
- (void)show;
/**
 *  Hide MXMaterialAlert
 */
- (void)hide;
@end
