//
//  NBCollectionViewController.h
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/8/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBCollectionViewCell.h"

@interface NBCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, NBCollectionViewCellDelegate>

typedef NS_ENUM(NSInteger, numberOfColumns) {
    oneRow,
    twoRow,
    threeRow
};

@end