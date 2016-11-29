//
//  MXMaterialAlertView.m
//  MXMaterialAlert-OC-Demo
//
//  Created by Meniny on 16/7/26.
//  Copyright © 2016年 Meniny. All rights reserved.
//

#import "MXMaterialAlertView.h"
#import "MXMaterialAlertWindow.h"
#import "UIColor+MaterialAlertColor.h"
#import "MXMaterialDefaults.h"

const CGFloat kMXMaterialAlertButtonHeight = 37.0f;

@interface MXMaterialAlertView ()
@property (nonatomic, assign) UIEdgeInsets textInsets;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation MXMaterialAlertView

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, 100.0f, 100.0f)];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, 100.0f, 100.0f)];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4f];
    
    [self setContainerView:[[UIView alloc] initWithFrame:[self bounds]]];
    [self addSubview:[self containerView]];
    
    [self setBackgroundView:[[MXMaterialAlertShadowView alloc] initWithFrame:[self bounds]]];
    [[self backgroundView] setBackgroundColor:[[MXMaterialDefaults standardDefaults] defaultBackgroundColor]];
    [[self backgroundView] setClipsToBounds:YES];
    [[self containerView] addSubview:[self backgroundView]];
    
    [self setTitleLabel:[[UILabel alloc] initWithFrame:[self bounds]]];
    [[self titleLabel] setTextColor:[[MXMaterialDefaults standardDefaults] defaultTitleColor]];
    [[self titleLabel] setFont:[UIFont systemFontOfSize:14.0f]];
    [[self titleLabel] setBackgroundColor:[UIColor clearColor]];
//    [[self titleLabel] setNumberOfLines:1];
    [[self titleLabel] setTextAlignment:NSTextAlignmentLeft];
    [[self titleLabel] setClipsToBounds:YES];
    [[self backgroundView] addSubview:[self titleLabel]];
    
    [self setDetailLabel:[[UILabel alloc] initWithFrame:[self bounds]]];
    [[self detailLabel] setTextColor:[[MXMaterialDefaults standardDefaults] defaultDetailColor]];
    [[self detailLabel] setFont:[UIFont systemFontOfSize:12.0f]];
    [[self detailLabel] setBackgroundColor:[UIColor clearColor]];
    [[self detailLabel] setNumberOfLines:0];
    [[self detailLabel] setTextAlignment:NSTextAlignmentLeft];
    [[self detailLabel] setClipsToBounds:YES];
    [[self backgroundView] addSubview:[self detailLabel]];
    
    [self setButtonsContainer:[[UIView alloc] initWithFrame:[self bounds]]];
    [[self backgroundView] addSubview:[self buttonsContainer]];
    
//    [self addButtons];
    
    [self setTextInsets:UIEdgeInsetsMake(20.0f, 20.0f, 0.0f, 20.0f)];
}

- (void)addButtons {
    for (MXMaterialAlertButton *btn in [[self buttonsContainer] subviews]) {
        [btn removeFromSuperview];
    }
    for (MXMaterialAlertButton *btn in [self buttons]) {
        [[self buttonsContainer] addSubview:btn];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClicked:(MXMaterialAlertButton *)sender {
    if (self.onClickListener) {
        NSString *title = sender.title;
        NSUInteger index = [[self buttons] indexOfObject:sender];
        self.onClickListener(title, index);
    }
}

- (NSMutableArray<MXMaterialAlertButton *> *)buttons {
    if (_buttons == nil) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

- (void)updateView {
    
    [self addButtons];
    
    CGSize containerSize = [[MXMaterialAlertWindow defaultWindow] frame].size;
    CGSize constraintSize = CGSizeMake(containerSize.width * (280.0f / 320.0f), CGFLOAT_MAX);
    
    CGFloat backgroundWidth = constraintSize.width;
    
    CGFloat buttonHeight = kMXMaterialAlertButtonHeight;
    CGFloat buttonWidth;
    
    NSUInteger buttonsCount = self.buttons.count;
    
    switch (buttonsCount) {
        case 2: {
            buttonWidth = backgroundWidth * 0.50f;
        }
            break;
            
        default: {
            buttonWidth = backgroundWidth;
        }
            break;
    }
    
    NSUInteger row = ((buttonsCount > 2) ? buttonsCount : 1);
    CGSize buttonContainerSize = CGSizeMake(backgroundWidth, buttonHeight * row);
    
    CGFloat titleWidth = backgroundWidth - self.textInsets.left - self.textInsets.right;
    CGFloat titleHeight = 14.0f;
    self.titleLabel.frame = CGRectMake(self.textInsets.left, self.textInsets.top, titleWidth, titleHeight);
    
    CGFloat detailWidth = titleWidth;
    CGSize detailSize = [[self detailLabel] sizeThatFits:CGSizeMake(detailWidth, CGFLOAT_MAX)];
    CGFloat detailHeight = detailSize.height;
    CGFloat margin = 13.0f;
    self.detailLabel.frame = CGRectMake(self.textInsets.left,
                                        self.titleLabel.frame.size.height + self.titleLabel.frame.origin.y + margin,
                                        detailWidth,
                                        detailHeight);
    
    if (buttonsCount) {
        for (NSUInteger i = 0; i < buttonsCount; ++i) {
            MXMaterialAlertButton *btn = [[self buttons] objectAtIndex:i];
            if (buttonsCount <= 2) {
                btn.frame = CGRectMake(buttonWidth * i, 0, buttonWidth, buttonHeight);
            } else {
                btn.frame = CGRectMake(0, buttonHeight * i, buttonWidth, buttonHeight);
            }
        }
    }
    self.buttonsContainer.frame = CGRectMake(0,
                                             CGRectGetMaxY(self.detailLabel.frame) + 20.0f,
                                             buttonContainerSize.width,
                                             buttonContainerSize.height);
    
    CGFloat backgroundHeight = CGRectGetMaxY(self.buttonsContainer.frame) + [self textInsets].bottom;
    
    [[self backgroundView] setFrame:CGRectMake(0,
                                               0,
                                               backgroundWidth,
                                               backgroundHeight)];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = 0;
    CGFloat height = 0;
    
//    CGFloat portraitOffsetY = 0;
//    CGFloat landscapeOffsetY = 0;
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown ||
        ![[MXMaterialAlertWindow defaultWindow] shouldRotateManually]) {
        width = containerSize.width;
        height = containerSize.height;
//        y = portraitOffsetY;
    } else {
        width = containerSize.height;
        height = containerSize.width;
//        y = landscapeOffsetY;
    }
    
    CGSize containerViewSize = [[self backgroundView] frame].size;
    x = (width - containerViewSize.width) * 0.5;
    y = (height - containerViewSize.height) * 0.5;
    
    [[self containerView] setFrame:CGRectMake(x, y, containerViewSize.width, containerViewSize.height)];
    
    [self setFrame:[[UIScreen mainScreen] bounds]];
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if ([self superview] != nil) {
//        CGPoint pointInWindow = [self convertPoint:point toView:[self superview]];
//        BOOL contains = CGRectContainsPoint([self frame], pointInWindow);
//        if (contains && [self isUserInteractionEnabled]) {
//            return self;
//        }
//    }
//    return nil;
//}

@end
