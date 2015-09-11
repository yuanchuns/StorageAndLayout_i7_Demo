//
//  TextViewController.h
//  StorageAndLayout_i7_Demo
//
//  Created by guo on 13-8-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TextStorage;

@interface TextViewController : UIViewController
@property (nonatomic, strong) UITextView  *textView;
@property (nonatomic, strong) TextStorage *textStorage;
@end