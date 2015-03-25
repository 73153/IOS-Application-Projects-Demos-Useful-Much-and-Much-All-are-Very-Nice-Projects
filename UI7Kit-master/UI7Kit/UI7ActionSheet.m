//
//  UI7ActionSheet.m
//  UI7Kit
//
//  Created by Jeong YunWon on 13. 6. 16..
//  Copyright (c) 2013 youknowone.org. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "UI7Font.h"
#import "UI7Color.h"

#import "UI7ActionSheet.h"

@interface UIActionSheet (Private)

@property(nonatomic,readonly) UILabel *_titleLabel __deprecated; // rejected
@property(nonatomic,readonly) NSMutableArray *buttons __deprecated; // not rejected but warned
@property(nonatomic,readonly) UITableView *tableView;

@end


@interface UIActionSheet (Accessor)

@property(nonatomic,readonly) UILabel *titleLabel;

@end


@implementation UIActionSheet (Accessor)

NSAPropertyGetter(titleLabel, @"_titleLabel");

@end


@implementation UIActionSheet (Patch)

- (id)init { return [super init]; }
- (id)__init { assert(NO); return nil; }
- (void)__showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated { assert(NO); }
- (void)__showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated { assert(NO); }
- (void)__showFromTabBar:(UITabBar *)view { assert(NO); }
- (void)__showFromToolbar:(UIToolbar *)view { assert(NO); }
- (void)__showInView:(UIView *)view { assert(NO); }
- (UITableViewCell *)__tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { assert(NO); return nil; }
- (CGFloat)__tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath { assert(NO); return .0f; }

- (void)_setTheme {
    self.opaque = NO;
    self.backgroundColor = UIColor.clearColor;
    
    if (self.numberOfButtons > 0) { // if there is no buttons, keep the background image
        for (id view in self.subviews) {
            if ([view isKindOfClass:[UIImageView class]]) {
                [view removeFromSuperview]; // background image
            }
        }
    }

    self.titleLabel.textColor = [UIColor colorWith8bitWhite:88 alpha:255];
    self.titleLabel.shadowOffset = CGSizeZero;

    BOOL isPhone = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
    CGFloat leftMargin = isPhone ? 8.0f : .0f;

    __block CGFloat lowestY = .0;
    SEL buttonsSelector = NSSelectorFromString([@"but" stringByAppendingString:@"tons"]);
    NSArray *buttons = [self performSelector:buttonsSelector];

    [buttons applyProcedureWithIndex:^(id obj, NSUInteger index) {
        UIButton *button = obj; // UIAlertButton
        
        CGRect frame = button.frame;
        frame.size = CGSizeMake(304.0f, UI7ControlRowHeight - 0.5f);
        frame.origin.x = leftMargin;
        frame.size.width = self.frame.size.width - 2 * leftMargin;
        if (self.cancelButtonIndex == (NSInteger)index) {
            frame.origin.y = self.titleLabel.frame.size.height + 45.0f + (buttons.count - 1) * UI7ControlRowHeight;
        } else {
            frame.origin.y = self.titleLabel.frame.size.height + 35.0f + index * UI7ControlRowHeight;
        }
        lowestY = MAX(lowestY, frame.origin.y);
        button.frame = frame;
        
        if (self.cancelButtonIndex == (NSInteger)index) {
            button.titleLabel.font = [UI7Font systemFontOfSize:button.titleLabel.font.pointSize attribute:UI7FontAttributeMedium];
        } else {
            button.titleLabel.font = [UI7Font systemFontOfSize:button.titleLabel.font.pointSize attribute:UI7FontAttributeLight];
        }
        
        [button setBackgroundColor:[UIColor darkGrayColor]];
        
        UIBezierPath *path = nil;
        
        if (index == 0) {
            if (self.titleLabel.text.length == 0) {
                path = [UIBezierPath bezierPathWithRoundedRect:button.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:UI7ControlRadiusSize];
            }
        } else if ((NSInteger)index == self.cancelButtonIndex) {
            path = [UIBezierPath bezierPathWithRoundedRect:button.bounds cornerRadius:UI7ControlRadius];
        } else if (index == buttons.count - 1 - (self.cancelButtonIndex >= 0 ? 1 : 0)) {
            path = [UIBezierPath bezierPathWithRoundedRect:button.bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:UI7ControlRadiusSize];
        }

        button.backgroundColor = [UIColor clearColor];
        UIColor *selectedColor = [UIColor colorWith8bitWhite:231 alpha:231];
        if (path) {
            [button setBackgroundImage:[path imageWithFillColor:[UI7Color defaultBarColor]] forState:UIControlStateNormal];
        
            [button setBackgroundImage:[path imageWithFillColor:selectedColor] forState:UIControlStateHighlighted];
        } else {
            [button setBackgroundImage:[UIImage imageWithColor:[UI7Color defaultBarColor] size:button.bounds.size] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageWithColor:selectedColor size:button.bounds.size] forState:UIControlStateHighlighted];
        }
        
        UIColor *color = nil;
        if ((self.destructiveButtonIndex == (NSInteger)index) && (self.destructiveButtonIndex != self.cancelButtonIndex)) {
            color = [UI7Color defaultEmphasizedColor];
        } else {
            color = [UI7Color defaultTintColor];
        }
        [button setTitleColor:color forState:UIControlStateNormal];
        [button setTitleColor:color forState:UIControlStateHighlighted];
        button.titleLabel.shadowOffset = CGSizeZero;

        button.opaque = NO;
    }];

    CGRect frame = self.frame;
    frame.size.height = lowestY + UI7ControlRowHeight + 6.0f;
    frame.origin.y = self.superview.frame.size.height - frame.size.height;

    if (self.titleLabel.text.length > 0) {
        CGRect tframe = self.titleLabel.frame;
        tframe.origin.y += 10.0f;
        self.titleLabel.frame = tframe;

        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(leftMargin, 10.0f, self.frame.size.width - 2 * leftMargin, 24.5f + self.titleLabel.frame.size.height) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:UI7ControlRadiusSize];
        UIImageView *backgroundView = [[[UIImageView alloc] initWithImage:[path imageWithFillColor:[UI7Color defaultBarColor]]] autorelease];
        
        [self insertSubview:backgroundView belowSubview:self.titleLabel];
    }

    UIView *lastView = self.subviews[self.subviews.count - 1];
    if (![lastView isKindOfClass:[UIButton class]]) {
        if (frame.origin.y >= 0) {
            for (UIView *view in self.subviews) {
                view.hidden = NO;
            }
            lastView.hidden = YES;
        } else {
            CGFloat diff = frame.size.height - self.superview.bounds.size.height;
            frame = self.superview.bounds;
            CGFloat top = 2000.0f;
            for (UIButton *button in buttons) {
                if (button.hidden) continue;
                if (button.frame.origin.y <= lastView.frame.origin.y) continue;
                CGFloat bottom = button.frame.origin.y + button.frame.size.height;
                if (bottom >= frame.size.height) {
                    CGRect bframe = button.frame;
                    bframe.origin.y -= diff;
                    button.frame = bframe;
                }
                top = MIN(top, button.frame.origin.y);
            }
            [lastView.subviews[1] setHidden:YES];

            UIButton *aButton = buttons[0];
            CGRect tframe = lastView.frame;
            tframe.origin.y += 1.0f;
            tframe.size.height = top - tframe.origin.y - 8.0f;
            tframe.origin.x = aButton.frame.origin.x;
            tframe.size.width = aButton.frame.size.width;
            lastView.frame = tframe;
            UITableView *tableView = lastView.subviews[0];
            CGRect bound = lastView.bounds;
            bound.size.height -= UI7ControlRadius;
            tableView.frame = bound;
            tableView.layer.cornerRadius = .0f;
            tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
            tableView.backgroundView = nil;
            //tableView.rowHeight = UI7ControlRowHeight;

            CGRect footerFrame = CGRectMake(.0, .0, bound.size.width, UI7ControlRadius);
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:footerFrame byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:UI7ControlRadiusSize];
            UIImageView *footerView = [[[UIImageView alloc] initWithImage:[path imageWithFillColor:[UI7Color defaultBarColor]]] autorelease];
            footerFrame.origin = tableView.frame.origin;
            footerFrame.origin.y += tableView.frame.size.height;
            footerView.frame = footerFrame;
            [lastView addSubview:footerView];
        }
    }

    self.frame = frame;

    if (!isPhone) {
        UIView *ssuperview = self.superview.superview;
        UIView *firstSubview = ssuperview.subviews[0];
        if (self.superview != firstSubview) {
            frame = ssuperview.frame;
            frame.size.height += 45.0f;
            ssuperview.frame = frame;
            [firstSubview setHidden:YES];
            UIView *dimmingView = [[[UIView alloc] initWithFrame:self.window.bounds] autorelease];
            dimmingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.15];
            dimmingView.hidden = YES;
            [ssuperview.superview insertSubview:dimmingView belowSubview:ssuperview];
            [dimmingView setHidden:NO animated:YES];
        }
    }
}

@end


@interface UI7ActionSheet ()

@end


@implementation UI7ActionSheet

+ (void)initialize {
    if (self == [UI7ActionSheet class]) {
        Class target = [UIActionSheet class];
        
        [target copyToSelector:@selector(__init) fromSelector:@selector(init)];
        [target copyToSelector:@selector(__showFromBarButtonItem:animated:) fromSelector:@selector(showFromBarButtonItem:animated:)];
        [target copyToSelector:@selector(__showFromRect:inView:animated:) fromSelector:@selector(showFromRect:inView:animated:)];
        [target copyToSelector:@selector(__showFromTabBar:) fromSelector:@selector(showFromTabBar:)];
        [target copyToSelector:@selector(__showFromToolbar:) fromSelector:@selector(showFromToolbar:)];
        [target copyToSelector:@selector(__showInView:) fromSelector:@selector(showInView:)];
        //[target copyToSelector:@selector(__tableView:cellForRowAtIndexPath:) fromSelector:@selector(tableView:cellForRowAtIndexPath:)];
        //[target copyToSelector:@selector(__tableView:heightForRowAtIndexPath:) fromSelector:@selector(tableView:heightForRowAtIndexPath:)];
    }
}

+ (void)patch {
    Class target = [UIActionSheet class];
    
    [self exportSelector:@selector(init) toClass:target];
    [self exportSelector:@selector(showFromBarButtonItem:animated:) toClass:target];
    [self exportSelector:@selector(showFromRect:inView:animated:) toClass:target];
    [self exportSelector:@selector(showFromTabBar:) toClass:target];
    [self exportSelector:@selector(showFromToolbar:) toClass:target];
    [self exportSelector:@selector(showInView:) toClass:target];
    [self exportSelector:@selector(drawRect:) toClass:target];
    //[self exportSelector:@selector(tableView:cellForRowAtIndexPath:) toClass:target];
    //[self exportSelector:@selector(tableView:heightForRowAtIndexPath:) toClass:target];
}

- (id)init {
    self = [self __init];
    if (self != nil) {

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // blow up stupid backgrounds >:|
}

// common method calls
// - UI7ActionSheet UIActionSheet presentSheetFromButtonBar:
// - UI7ActionSheet UIActionSheet presentSheetFromBehindView:
// - UI7ActionSheet UIActionSheet _presentSheetFromView:above:
// - layout

- (void)showFromBarButtonItem:(UIBarButtonItem *)item animated:(BOOL)animated {
    [self __showFromBarButtonItem:item animated:animated];
    [self _setTheme];
}

- (void)showFromRect:(CGRect)rect inView:(UIView *)view animated:(BOOL)animated {
    [self __showFromRect:rect inView:view animated:animated];
    [self _setTheme];
}

- (void)showFromTabBar:(UITabBar *)view {
    [self __showFromTabBar:view];
    [self _setTheme];
}

- (void)showFromToolbar:(UIToolbar *)view {
    [self __showFromToolbar:view];
    [self _setTheme];
}

- (void)showInView:(UIView *)view {
    [self __showInView:view];
    [self _setTheme];
}

@end
