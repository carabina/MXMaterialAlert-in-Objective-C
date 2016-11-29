//
//  MXMaterialAlertManager.h
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MXMaterialAlert.h"

@interface MXMaterialAlertManager : NSObject
+ (instancetype _Nonnull)defaultManager;
- (void)addMaterialAlert:(MXMaterialAlert * _Nullable)materialAlert;
- (MXMaterialAlert * _Nullable)currentMaterialAlert;
- (void)cancelAllMaterialAlert;
@end
