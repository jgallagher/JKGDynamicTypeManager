//
//  JKGDynamicTypeManagedTextView.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright 2014 John Gallagher. All rights reserved.
//

#import <Kiwi.h>
#import "JKGDynamicTypeManagedTextView.h"

SPEC_BEGIN(JKGDynamicTypeManagedTextViewSpec)

describe(@"JKGDynamicTypeManagedTextView", ^{
    __block JKGDynamicTypeManagedTextView *textView;

    describe(@"-initWithFrame:textStyle:", ^{
        beforeEach(^{
            textView = [[JKGDynamicTypeManagedTextView alloc] initWithFrame:CGRectZero textStyle:UIFontTextStyleBody];
        });

        it(@"sets the textView's font to the appropriately-styled font", ^{
            [[textView.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a textView whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            textView.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[textView.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });

    describe(@"-initWithCoder:", ^{
        beforeEach(^{
            textView = nil;

            NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
            for (id obj in [testBundle loadNibNamed:@"JKGDynamicTypeManagedTextView" owner:self options:nil]) {
                if ([obj isKindOfClass:[UITextView class]]) {
                    textView = obj;
                    break;
                }
            }
        });

        it(@"sets the textView's font to the appropriately-styled font", ^{
            [[textView.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a textView whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            textView.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[textView.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });
});

SPEC_END
