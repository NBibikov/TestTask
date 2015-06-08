//
//  ViewController.m
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import "NBPhotoViewController.h"
#import "NBPhotoLibrary.h"

#define borderInsets 15

@interface NBPhotoViewController ()

@property (strong, nonatomic) NSArray* photoLibrary;
@property (weak, nonatomic) UICollectionView* collectionView;
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
    self.size = CGSizeMake(CGRectGetWidth(self.view.bounds) - borderInsets,
                           CGRectGetWidth(self.view.bounds) - borderInsets);
    
    [self loadMenu];
    
}


- (void) loadMenu {
    UIMenuItem* like = [[UIMenuItem alloc] initWithTitle:@"Like"
                                                  action:@selector(likeAction:)];
    UIMenuItem* share = [[UIMenuItem alloc] initWithTitle:@"Share"
                                                   action:@selector(shareAction:)];
    UIMenuItem* edit = [[UIMenuItem alloc] initWithTitle:@"Edit"
                                                  action:@selector(editAction:)];
    
    switch (self.numberOfColumns) {
        case oneRow:
            [[UIMenuController sharedMenuController] setMenuItems:@[like, share]];
        
            break;
            
        case twoRow:
            [[UIMenuController sharedMenuController] setMenuItems:@[share, edit]];
            
            break;
            
        case threeRow:
            [[UIMenuController sharedMenuController] setMenuItems:@[like, share, edit]];
            
            break;
            
        default:
            break;
    }
    
    
    
    
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photoLibrary count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.collectionView = collectionView;
    static NSString * const reuseIdentifier = @"collectionCell";
    
    NBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[self.photoLibrary objectAtIndex:indexPath.row]];

    
    return cell;
    
}


#pragma mark - UICollectionViewDelegate


- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    return YES;
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
    
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    NSLog(@"performAction");
    
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [self changeRowWithAnination];
    
}



#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.size;
    
}



#pragma mark - NBCollectionViewCellDelegate

- (void)likeAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell {
    NSLog(@"likeAction");
    
}


- (void)shareAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell {
    NSLog(@"shareAction");
    
}


- (void)editAction:(UIMenuItem*)sender forCell:(NBCollectionViewCell*)cell {
    NSLog(@"editAction");
    
}




#pragma mark - UIMenuController
- (BOOL)canBecomeFirstResponder {
    return YES;
    
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    NSLog(@"canPerformAction");
    if (action == @selector(likeAction:) ||
        action == @selector(shareAction:) ||
        action == @selector(editAction:)) {
        return YES;
    
    }
    return NO;
    
}



#pragma mark - Actions

- (IBAction)barButtonItem1:(UIBarButtonItem *)sender {
    self.numberOfColumns = oneRow;
    [self changeRowWithAnination];
    [self loadMenu];
    
}


- (IBAction)barButtonItem2:(UIBarButtonItem *)sender {
    self.numberOfColumns = twoRow;
    [self changeRowWithAnination];
    [self loadMenu];
    
}


- (IBAction)barButtonItem3:(UIBarButtonItem *)sender {
    self.numberOfColumns = threeRow;
    [self changeRowWithAnination];
    [self loadMenu];
    
}


- (void)likeAction:(UIMenuItem*)sender {
    NSLog(@"like action! %@", sender);

}

- (void)shareAction:(UIMenuItem*)sender {
    NSLog(@"share action! %@", sender);
    
}

- (void)editAction:(UIMenuItem*)sender {
    NSLog(@"edit action! %@", sender);
    
}


#pragma mark - Methods


- (void)changeRowWithAnination {
    switch (self.numberOfColumns) {
        case oneRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds) - borderInsets,
                                   CGRectGetWidth(self.view.bounds) - borderInsets);
            break;

        case twoRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds)/2 - borderInsets,
                                   CGRectGetWidth(self.view.bounds)/2 - borderInsets);
            break;
        
        case threeRow:
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds)/3 - borderInsets,
                                   CGRectGetWidth(self.view.bounds)/3 - borderInsets);
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
