//
//  CoolSegmentBar.m
//  CoolSegmentBar
//
//  Created by ian on 2018/4/2.
//  Copyright © 2018年 Rengfou. All rights reserved.
//

#import "CoolSegmentBar.h"

@interface CoolSegmentBar()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic) NSUInteger itemSelectedIndex;
@property (nonatomic, strong) UIView *animateLineView;
@property (nonatomic, strong) UIFont *textFont;
@property (nonatomic, strong) UIFont *selectedFont;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *lineViewColor;
@property (nonatomic, strong) UIColor *animateLineViewColor;

@end

@implementation CoolSegmentBar


#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray *)items itemSelectedIndex:(NSUInteger)itemSelectedIndex font:(UIFont *)font selectedFont:(UIFont *)selectedFont textColor:(UIColor *)textColor selectedTextColor:(UIColor *)selectedTextColor lineViewColor:(UIColor *)lineViewColor animateLineViewColor:(UIColor *)animateLineViewColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        _items = items;
        _itemSelectedIndex = itemSelectedIndex;
        _textFont = font;
        _selectedFont = selectedFont;
        _textColor = textColor;
        _selectedTextColor = selectedTextColor;
        _lineViewColor = lineViewColor;
        _animateLineViewColor = animateLineViewColor;
        [self creatView];
    }
    return self;
}


#pragma mark - private method

- (void)creatView
{
    self.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:scrollView];
    _scrollView = scrollView;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    CGFloat scrollViewSizeWidth = .0f;
    for (NSUInteger i = 0; i < _items.count; i ++) {
        
        NSString *titleStr = _items[i];
        NSDictionary *dic = @{NSFontAttributeName : _textFont};
        CGRect infoRect = [titleStr boundingRectWithSize:CGSizeMake(self.frame.size.width, self.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil];
        CGFloat btnW = infoRect.size.width + 30;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [scrollView addSubview:button];
        button.frame = CGRectMake(scrollViewSizeWidth, 0, btnW, self.bounds.size.height);
        [button setTitle:_items[i] forState:UIControlStateNormal];
        [button setTitleColor:_textColor forState:UIControlStateNormal];
        [button setTitleColor:_selectedTextColor forState:UIControlStateSelected];
        button.titleLabel.font = _textFont;
        button.tag = 6666 + i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        scrollViewSizeWidth += btnW;
    }
    scrollView.contentSize = CGSizeMake(scrollViewSizeWidth, 0);
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = _lineViewColor;
    lineView.frame = CGRectMake(18, self.bounds.size.height - 0.5f, self.bounds.size.width - 18, 0.5f);
    
    _animateLineView = [[UIView alloc] init];
    [scrollView addSubview:_animateLineView];
    _animateLineView.backgroundColor = _animateLineViewColor;
    
    [self refreshSegmentButton:_itemSelectedIndex];
}

- (void)refreshSegmentButton:(NSUInteger)index
{
    for (UIView *subView in _scrollView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton *)subView;
            if (button.tag - 6666 == index) {
                button.selected = YES;
                button.titleLabel.font = self.selectedFont;
                [UIView animateWithDuration:0.3f animations:^{
                    self.animateLineView.frame = CGRectMake(button.frame.origin.x + 15, self.bounds.size.height - 2.5, button.frame.size.width - 30, 2.0f);
                }];
                
            } else {
                button.selected = NO;
                button.titleLabel.font = self.textFont;
            }
        }
    }
}

#pragma mark - action method

- (void)buttonClick:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSUInteger index = btn.tag - 6666;
    
    [self refreshSegmentButton:index];
    
    if (self.segmentButtonClick) {
        self.segmentButtonClick(index);
    }
}

@end
