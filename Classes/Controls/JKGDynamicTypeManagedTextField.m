//
//  JKGDynamicTypeManagedTextField.m
//  JKGDynamicTypeManager
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "JKGDynamicTypeManagedTextField.h"
#import "JKGDynamicTypeManager.h"

@implementation JKGDynamicTypeManagedTextField

- (id)initWithFrame:(CGRect)frame textStyle:(NSString *)style
{
    self = [super initWithFrame:frame];
    if (self) {
        [[JKGDynamicTypeManager sharedInstance] watchElement:self
                                                   textStyle:style];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Try to figure out which text style we currently have
        NSString *style = [JKGDynamicTypeManager textStyleMatchingFont:self.font];
        if (style) {
            [[JKGDynamicTypeManager sharedInstance] watchElement:self
                                                       textStyle:style];
        }
    }
    return self;
}

@end
