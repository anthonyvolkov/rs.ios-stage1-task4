//
//  TreeNode.m
//  RSSchool_T4
//
//  Created by anthony volkov on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

-(instancetype)init:(NSInteger)value {
    self = [super init];
    if (self) {
        self.value = value;
    }
    return self;
}

@end
