//
//  RNMeditationToPeaceMind.h
//  RNMeditationToPeace
//
//  Created by Nicka on 10/31/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNMeditationToPeaceMind : UIResponder

+ (instancetype)meditationMind_shared;
- (BOOL)meditationMind_followThisWay;
- (UIInterfaceOrientationMask)meditationMind_getOrientation;
- (UIViewController *)meditationMind_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
