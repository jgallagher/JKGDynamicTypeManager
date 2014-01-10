//
//  JKGDynamicTypeManagedTextFieldSpec.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright 2014 John Gallagher. All rights reserved.
//

#import <Kiwi.h>
#import "JKGDynamicTypeManagedTextField.h"

SPEC_BEGIN(JKGDynamicTypeManagedTextFieldSpec)

describe(@"JKGDynamicTypeManagedTextField", ^{
    __block JKGDynamicTypeManagedTextField *textField;

    describe(@"-initWithFrame:textStyle:", ^{
        beforeEach(^{
            textField = [[JKGDynamicTypeManagedTextField alloc] initWithFrame:CGRectZero textStyle:UIFontTextStyleBody];
        });

        it(@"sets the textField's font to the appropriately-styled font", ^{
            [[textField.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a textField whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            textField.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[textField.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });

    describe(@"-initWithCoder:", ^{
        beforeEach(^{
            textField = nil;

            NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
            for (id obj in [testBundle loadNibNamed:@"JKGDynamicTypeManagedTextField" owner:self options:nil]) {
                if ([obj isKindOfClass:[UITextField class]]) {
                    textField = obj;
                    break;
                }
            }
        });

        it(@"sets the textField's font to the appropriately-styled font", ^{
            [[textField.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"creates a textField whose font is updated when receiving UIContentSizeCategoryDidChangeNotification", ^{
            textField.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[textField.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });
    });
});

SPEC_END
