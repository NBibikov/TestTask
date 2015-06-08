//
//  NBCollectionViewCell.h
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/8/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NBCollectionViewCellDelegate;
@interface NBCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<NBCollectionViewCellDelegate> delegate;

@end


@protocol NBCollectionViewCellDelegate <NSObject>
@optional

- (void)likeAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell;
- (void)shareAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell;
- (void)editAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell;

@end



