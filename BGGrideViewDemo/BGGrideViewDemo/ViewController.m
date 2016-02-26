//
//  ViewController.m
//  BGGridView
//
//  Created by user on 15/9/15.
//  Copyright (c) 2015年 lcg. All rights reserved.
//

#import "ViewController.h"
#import "BGImageCollectionViewCell.h"
#import "BGGrideLayout.h"
#import "BGGrideView.h"

static const NSInteger kRowCount = 4;
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, BGGrideViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat spacing = 10;
    CGFloat mainScrreenWidth = [UIScreen mainScreen].bounds.size.width;
    
    BGGrideView *grideView = [[BGGrideView alloc] initWithFrame:self.view.bounds];
    grideView.itemSize = CGSizeMake((mainScrreenWidth-(kRowCount+1)*spacing)/kRowCount, 150);
    grideView.interitemSpacing = spacing;
    grideView.lineSpacing = spacing;
    grideView.numberOfSections = 6;
    grideView.numberOfItemsEachSection = 4;
    grideView.delegate = self;
    
    [grideView registerNib:[UINib nibWithNibName:[BGImageCollectionViewCell cellIdentifier] bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier]];
    
    [self.view addSubview:grideView];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 6;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BGImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger imageIndex = indexPath.section*3+indexPath.row;
    imageIndex = imageIndex % 24;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg", imageIndex]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - BGGrideViewDelegate
- (UICollectionViewCell *)grideView:(BGGrideView *)grideView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BGImageCollectionViewCell *cell = [grideView dequeueReusableCellWithReuseIdentifier:[BGImageCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    // Configure the cell
    NSInteger imageIndex = indexPath.section*3+indexPath.row;
    imageIndex = imageIndex % 24;
    cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zd.jpg", imageIndex]];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
