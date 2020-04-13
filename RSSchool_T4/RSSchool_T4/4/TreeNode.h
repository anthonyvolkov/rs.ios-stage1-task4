//
//  TreeNode.h
//  RSSchool_T4
//
//  Created by anthony volkov on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

@property (assign) NSInteger value;
@property (weak, nullable) TreeNode *left;
@property (weak, nullable) TreeNode *right;

-(instancetype)init:(NSInteger) value;

@end

NS_ASSUME_NONNULL_END
