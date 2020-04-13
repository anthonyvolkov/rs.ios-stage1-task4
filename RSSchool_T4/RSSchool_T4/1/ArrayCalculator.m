#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *cleanArray = [[[NSMutableArray alloc] init] autorelease];
    for (int q = 0; q < array.count; q++) {
        if ([array[q] isKindOfClass:[NSNumber class]]) {
            [cleanArray addObject:array[q]];
        }
    }
    
    if (cleanArray.count == 0) {
        return 0;
    }
    
    if (numberOfItems > cleanArray.count) {
        return [ArrayCalculator multiplyNumbersOfArray:cleanArray];
    }
    
    NSMutableArray *sortedArray = [NSMutableArray arrayWithArray:[cleanArray sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        return [[NSNumber numberWithInt: abs([a intValue])] compare: [NSNumber numberWithInt: abs([b intValue])]];
    }]];
    
    NSMutableArray *calculateNumbers = [[[NSMutableArray alloc] init] autorelease];
    
    for (int q = 0; q < numberOfItems; q++) {
        [calculateNumbers insertObject:sortedArray.lastObject atIndex:0];
        [sortedArray removeLastObject];
    }
    
    if ([ArrayCalculator multiplyNumbersOfArray:calculateNumbers] > 0) {
        return [ArrayCalculator multiplyNumbersOfArray:calculateNumbers];
    }
    
    int maxPositive = 0;
    for (int q = (int)sortedArray.count -1 ; q >= 0; q--) {
        if ([sortedArray[q] intValue] > 0) {
            maxPositive = [sortedArray[q] intValue];
            break;
        }
    }
    for (int q = 0; q < calculateNumbers.count; q++) {
        if ([calculateNumbers[q] intValue] < 0) {
            [calculateNumbers replaceObjectAtIndex:q withObject:[NSNumber numberWithInt: maxPositive]];
            return [ArrayCalculator multiplyNumbersOfArray:calculateNumbers];
        }
    }
    
    int minNumber = 0;
    
    for (int q = 0; q < sortedArray.count; q++) {
        if ([sortedArray[q] intValue] != 0) {
            minNumber = [sortedArray[q] intValue];
            break;
        }
    }
    [calculateNumbers replaceObjectAtIndex:(calculateNumbers.count - 1) withObject:[NSNumber numberWithInt:minNumber]];
    
    return [ArrayCalculator multiplyNumbersOfArray:calculateNumbers];
}

+ (NSInteger) multiplyNumbersOfArray: (NSArray *)array {
    NSInteger mul = 1;
    for (int q = 0; q < array.count; q++) {
        mul *= [array[q] intValue];
    }
    return mul;
}

@end
