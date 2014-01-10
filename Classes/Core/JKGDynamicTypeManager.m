//
//  JKGDynamicTypeManager.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "JKGDynamicTypeManager.h"

@interface JKGDynamicTypeManager ()

@property (nonatomic, strong) NSMapTable *fontTable;

@end

@implementation JKGDynamicTypeManager

+ (instancetype)sharedInstance
{
    static JKGDynamicTypeManager *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JKGDynamicTypeManager alloc] init];
    });
    return sharedInstance;
}

+ (NSString *)textStyleMatchingFont:(UIFont *)font
{
    static NSArray *textStyles;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        textStyles = @[UIFontTextStyleBody,
                       UIFontTextStyleCaption1,
                       UIFontTextStyleCaption2,
                       UIFontTextStyleFootnote,
                       UIFontTextStyleHeadline,
                       UIFontTextStyleSubheadline];
    });

    for (NSString *style in textStyles) {
        if ([font isEqual:[UIFont preferredFontForTextStyle:style]]) {
            return style;
        }
    }

    return nil;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _fontTable = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsWeakMemory
                                               valueOptions:NSPointerFunctionsCopyIn
                                                   capacity:0];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(noteUIContentSizeCategoryDidChange:)
                                                     name:UIContentSizeCategoryDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)noteUIContentSizeCategoryDidChange:(NSNotification *)note
{
    for (id element in self.fontTable) {
        NSString *style = [self.fontTable objectForKey:element];
        [element setFont:[UIFont preferredFontForTextStyle:style]];
    }
}

- (void)watchElement:(id)elementWithFont textStyle:(NSString *)style
{
    [elementWithFont setFont:[UIFont preferredFontForTextStyle:style]];
    [self.fontTable setObject:style forKey:elementWithFont];
}

@end
