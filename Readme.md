# FRDynamicScrollView

This subclass of UIScrollView allows you to add subviews without having
to worry about calculating their positions every time you do so.

You can also assign a top and bottom margin for you scrollView.

### Sample Code

    // The first view will have an automatic padding of 20px. You can change it if you want.
    [scrollView insertView:view1];
    [scrollView insertView:view2];
    [scrollView insertView:view3 atIndex:2 topMargin:50];
    
    scrollView.topMargin = 10;
    scrollView.bottomMargin = 50;
    
    [scrollView calculateViewsPosition];



See the sample code for details.
