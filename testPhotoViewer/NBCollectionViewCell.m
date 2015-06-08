//
//  NBCollectionViewCell.m
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/8/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//

#import "NBCollectionViewCell.h"

@implementation NBCollectionViewCell



- (void)likeAction:(UIMenuItem*)sender {
    if([self.delegate respondsToSelector:@selector(likeAction:forCell:)]) {
        [self.delegate likeAction:sender forCell:self];
        
    }
}

- (void)shareAction:(UIMenuItem*)sender {
    if([self.delegate respondsToSelector:@selector(shareAction:forCell:)]) {
        [self.delegate shareAction:sender forCell:self];
        
    }
}

- (void)editAction:(UIMenuItem*)sender {
    if([self.delegate respondsToSelector:@selector(editAction:forCell:)]) {
        [self.delegate editAction:sender forCell:self];
        
    }
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (action == @selector(likeAction:) ||
        action == @selector(shareAction:) ||
        action == @selector(editAction:)) {
        return YES;
        
    }
    return NO;
    
}


@end
