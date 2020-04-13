#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    if ([number intValue] < 0) {
        return nil;
    }
    
    NSDictionary *neighborsDigits = @{
        @"1" : @[@"2", @"4"],
        @"2" : @[@"1", @"3", @"5"],
        @"3" : @[@"2", @"6"],
        @"4" : @[@"1", @"5", @"7"],
        @"5" : @[@"2", @"4", @"6", @"8"],
        @"6" : @[@"3", @"5", @"9"],
        @"7" : @[@"4", @"8"],
        @"8" : @[@"0", @"5", @"7", @"9"],
        @"9" : @[@"6", @"8"],
        @"0" : @[@"8"]
    };
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (int q = 0; q < number.length; q++) {
        
        NSRange range = NSMakeRange(q, 1);
        NSString *key = [number substringWithRange:range];
        
        for (int w = 0; w < [[neighborsDigits objectForKey:key] count]; w++) {
            NSString *newNumberOfNeighbor = [number stringByReplacingCharactersInRange:range withString:[[neighborsDigits objectForKey:key] objectAtIndex:w]];
            [result addObject:newNumberOfNeighbor];
        }
    }
    
    return [result autorelease];;
}
@end
