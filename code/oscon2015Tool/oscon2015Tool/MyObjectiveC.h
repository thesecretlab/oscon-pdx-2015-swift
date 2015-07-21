//
//  MyObjectiveC.h
//  oscon2015Tool
//
//  Created by Jon Manning on 20/07/2015.
//  Copyright (c) 2015 Secret Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyUsefulClass : NSObject

@property int myProperty;

- (id) initWithString:(NSString*)string;

- (int) doSomething:(int)number1 withOtherThing:(int)number2 ;

@end
