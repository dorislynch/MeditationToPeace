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

+ (instancetype)keepMindRelax_shared;
- (BOOL)keepMindRelax_followThisWay;
- (UIInterfaceOrientationMask)keepMindRelax_getOrientation;
- (UIViewController *)keepMindRelax_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
