//
//  NBCollectionViewController.m
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/8/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import "NBCollectionViewController.h"
#import "NBPhotoLibrary.h"

@interface NBCollectionViewController ()

@property (strong, nonatomic) NSArray* photoLibrary;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) numberOfColumns numberOfColumns;
@end

@implementation NBCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Load data for UICollectionView
    NBPhotoLibrary* library = [[NBPhotoLibrary alloc] init];
    self.photoLibrary = [library loadPhotoLibrary];
    
    //set first view with one row
    self.size = CGSizeMake(CGRectGetWidth(self.view.bounds) - 40, CGRectGetWidth(self.view.bounds) - 40);
    
    UIMenuItem *menuItem = [[UIMenuItem alloc] initWithTitle:@"Edit"
                                                      action:@selector(customAction:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:menuItem]];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-44, self.view.bounds.size.width, 44)];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:toolbar];
    
    // instantiate spacer, middleItem
    UIBarButtonItem* firstButton = [[UIBarButtonItem alloc] initWithTitle:@"One" style:UIBarButtonItemStylePlain target:self action:@selector(oneRow:)];

    toolbar.items = @[firstButton];
    
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photoLibrary count];
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    self.collectionView = collectionView;
    static NSString * const reuseIdentifier = @"photoCell";
    
    NBCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[self.photoLibrary objectAtIndex:indexPath.row]];
    
    
    return cell;
    
}


#pragma mark <UICollectionViewDelegate>


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

- (void)customAction:(id)sender forCell:(NBCollectionViewCell*)cell {
    NSLog(@"custom action! %@", sender);
    
}




#pragma mark - UIMenuController
- (BOOL)canBecomeFirstResponder {
    return YES;
    
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    NSLog(@"canPerformAction");
    if (action == @selector(customAction:)) {
        return YES;
        
    }
    return NO;
    
}



#pragma mark - Actions

- (void)oneRow:(UIBarButtonItem*)sender {
    self.numberOfColumns = oneRow;
    [self changeRowWithAnination];
    
}



- (void)customAction:(UIMenuItem*)sender {
    NSLog(@"custom action! %@", sender);
    
}


#pragma mark - Methods


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
            self.size = CGSizeMake(CGRectGetWidth(self.view.bounds)/3 - 20,
                                   CGRectGetWidth(self.view.bounds)/3 - 20);
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
