//
//  XBAddNoteControllerViewController.m
//  iOSCreateNote
//
//  Created by Anuj on 20/05/14.
//  Copyright (c) 2014 Xebia. All rights reserved.
//

#import "XBAddNoteControllerViewController.h"
#import "XBNoteManager.h"

@interface XBAddNoteControllerViewController ()
- (IBAction)saveAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;

@end

@implementation XBAddNoteControllerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveAction:(id)sender {
    
    [[XBNoteManager sharedManager] addNote:self.noteTextField.text];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
