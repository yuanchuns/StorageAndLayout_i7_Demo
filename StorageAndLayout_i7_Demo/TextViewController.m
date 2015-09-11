//
//  TextViewController.m
//  StorageAndLayout_i7_Demo
//
//  Created by guo on 13-8-11.
//  Copyright (c) 2013年 guo5. All rights reserved.
//

#import "TextViewController.h"
#import "TextStorage.h"

@interface TextViewController ()

@end

@implementation TextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);
    
    // NSTextContainer
    NSTextContainer *container = [[NSTextContainer alloc] initWithSize:CGSizeMake(textViewRect.size.width, CGFLOAT_MAX)]; // new in iOS 7.0
    container.widthTracksTextView = YES; // Controls whether the receiveradjusts the width of its bounding rectangle when its text view is resized

    
    // NSLayoutManager
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init]; // new in iOS 7.0
    [layoutManager addTextContainer:container];
    
    
    // NSTextStorage subclass
    self.textStorage = [[TextStorage alloc] init]; // new in iOS 7.0
    [self.textStorage addLayoutManager:layoutManager];
    
    // set TextStorage
    [_textStorage beginEditing];
    /* New letterpress text style added to iOS 7 */
    /*
    NSDictionary *attrsDic = @{NSTextEffectAttributeName: NSTextEffectLetterpressStyle};
    UIKIT_EXTERN NSString *const NSTextEffectAttributeName NS_AVAILABLE_IOS(7_0);          // NSString, default nil: no text effect
    NSMutableAttributedString *mutableAttrString = [[NSMutableAttributedString alloc] initWithString:@"Letterpress" attributes:attrsDic];
    NSAttributedString *appendAttrString = [[NSAttributedString alloc] initWithString:@" Append:Letterpress"];
    [mutableAttrString appendAttributedString:appendAttrString];
    [_textStorage setAttributedString:mutableAttrString];
    */
    
    /* Dynamic Coloring Text */
    self.textStorage.bookItem = [[BookItem alloc] initWithBookName:@"Dynamic Coloring.rtf"];
    self.textStorage.tokens = @{@"Alice": @{NSForegroundColorAttributeName: [UIColor redColor]},
                                @"Rabbit": @{NSForegroundColorAttributeName: [UIColor greenColor]},
                                DefaultTokenName: @{NSForegroundColorAttributeName: [UIColor blackColor]}
                                };
    [_textStorage setAttributedString:_textStorage.bookItem.content];
    [_textStorage endEditing];
    
    
    // UITextView
    UITextView *newTextView = [[UITextView alloc] initWithFrame:textViewRect textContainer:container];
    newTextView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    newTextView.scrollEnabled = YES;
    newTextView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    // newTextView.editable = NO;
    newTextView.font = [UIFont fontWithName:self.textStorage.fontName size:18.0];
    newTextView.dataDetectorTypes = UIDataDetectorTypeAll;
    self.textView = newTextView;
    [self.view addSubview:self.textView];
    
    /*
    CGSize size = [self.textView.text sizeWithFont:[UIFont systemFontOfSize:18.0] constrainedToSize:CGSizeMake(self.textView.frame.size.width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
    NSLog(@"%f", size.height);
    NSInteger length = [self.textStorage length];
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end