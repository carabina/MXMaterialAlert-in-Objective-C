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

@interface MXMaterialAlert (Quick)
/**
 * @brief 提示框，只有一个按钮，按钮默认灰底白泽
 */
+ (void)alert:(NSString * _Nullable)title
         info:(NSString * _Nullable)info
       button:(NSString * _Nullable)buttonTitle
       action:(MXMaterialAlertActionBlock _Nullable)onClickListener;

/**
 * @brief 提示框，至少一个positive按钮，positive默认灰底白字，negative默认白底灰字
 */
+ (void)alert:(NSString * _Nullable)title
         info:(NSString * _Nullable)info
     positive:(NSString * _Nullable)positive
     negative:(NSString * _Nullable)negative
       action:(MXMaterialAlertActionBlock _Nullable)onClickListener;

/**
 * @brief 提示框，可以有无限个按钮，按钮默认均为白底灰字
 */
+ (void)alert:(NSString * _Nullable)title
         info:(NSString * _Nullable)info
       action:(MXMaterialAlertActionBlock _Nullable)onClickListener
   forButtons:(NSString * _Nonnull)firstButton, ... NS_REQUIRES_NIL_TERMINATION;

/**
 * @brief 提示框，可以有无限个按钮，按钮默认均为白底灰字
 */
+ (void)alert:(NSString * _Nullable)title
         info:(NSString * _Nullable)info
      buttons:(NSArray <NSString *>* _Nonnull)buttons
       action:(MXMaterialAlertActionBlock _Nullable)onClickListener;
@end
