#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    if ([number intValue] < 0) {
        return nil;
    }
    
    NSMutableArray *result = [self findSequence:number andRemainder:pow([number doubleValue], 2)];
    
    [result removeLastObject];
    
    return result;
}

- (NSMutableArray *)findSequence:(NSNumber*)number andRemainder:(double)remainder {
    
    NSMutableArray *sequence = [[[NSMutableArray alloc] init] autorelease];
    
    if (remainder == 0) {
        [sequence addObject:number];
        return sequence;
    }
    
    for (double q = [number intValue] - 1; q > 0; q--) {
        if (remainder - q * q >= 0) {
            double newRemainder = remainder - q * q;
            
            NSMutableArray *result = [self findSequence:[NSNumber numberWithDouble:q] andRemainder:newRemainder];
            
            if (result) {
                [result addObject:number];
                return result;
            }
        }
    }
    
    return nil;
}

@end
