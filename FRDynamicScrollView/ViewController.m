//
//  ViewController.m
//  FRDynamicScrollView
//
//  Created by Oscar Del Ben on 10/16/11.
//  Copyright (c) 2011 Fructivity. All rights reserved.
//

#import "ViewController.h"
#import "FRDynamicScrollView.h"

#define UIVIEW_OF_HEIGHT(height) [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, height)]

@implementation ViewController
@synthesize scrollView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = UIVIEW_OF_HEIGHT(150);
    UIView *view2 = UIVIEW_OF_HEIGHT(200);
    UIView *view3 = UIVIEW_OF_HEIGHT(50);
    
    view1.backgroundColor = [UIColor redColor];
    view2.backgroundColor = [UIColor grayColor];
    view3.backgroundColor = [UIColor orangeColor];
    
    [scrollView insertView:view1];
    [scrollView insertView:view2];
    [scrollView insertView:view3 atIndex:2 topMargin:50];
    
    scrollView.topMargin = 10;
    scrollView.bottomMargin = 50;
    
    [scrollView calculateViewsPosition];
    
    [view1 release];
    [view2 release];
    [view3 release];
}

- (void)dealloc {
    [scrollView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
