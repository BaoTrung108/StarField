//
//  ViewController.m
//  starField
//
//  Created by Trung Bao on 11/12/15.
//  Copyright © 2015 Trung Bao. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    CGFloat x,y,a,b;
    UIImageView *brown,*green,*red,*violet;
    AVAudioPlayer *music;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor grayColor];
    x=100;y=100;
    a=self.view.bounds.size.width *0.5;
    b=self.view.bounds.size.height *0.5;
    [self drawstar];
    [self animationStar];
    [self playmusic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) centre {
    brown.center = CGPointMake(a,b);
    green.center = CGPointMake(a,b);
    red.center = CGPointMake(a,b);
    violet.center = CGPointMake(a,b);
}
-(void) drawstar {
    brown =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brown"]];
    green=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    red=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red"]];
    violet=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"violet"]];
    [self.view addSubview:brown];
    [self.view addSubview:green];
    [self.view addSubview:red];
    [self.view addSubview:violet];
    [self centre];
}
-(void) animationStar {
    [UIView animateWithDuration:5 animations:^{
        brown.center=CGPointMake(a-x,b+y);
        green.center=CGPointMake(a+x, b+y);
        red.center=CGPointMake(a+x, b-y);
        violet.center=CGPointMake(a-x, b-y);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5 animations:^{
            brown.center=CGPointMake(a,b+y);
            green.center=CGPointMake(a+x,b);
            red.center=CGPointMake(a, b-y);
            violet.center=CGPointMake(a-x,b);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:5 animations:^{
                [self centre];
            } completion:^(BOOL finished) {
                [self animationStar];
            }];
        }];
    }];
}
-(void) playmusic {
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filepath];
    NSError *error;
    music = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    [music prepareToPlay];
    [music play];
}

@end

