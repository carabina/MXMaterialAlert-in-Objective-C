//
//  MXMaterialAlertButton.m
//  MXSnackbar-OC-Demo
//
//  Created by Elias Abel on 2016/11/29.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXMaterialAlertButton.h"
#import "MXMaterialDefaults.h"

@interface MXMaterialAlertButton () {
    __strong UIColor * _Nullable _titleColor;
    __strong NSString * _Nullable _title;
    MXMaterialAlertButtonType _type;
}

@end

@implementation MXMaterialAlertButton

- (void)setType:(MXMaterialAlertButtonType)type {
    _type = type;
}

+ (instancetype)buttonForType:(MXMaterialAlertButtonType)type {
    MXMaterialAlertButton *button = [MXMaterialAlertButton buttonWithType:UIButtonTypeCustom];
    button.type = type;
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    button.backgroundColor = nil;
    button.title = nil;
    button.titleColor = nil;
    button.clipsToBounds = YES;
    return button;
}

- (NSString *)title {
    if (_title == nil || !_title.length) {
        switch (self.type) {
            case MXMaterialAlertButtonTypeConfirm: {
                _title = [MXMaterialDefaults standardDefaults].defaultPositiveButtonTitle;
            }
                break;
            case MXMaterialAlertButtonTypeCancel: {
                _title = [MXMaterialDefaults standardDefaults].defaultNegativeButtonTitle;
            }
                break;
                
            default: {
                _title = @"";
            }
                break;
        }
    }
    return _title;
}

- (void)setTitle:(NSString *)title {
    if (title == nil) {
        _title = title;
    } else {
        _title = [title copy];
    }
    [super setTitle:[self title] forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [self setTitle:title];
}

- (NSString *)titleForState:(UIControlState)state {
    return [self title];
}

- (UIColor *)titleColor {
    if (_titleColor == nil) {
        switch (self.type) {
            case MXMaterialAlertButtonTypeConfirm: {
                _titleColor = [MXMaterialDefaults standardDefaults].defaultPositiveButtonTitleColor;
            }
                break;
            case MXMaterialAlertButtonTypeCancel: {
                _titleColor = [MXMaterialDefaults standardDefaults].defaultNegativeButtonTitleColor;
            }
                break;
                
            default: {
                _titleColor = [MXMaterialDefaults standardDefaults].defaultNegativeButtonTitleColor;
            }
                break;
        }
    }
    return _titleColor;
}

- (void)setTitleColor:(UIColor *)titleColor {
    if (titleColor == nil) {
        _titleColor = titleColor;
    } else {
        _titleColor = [titleColor copy];
    }
    [super setTitleColor:[self titleColor] forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [self setTitleColor:color];
}

- (UIColor *)titleColorForState:(UIControlState)state {
    return [self titleColor];
}

- (void)setClipsToBounds:(BOOL)clipsToBounds {
    [super setClipsToBounds:YES];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    if (backgroundColor == nil) {
        switch (self.type) {
            case MXMaterialAlertButtonTypeConfirm: {
                [super setBackgroundColor:[MXMaterialDefaults standardDefaults].defaultPositiveButtonColor];
            }
                break;
            case MXMaterialAlertButtonTypeCancel: {
                [super setBackgroundColor:[MXMaterialDefaults standardDefaults].defaultNegativeButtonColor];
            }
                break;
                
            default: {
                [super setBackgroundColor:[MXMaterialDefaults standardDefaults].defaultNegativeButtonColor];
            }
                break;
        }
    } else {
        [super setBackgroundColor:[backgroundColor copy]];
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.0f);
    CGContextSetStrokeColorWithColor(ctx, [MXMaterialDefaults standardDefaults].defaultPositiveButtonColor.CGColor);
    CGContextBeginPath(ctx);
    CGFloat half = 0.5f;
    CGFloat whole = 1.0f;
    CGContextMoveToPoint(ctx, half, half);
    CGContextAddLineToPoint(ctx, self.bounds.size.width - whole, half);
    CGContextDrawPath(ctx, kCGPathStroke);
    CGContextClosePath(ctx);
}

@end
