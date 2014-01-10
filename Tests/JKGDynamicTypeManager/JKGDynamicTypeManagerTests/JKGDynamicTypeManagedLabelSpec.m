//
//  JKGDynamicTypeManagedLabelSpec.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright 2014 John Gallagher. All rights reserved.
//

#import <Kiwi.h>
#import "JKGDynamicTypeManagedLabel.h"

SPEC_BEGIN(JKGDynamicTypeManagedLabelSpec)

describe(@"JKGDynamicTypeManagedLabel", ^{
    __block JKGDynamicTypeManagedLabel *label;

    describe(@"-initWithFrame:textStyle:", ^{
        beforeEach(^{
            label = [[JKGDynamicTypeManagedLabel alloc] initWithFrame:CGRectZero textStyle:UIFontTextStyleBody];
        });

        it(@"sets the label's font to the appropriately-styled font", ^{
            [[label.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a label whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            label.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[label.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });

    describe(@"-initWithCoder:", ^{
        beforeEach(^{
            label = nil;

            NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
            for (id obj in [testBundle loadNibNamed:@"JKGDynamicTypeManagedLabel" owner:self options:nil]) {
                if ([obj isKindOfClass:[UILabel class]]) {
                    label = obj;
                    break;
                }
            }
        });

        it(@"sets the label's font to the appropriately-styled font", ^{
            [[label.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a label whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            label.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[label.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });
});

SPEC_END
