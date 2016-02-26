//
//  BGGrideView.h
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 16/2/26.
//  Copyright © 2016年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BGGrideViewDelegate;

@interface BGGrideView : UIView

@property (nonatomic, assign) NSInteger numberOfSections;
@property (nonatomic, assign) NSInteger numberOfItemsEachSection;
@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, assign) CGFloat interitemSpacing;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) UIEdgeInsets contentInset;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;
@property (nonatomic, weak) id<BGGrideViewDelegate> delegate;

//reload grideview
- (void)reloadData;

//register class
- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;

//dequeueReusableCellWithReuseIdentifier
- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath;
@end

@protocol BGGrideViewDelegate <NSObject>

@required
- (UICollectionViewCell *)grideView:(BGGrideView *)grideView cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
//did select
- (void)grideView:(BGGrideView *)grideView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end


