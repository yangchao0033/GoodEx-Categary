#import "NSString+Regex.h"

@implementation NSString (Regex)
+ (NSString *)UTF8StringWithHZGB2312Data:(NSData *)data
{
    NSStringEncoding encoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    return [[NSString alloc] initWithData:data encoding:encoding];
}

- (NSString *)firstMatchWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:pattern
                                  options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators
                                  error:&error];
    
    if (error) {
        NSLog(@"匹配方案错误:%@", error.localizedDescription);
        return nil;
    }
    
    NSTextCheckingResult *result = [regex firstMatchInString:self options:0 range:NSMakeRange(0, self.length)];
    
    if (result) {
        NSRange r = [result rangeAtIndex:1];
        return [self substringWithRange:r];
    } else {
        NSLog(@"没有找到匹配内容 %@", pattern);
        return nil;
    }
}

- (NSArray *)matchesWithPattern:(NSString *)pattern
{
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:pattern
                                  options:NSRegularExpressionCaseInsensitive | NSRegularExpressionDotMatchesLineSeparators
                                  error:&error];
    
    if (error) {
        NSLog(@"匹配方案错误:%@", error.localizedDescription);
        return nil;
    }
    
    return [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
}

- (NSArray *)matchesWithPattern:(NSString *)pattern keys:(NSArray *)keys
{
    NSArray *array = [self matchesWithPattern:pattern];
    
    if (array.count == 0) return nil;
    
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSTextCheckingResult *result in array) {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        
        for (int i = 0; i < keys.count; i++) {
            NSRange r = [result rangeAtIndex:(i + 1)];
            
            [dictM setObject:[self substringWithRange:r] forKey:keys[i]];
        }
        [arrayM addObject:dictM];
    }
    return [arrayM copy];
}

@end
