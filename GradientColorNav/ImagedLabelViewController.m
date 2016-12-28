//
//  ImagedLabelViewController.m
//  GradientColorNav
//
//  Created by steven on 2016/12/26.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ImagedLabelViewController.h"
#import "myLabel.h"

@interface ImagedLabelViewController ()

@property (nonatomic, strong)myLabel *featuredLabel;

@end

@implementation ImagedLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.featuredLabel];
    [self.featuredLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.featuredLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
}

- (UILabel *)featuredLabel {
    if (!_featuredLabel) {
        _featuredLabel = [[myLabel alloc] init];
        _featuredLabel.verticalAlignment = VerticalAlignmentMiddle;
        _featuredLabel.backgroundColor = [UIColor redColor];
#if 0
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        attachment.image = [UIImage imageNamed:@"twitter"];
        
        NSAttributedString *attachmentString = [NSAttributedString attributedStringWithAttachment:attachment];
        NSAttributedString *labelTitle = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@", @"QQ"]];
        
        NSMutableAttributedString *attributedTitle = attachmentString.mutableCopy;
        [attributedTitle appendAttributedString:labelTitle];
        
        _featuredLabel.attributedText = attributedTitle;
#endif
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@"QQ"];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
        attch.image = [UIImage imageNamed:@"twitter"];
        // attch.bounds = CGRectMake(0, 0, 61, 14);
        
        NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
        
        [attri insertAttributedString:string atIndex:0];
        _featuredLabel.attributedText = attri;
    }
    
    return _featuredLabel;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
