//
//  NBPhotoLibrary.h
//  testPhotoViewer
//
//  Created by Nick Bibikov on 6/5/15.
//  Copyright (c) 2015 Nick Bibikov. All rights reserved.
//


// Model for photo library. Heare you get photo from local storage, core data or server and return it


#import <Foundation/Foundation.h>

@interface NBPhotoLibrary : NSObject

- (NSArray*)loadPhotoLibrary;

@end
