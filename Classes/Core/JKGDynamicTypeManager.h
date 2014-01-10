//
//  JKGDynamicTypeManager.h
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKGDynamicTypeManager : NSObject

// Obtain access to the JKGDynamicTypeManager singleton.
+ (instancetype)sharedInstance;

// Determine which text style matches the given font.
// WARNING: This will only succeed if the font matches the CURRENT
//   font returned by +[UIFont preferredFontForTextStyle:]. One
//   case where this can fail is if you save off a UIFont, then
//   adjust the system-wide dynamic type size, then pass the saved
//   (but now "stale") font to this method.
+ (NSString *)textStyleMatchingFont:(UIFont *)font;

// Start watching an element that must have a -setFont: method. We will
// set its font to [UIFont preferredFontForTextStyle:style] now and any
// time the font size changes (i.e., when the app receives a
// UIContentSizeCategoryDidChangeNotification).
//
// We hold only a weak reference to elementWithFont, so there is no
// equivalent "unwatch".
- (void)watchElement:(id)elementWithFont textStyle:(NSString *)style;

@end
