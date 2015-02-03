//
//  GRViewController.m
//  GitReference
//
//  Created by Gabriel Guerrero on 2/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "GRViewController.h"

static CGFloat heightForLabel = 30;
static CGFloat margin = 15;
static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface GRViewController ()

@end

@implementation GRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width,
                                                                                    self.view.frame.size.height -20)];
    
    [self.view addSubview:scrollView];
    
    CGFloat topMargin = 25;
    CGFloat widthMinusMargin = self.view.frame.size.width - 2 * margin;
    CGFloat top = topMargin + heightForLabel + margin * 2;
    CGFloat spaceBetweenCommandandReference = 30;
    
    // Main Title
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(margin, topMargin, widthMinusMargin, heightForLabel)];
    title.font = [UIFont boldSystemFontOfSize:40];
    title.text = @"GitReference";
    [scrollView addSubview:title];
    
    
    
    for(NSDictionary *gitCommand in [self gitCommands]) {
        
        NSString *command = gitCommand[Command];
        NSString *reference = gitCommand[Reference];
        
        UILabel *textCommand =  [[UILabel alloc]initWithFrame:CGRectMake(topMargin, top, widthMinusMargin, heightForLabel)];
        textCommand.font = [UIFont boldSystemFontOfSize:20];
        textCommand.text = command;
        
        [scrollView addSubview:textCommand];
        
        CGFloat heightForReference = [self heightOfReferenceString:reference];
        
        UILabel *textReference =  [[UILabel alloc]initWithFrame:CGRectMake(topMargin*2, top + spaceBetweenCommandandReference, widthMinusMargin - margin * 4, heightForReference)];
        textReference.numberOfLines = 0;
        textReference.font = [UIFont boldSystemFontOfSize:17];
        textReference.text = reference;
        
        [scrollView addSubview:textReference];
        
        

        top += (heightForLabel + topMargin + 50);
        
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, top);
}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

- (CGFloat)heightOfReferenceString:(NSString *)reference {
    
    CGRect bounding = [reference boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 4 * margin, 0)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}
                                              context:nil];
    
    return bounding.size.height;
    
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
