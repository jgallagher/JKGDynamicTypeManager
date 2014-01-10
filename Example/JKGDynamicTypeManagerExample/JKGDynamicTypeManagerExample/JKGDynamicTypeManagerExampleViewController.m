//
//  JKGDynamicTypeManagerExampleViewController.m
//  JKGDynamicTypeManagerExample
//
//  Created by John Gallagher on 1/9/14.
//  Copyright (c) 2014 John Gallagher. All rights reserved.
//

#import "JKGDynamicTypeManagerExampleViewController.h"
#import <JKGDynamicTypeManager/JKGDynamicTypeManagedLabel.h>

@interface JKGDynamicTypeManagerExampleViewController ()

@property (weak, nonatomic) IBOutlet JKGDynamicTypeManagedLabel *bodyLabel;

@end

@implementation JKGDynamicTypeManagerExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    JKGDynamicTypeManagedLabel *headlineLabel = [[JKGDynamicTypeManagedLabel alloc] initWithFrame:CGRectZero textStyle:UIFontTextStyleHeadline];
    headlineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    headlineLabel.text = @"Programmatic Headline Label";

    [self.view addSubview:headlineLabel];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[body]-[headline]"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:@{@"body": self.bodyLabel,
                                                                                @"headline": headlineLabel}]];
}


@end
