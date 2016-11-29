//
//  MXMaterialAlertManager.m
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXMaterialAlertManager.h"

@interface MXMaterialAlertManager ()
@property (nonatomic, strong) NSOperationQueue *queue;
@end

@implementation MXMaterialAlertManager

#pragma mark - Allocation
- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
    }
    return self;
}

+ (instancetype)defaultManager {
    static MXMaterialAlertManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [MXMaterialAlertManager new];
    });
    return instance;
}

#pragma mark - Getter & Setter

- (NSOperationQueue *)queue {
    if (_queue == nil) {
        _queue = [NSOperationQueue new];
        [_queue setMaxConcurrentOperationCount:1];
    }
    return _queue;
}

- (MXMaterialAlert *)currentMaterialAlert {
    if ([[self queue] operationCount]) {
        return (MXMaterialAlert *)[[[self queue] operations] firstObject];
    }
    return nil;
}

#pragma mark - Actions

- (void)addMaterialAlert:(MXMaterialAlert *)materialAlert {
    if (materialAlert != nil) {
        [[self queue] addOperation:materialAlert];
    }
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    if ([[self queue] operationCount]) {
        MXMaterialAlert *lastMaterialAlert = (MXMaterialAlert *)[[[self queue] operations] firstObject];
        if ([lastMaterialAlert materialAlertView] != nil) {
            [[lastMaterialAlert materialAlertView] updateView];
        }
    }
}

- (void)cancelAllMaterialAlert {
    for (MXMaterialAlert *materialAlert in [[self queue] operations]) {
        [materialAlert cancel];
    }
}
@end
