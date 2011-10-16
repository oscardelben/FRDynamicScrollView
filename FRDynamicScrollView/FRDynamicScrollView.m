//
//  FRDynamicScrollView.m
//  FRDynamicScrollView
//
//  Created by Oscar Del Ben on 10/16/11.
//  Copyright (c) 2011 Fructivity. All rights reserved.
//

#import "FRDynamicScrollView.h"

#define FR_VIEW_KEY @"FR_VIEW_KEY"
#define FR_VIEW_MARGIN_KEY @"FR_VIEW_MARGIN_KEY"

@implementation FRDynamicScrollView

@synthesize dynamicViews;
@synthesize topMargin;
@synthesize bottomMargin;
@synthesize defaultPadding;

#pragma mark - Memory Management

- (void)dealloc
{
    [dynamicViews release];
    
    [super dealloc];
}

#pragma mark - Initialization code

- (void)setupView
{
    self.dynamicViews = [NSMutableArray array];
    self.topMargin = 0;
    self.bottomMargin = 0;
    self.defaultPadding = 20;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    
    return self;
}

#pragma mark - Utils

- (void)calculateViewsPosition
{
    // remove existing views
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    float yDelta = topMargin;
    int i = 0;

    for (NSDictionary *viewData in self.dynamicViews) {
        UIView *view = [viewData objectForKey:FR_VIEW_KEY];
        
        float margin = [[viewData objectForKey:FR_VIEW_MARGIN_KEY] floatValue];
        
        // calculate new yDelta. But don't do that for the first view
        if (i > 0) {
            yDelta += margin;
        }
        
        // Now change the frame origin accordingly
        view.frame = CGRectMake(view.frame.origin.x, yDelta, view.frame.size.width, view.frame.size.height);
        
        // update yDelta to the bottom of the new view
        yDelta += view.frame.size.height;
        
        [self addSubview:view];
        
        i++;
    }
    
    // Add bottom margin and set content size
    [self setContentSize:CGSizeMake(self.frame.size.width, yDelta + bottomMargin)];
}

- (NSDictionary *)dataForView:(UIView *)aView topMargin:(float)margin
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
            aView, FR_VIEW_KEY,
            [NSNumber numberWithFloat:margin], FR_VIEW_MARGIN_KEY,
            nil];
}

#pragma mark - Public Methods

- (void)insertView:(UIView *)aView atIndex:(NSInteger)index topMargin:(float)margin
{
    NSDictionary *viewData = [self dataForView:aView topMargin:margin];
    [dynamicViews insertObject:viewData atIndex:index];
}

- (void)insertView:(UIView *)aView atIndex:(NSInteger)index
{
    [self insertView:aView atIndex:index topMargin:self.defaultPadding];
}

- (void)insertView:(UIView *)aView
{
    [self insertView:aView atIndex:[dynamicViews count]];
}

- (UIView *)viewAtIndex:(NSInteger)index
{
    return [dynamicViews objectAtIndex:index];
}

- (void)removeViewAtIndex:(NSInteger)index
{
    [dynamicViews removeObjectAtIndex:index];
    [self calculateViewsPosition];
}

- (void)changeFrameOfViewAtIndex:(NSInteger)index withFrame:(CGRect)frame
{
    UIView *view = [[dynamicViews objectAtIndex:index] objectForKey:FR_VIEW_KEY];
    
    view.frame = frame;
    
    [self calculateViewsPosition];
}


@end
