//
//  JKGDynamicTypeManagerSpec.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright 2014 John Gallagher. All rights reserved.
//

#import <Kiwi.h>
#import "JKGDynamicTypeManager.h"

@interface ElementWithFont : NSObject
@property (nonatomic, strong) UIFont *font;
@end

@implementation ElementWithFont
@end

SPEC_BEGIN(JKGDynamicTypeManagerSpec)

describe(@"JKGDynamicTypeManager", ^{
    __block JKGDynamicTypeManager *manager;
    __block ElementWithFont *element;

    beforeEach(^{
        manager = [[JKGDynamicTypeManager alloc] init];
        element = [[ElementWithFont alloc] init];
    });

    describe(@"+textStyleMatchingFont:", ^{
        it(@"matches all expected text styles", ^{
            for (NSString *style in @[UIFontTextStyleBody,
                                      UIFontTextStyleCaption1,
                                      UIFontTextStyleCaption2,
                                      UIFontTextStyleFootnote,
                                      UIFontTextStyleHeadline,
                                      UIFontTextStyleSubheadline]) {
                UIFont *font = [UIFont preferredFontForTextStyle:style];
                [[[JKGDynamicTypeManager textStyleMatchingFont:font] should] equal:style];
            }
        });

        it(@"returns nil for non-system-text-style fonts", ^{
            UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
            font = [font fontWithSize:font.pointSize * 2];
            [[[JKGDynamicTypeManager textStyleMatchingFont:font] should] beNil];
        });
    });

    describe(@"-watchElement:textStyle:", ^{
        beforeEach(^{
            [manager watchElement:element textStyle:UIFontTextStyleBody];
        });

        it(@"sets watched elements' fonts immediately", ^{
            [[element.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"sets watched elements' fonts when receiving UIContentSizeCategoryDidChangeNotification", ^{
            element.font = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:UIContentSizeCategoryDidChangeNotification object:nil];
            [[element.font should] equal:[UIFont preferredFontForTextStyle:UIFontTextStyleBody]];
        });

        it(@"holds watched elements weakly", ^{
            __weak ElementWithFont *weakElement = element;
            element = nil;
            [[weakElement should] beNil];
        });
    });
});

SPEC_END
