//
//  PickyTabBarController.m
//
//  Created by Jordan Stone on 1/26/12.
//  Copyright (c) 2012 Jordan Stone. All rights reserved.
//  
//  This code may be reused for personal or commercial purposes
//  but comes with no guarentees as to its functionality in all
//  possible circumstances
//

#import "PickyTabBarController.h"

@implementation PickyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // We need to initialize the selected index, otherwise 4.x versions of iOS will crash
        self.selectedIndex = 0;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Let's grab an array of all of the child view controllers of this tab bar controller
    // This has at most 5 items
    NSArray *childVCArray = self.viewControllers;
    
    // We know that at 5 or more tabs, we get a "More" tab for free, which contains, assumingly,
    // a more navigation controller
    
    if (self.selectedIndex <= 3) {
        UINavigationController *navController = [childVCArray objectAtIndex:self.selectedIndex];
        
        // We're in one of the first three tabs, which we know have a top view controller of UIViewController
        UIViewController *viewController = navController.topViewController;

        return [viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }
    else {
        // This will give us a More Navigation Controller
        
        UIViewController *viewController = [childVCArray objectAtIndex:self.selectedIndex];

        return [viewController shouldAutorotateToInterfaceOrientation:interfaceOrientation];
    }

    return NO;
}

@end
