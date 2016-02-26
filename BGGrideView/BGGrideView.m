//
//  BGGrideView.m
//  BGCustomLayoutCollectionViewDemo
//
//  Created by user on 16/2/26.
//  Copyright © 2016年 BG. All rights reserved.
//

#import "BGGrideView.h"
#import "BGGrideLayout.h"
#import "Masonry.h"

@interface BGGrideView ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, weak) BGGrideLayout *grideLayout;
@end

@implementation BGGrideView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setupGrideView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if(self = [super initWithCoder:aDecoder]) {
        [self setupGrideView];
    }
    return self;
}

- (void)setupGrideView {
    self.numberOfSections = 1;
    self.numberOfItemsEachSection = 0;
    self.itemSize = CGSizeMake(44, 44);
    self.interitemSpacing = 1.0;
    self.lineSpacing = 1.0;
    self.contentInset = UIEdgeInsetsZero;
    
    //collectionView
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - set method
- (void)setContentInset:(UIEdgeInsets)contentInset {
    _contentInset = contentInset;
    self.grideLayout.contentInset = contentInset;
}

- (void)setLineSpacing:(CGFloat)lineSpacing {
    _lineSpacing = lineSpacing;
    self.grideLayout.lineSpacing = lineSpacing;
}

- (void)setInteritemSpacing:(CGFloat)interitemSpacing {
    _interitemSpacing = interitemSpacing;
    self.grideLayout.interitemSpacing = interitemSpacing;
}

- (void)setItemSize:(CGSize)itemSize {
    _itemSize = itemSize;
    self.grideLayout.itemSize = itemSize;
}

#pragma mark - UICollectionView
- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        BGGrideLayout *layout = [[BGGrideLayout alloc] init];
        layout.itemSize = self.itemSize;
        layout.interitemSpacing = self.interitemSpacing;
        layout.lineSpacing = self.lineSpacing;
        layout.contentInset = self.contentInset;
        self.grideLayout = layout;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.pagingEnabled = NO;
        collectionView.directionalLockEnabled = YES;
        
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (void)reloadData {
    [self.collectionView reloadData];
}

- (void)registerClass:(Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:identifier];
}

- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier {
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
}

- (__kindof UICollectionViewCell *)dequeueReusableCellWithReuseIdentifier:(NSString *)identifier forIndexPath:(NSIndexPath *)indexPath {
    return [self.collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
}

- (void)setDelegate:(id<BGGrideViewDelegate>)delegate {
    _delegate = delegate;
    if(delegate == nil) {
        self.collectionView.dataSource = nil;
        self.collectionView.delegate = nil;
    }
    else {
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.numberOfSections;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.numberOfItemsEachSection;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [self.delegate grideView:self cellForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if([self.delegate respondsToSelector:@selector(grideView:didSelectItemAtIndexPath:)]) {
        [self.delegate grideView:self didSelectItemAtIndexPath:indexPath];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
