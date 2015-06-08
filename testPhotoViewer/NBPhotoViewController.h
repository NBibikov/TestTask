//
//  ViewController.h
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NBCollectionViewCell.h"

@interface NBPhotoViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout, NBCollectionViewCellDelegate>

typedef NS_ENUM(NSInteger, numberOfColumns) {
    oneRow,
    twoRow,
    threeRow
};

- (IBAction)barButtonItem1:(UIBarButtonItem *)sender;
- (IBAction)barButtonItem2:(UIBarButtonItem *)sender;
- (IBAction)barButtonItem3:(UIBarButtonItem *)sender;

@end

