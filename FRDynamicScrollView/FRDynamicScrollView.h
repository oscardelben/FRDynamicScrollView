//
//  FRDynamicScrollView.h
//  FRDynamicScrollView
//
//  Created by Oscar Del Ben on 10/16/11.
//  Copyright (c) 2011 Fructivity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRDynamicScrollView : UIScrollView

@property (nonatomic, retain) NSMutableArray *dynamicViews;
@property (nonatomic, assign) float topMargin;
@property (nonatomic, assign) float bottomMargin;
@property (nonatomic, assign) float defaultPadding;

- (void)calculateViewsPosition;

- (void)insertView:(UIView *)aView atIndex:(NSInteger)index topMargin:(float)margin;
- (void)insertView:(UIView *)aView atIndex:(NSInteger)index;
- (void)insertView:(UIView *)aView;

- (UIView *)viewAtIndex:(NSInteger)index;

- (void)removeViewAtIndex:(NSInteger)index;
- (void)changeFrameOfViewAtIndex:(NSInteger)index withFrame:(CGRect)frame;

@end
