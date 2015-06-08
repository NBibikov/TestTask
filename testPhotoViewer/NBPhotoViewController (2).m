//
//  ViewController.m
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import "NBPhotoViewController.h"
#import "NBPhotoLibrary.h"

@interface NBPhotoViewController ()

@property (weak, nonatomic) UICollectionView* collectionView;
@property (strong, nonatomic) NSArray* photoLibrary;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) numberOfColumns numberOfColumns;
@end

@implementation NBPhotoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Load data for UICollectionView
    NBPhotoLibrary* library = [[NBPhotoLibrary alloc] init];
    self.photoLibrary = [library loadPhotoLibrary];
    
    //set first view with one row
    self.size = CGSizeMake(CGRectGetWidth(self.view.bounds) - 40, CGRectGetWidth(self.view.bounds) - 40);
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photoLibrary count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.collectionView = collectionView;
    static NSString * const reuseIdentifier = @"collectionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[self.photoLibrary objectAtIndex:indexPath.row]];
    
    return cell;
    
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.size;
}


#pragma mark <UICollectionViewDelegate>

/*
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;

 }


 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 
 }




 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self.collectionView performBatchUpdates:nil completion:nil];
    
}
*/

#pragma mark - Actions

- (IBAction)barButtonItem1:(UIBarButtonItem *)sender {
    self.numberOfColumns = oneRow;
    [self changeRowWithAnination];
    
}

- (IBAction)barButtonItem2:(UIBarButtonItem *)sender {
    self.numberOfColumns = twoRow;
    [self changeRowWithAnination];
}

- (IBAction)barButtonItem3:(UIBarButtonItem *)sender {
    self.numberOfColumns = threeRow;
    [self changeRowWithAnination];
    
}


#pragma mark - Methods

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self changeRowWithAnination];

}


- (void)changeRowWithAnination {
    switch (self.numberOfColumns) {
        case oneRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds) - 40,
                                   CGRectGetWidth(self.view.bounds) - 40);
            break;

        case twoRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds)/2 - 30,
                                   CGRectGetWidth(self.view.bounds)/2 - 30);
            break;
        
        case threeRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds)/3 - 30,
                                   CGRectGetWidth(self.view.bounds)/3 - 30);
            break;
            
        default:
            break;
    }
    [self.collectionView performBatchUpdates:nil completion:nil];
    
}

#pragma mark - Memory

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
