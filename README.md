# MXMaterialAlert-in-Objective-C

`MXMaterialAlert` is a material style alert view for iOS.

## Installation with CocoaPods

```bash
pod 'MXMaterialAlert', '~> 2.0.0'
```

## Usage

```objective-c
#import "MXMaterialAlert.h"
```

```objective-c
MXMaterialAlert *material = [MXMaterialAlert makeWithTitle:@"Title" format:@"Some content here，hahahahahha😄", arc4random_uniform(999)];
[material addButton:@"Confirm" forType:MXMaterialAlertButtonTypeConfirm];

__weak typeof(self) weakSelf = self;
[material setOnClickListener:^(NSString *title, NSUInteger index) {
  __strong typeof(self) strongSelf = weakSelf;
  [strongSelf doSomeOtherThings];
}];

[material show];
```
