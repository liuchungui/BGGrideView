##How To Use?

```
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
    
```