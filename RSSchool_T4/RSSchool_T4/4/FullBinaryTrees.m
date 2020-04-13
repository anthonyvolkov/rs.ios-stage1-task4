#import "FullBinaryTrees.h"
#import "TreeNode.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    
    if (count % 2 == 0 || count < 0) {
        return @"[]";
    }
    
    if (count == 1) {
        return @"[[0]]";
    }
    
    NSMutableString *result = [NSMutableString stringWithFormat:@"[]"];
    
    for (TreeNode *tree in [self possibleFBT:count]) {
        NSString *newTreeString = [self treeToString:tree countOfNodes:count];
        [result insertString:newTreeString atIndex:result.length - 1];
        [result insertString:@" " atIndex:result.length - 1];
    }
    
    [result deleteCharactersInRange:NSMakeRange(result.length - 2, 1)];
    
    return result;
}

- (NSArray *)possibleFBT:(NSInteger)count {
    
    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];
    
    if (count == 1) {
        TreeNode *node = [[[TreeNode alloc] init:0] autorelease];
        [result addObject:node];
        return result;
    }
    
    for (int q = 1; q < count; q += 2) {
        for (TreeNode *left in [self possibleFBT:q]) {
            for (TreeNode *right in [self possibleFBT:count - q - 1]) {
                TreeNode *node = [[[TreeNode alloc] init:0] autorelease];
                node.left = left;
                node.right = right;
                [result addObject:node];
            }
        }
    }
    
    return result;
}

- (NSString *)treeToString:(TreeNode *)tree countOfNodes:(NSInteger) count {
    NSMutableString *result = [NSMutableString stringWithString:@"[0,"];
    
    NSMutableArray *arrayOfNodes = [[NSMutableArray alloc] init];
    
    [arrayOfNodes addObject:tree];
    
    int uncheckedNodes = (int)count - 1;
    
    for (int q = 0; q < count; q++) {
        TreeNode *node = [arrayOfNodes firstObject];
        
        [arrayOfNodes removeObjectAtIndex:0];
        
        if (node.left && node.right) {
            [result insertString:@"0,0," atIndex:result.length];
            [arrayOfNodes addObject:node.left];
            [arrayOfNodes addObject:node.right];
            
            uncheckedNodes -= 2;
        } else {
            if (uncheckedNodes != 0) {
                [result insertString:@"null,null," atIndex:result.length];
            }
        }
    }
    
    [result replaceCharactersInRange:NSMakeRange(result.length - 1, 1) withString:@"]"];
    
    [arrayOfNodes release];
    return result;
}

@end
