//
//  MXMaterialAlert.m
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXMaterialAlert.h"
#import "MXMaterialAlertManager.h"
#import "MXMaterialAlertWindow.h"

@interface MXMaterialAlert () {
    BOOL _executing;
    BOOL _finished;
}
@end

@implementation MXMaterialAlert

+ (instancetype)make:(NSString *)format, ... {
    NSString *_detailString;
    if (format != nil) {
        va_list args;
        va_start(args, format);
        _detailString = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    } else {
        _detailString = [MXMaterialDefaults standardDefaults].defaultDetail;
    }
    return [MXMaterialAlert makeWithTitle:[[MXMaterialDefaults standardDefaults] defaultTitle] defail:_detailString];
}

+ (instancetype _Nonnull)makeWithTitle:(NSString *)title format:(NSString *)format, ... {
    
    NSString *_detailString;
    if (format != nil) {
        va_list args;
        va_start(args, format);
        _detailString = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
    } else {
        _detailString = [MXMaterialDefaults standardDefaults].defaultDetail;
    }
    
    return [MXMaterialAlert makeWithTitle:title defail:_detailString];
}

+ (instancetype _Nonnull)makeWithTitle:(NSString *)title defail:(NSString *)detail {
    MXMaterialAlert *materialAlert = [MXMaterialAlert new];
    [[[materialAlert materialAlertView] titleLabel] setText:title];
    [[[materialAlert materialAlertView] detailLabel] setText:detail];
    return materialAlert;
}

- (void)addButton:(MXMaterialAlertButton *)button {
    if (button != nil) {
        [self.materialAlertView.buttons addObject:button];
    }
}

- (void)addButton:(NSString *)title forType:(MXMaterialAlertButtonType)type {
    MXMaterialAlertButton *button = [MXMaterialAlertButton buttonForType:type];
    button.title = title;
    [self addButton:button];
}

- (void)insertButton:(NSString *)title forType:(MXMaterialAlertButtonType)type atIndex:(NSUInteger)index {
    MXMaterialAlertButton *button = [MXMaterialAlertButton buttonForType:type];
    button.title = title;
    [[[self materialAlertView] buttons] insertObject:button atIndex:index];
}

- (void)setOnClickListener:(MXMaterialAlertActionBlock)onClickListener {
    if (onClickListener) {
        _onClickListener = [onClickListener copy];
    } else {
        _onClickListener = onClickListener;
    }
}

#pragma mark - Setter & Getter

- (MXMaterialAlertView *)materialAlertView {
    if (_materialAlertView == nil) {
        _materialAlertView = [MXMaterialAlertView new];
    }
    return _materialAlertView;
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isExecuting {
    return _executing;
}

- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isFinished {
    return _finished;
}

- (NSString *)titleString {
    return [[[self materialAlertView] detailLabel] text];
}

- (NSArray<NSString *> *)buttonsTitle {
    NSMutableArray <NSString *>* titles = [NSMutableArray array];
    for (MXMaterialAlertButton *btn in self.materialAlertView.buttons) {
        [titles addObject:[btn title]];
    }
    return titles;
}

#pragma mark - Show & Hide
- (void)show {
    [[MXMaterialAlertManager defaultManager] addMaterialAlert:self];
}

- (void)hide {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [[strongSelf materialAlertView] setAlpha:0];
                         } completion:^(BOOL finished) {
                             [[strongSelf materialAlertView] removeFromSuperview];
                             [[MXMaterialAlertWindow defaultWindow] setUserInteractionEnabled:NO];
                             [strongSelf finish];
                         }];
    });
}

- (void)start {
    if (![NSThread isMainThread]) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf start];
        });
    } else {
        [super start];
    }
}

- (void)main {
    [self setExecuting:YES];
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        [[strongSelf materialAlertView] updateView];
        [strongSelf setupDefaultClickListener];
        [[strongSelf materialAlertView] setAlpha:0];
        [[MXMaterialAlertWindow defaultWindow] addSubview:[strongSelf materialAlertView]];
        [[MXMaterialAlertWindow defaultWindow] setUserInteractionEnabled:YES];
        
        [UIView animateWithDuration:0.25
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             [[strongSelf materialAlertView] setAlpha:1];
                         } completion:^(BOOL finished) {
                             
                         }];
    });
}

- (void)setupDefaultClickListener {
    if (self.onClickListener) {
        __weak typeof(self) weakSelf = self;
        [[self materialAlertView] setOnClickListener:^(NSString *buttonTitle, NSUInteger buttonIndex) {
            __strong typeof(self) strongSelf = weakSelf;
            if (strongSelf.onClickListener) {
                strongSelf.onClickListener(buttonTitle, buttonIndex);
            }
            [strongSelf hide];
        }];
    } else {
        __weak typeof(self) weakSelf = self;
        [[self materialAlertView] setOnClickListener:^(NSString *buttonTitle, NSUInteger buttonIndex) {
            __strong typeof(self) strongSelf = weakSelf;
            [strongSelf hide];
        }];
    }
}

- (void)cancel {
    [super cancel];
    [self finish];
    [[self materialAlertView] removeFromSuperview];
}

- (void)finish {
    [self setExecuting:NO];
    [self setFinished:YES];
}
@end


@implementation MXMaterialAlert (Quick)

+ (void)alert:(NSString *)title info:(NSString *)info button:(NSString *)buttonTitle action:(MXMaterialAlertActionBlock)onClickListener {
    
    [MXMaterialAlert alert:title info:info positive:buttonTitle negative:nil action:onClickListener];
}

+ (void)alert:(NSString *)title info:(NSString *)info positive:(NSString *)positive negative:(NSString *)negative action:(MXMaterialAlertActionBlock)onClickListener {
    
    MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:title defail:info];
    
    if (negative) {
        [material addButton:negative forType:MXMaterialAlertButtonTypeCancel];
    }
    [material addButton:positive forType:MXMaterialAlertButtonTypeConfirm];
    
    [material setOnClickListener:onClickListener];
    
    [material show];
}

+ (void)alert:(NSString *)title info:(NSString *)info action:(MXMaterialAlertActionBlock)onClickListener forButtons:(NSString *)firstButton, ... {
    
    NSMutableArray <NSString *>*titles = [NSMutableArray array];
    [titles addObject:firstButton];
    
    va_list argumentList;
    va_start(argumentList, firstButton);
    NSString *eachTitle = va_arg(argumentList, id);
    while (eachTitle) {
        [titles addObject:eachTitle];
        eachTitle = va_arg(argumentList, id);
    }
    va_end(argumentList);
    
    [MXMaterialAlert alert:title info:info buttons:titles action:onClickListener];
}

+ (void)alert:(NSString *)title info:(NSString *)info buttons:(NSArray<NSString *> *)buttons action:(MXMaterialAlertActionBlock)onClickListener {
    
    if (buttons == nil || buttons.count < 1) {
        [MXMaterialAlert alert:title info:info button:@"确定" action:onClickListener];
    } else if (buttons.count == 1) {
        [MXMaterialAlert alert:title info:info button:[buttons firstObject] action:onClickListener];
    } else {
        MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:title defail:info];
        
        for (NSString *title in buttons) {
            [material addButton:title forType:MXMaterialAlertButtonTypeCustom];
        }
        [material setOnClickListener:onClickListener];
        
        [material show];
    }
    
}

@end


