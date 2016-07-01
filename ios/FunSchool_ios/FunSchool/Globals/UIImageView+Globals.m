//
//  UIImageView+Globals.m
//

#import "UIImageView+Globals.h"

@implementation UIImageView(Globals)
- (void)Globals_ScaleFactor
{
    [self setContentScaleFactor:[[UIScreen mainScreen] scale]];
    self.contentMode =  UIViewContentModeScaleAspectFill;
    self.clipsToBounds  = YES;
}
@end
