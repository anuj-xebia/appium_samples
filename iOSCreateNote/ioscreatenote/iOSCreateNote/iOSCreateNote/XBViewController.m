//
//  XBViewController.m
//  iOSCreateNote
//
//  Created by Anuj on 20/05/14.
//  Copyright (c) 2014 Xebia. All rights reserved.
//

#import "XBViewController.h"
#import "XBNoteManager.h"
#import "Note.h"

@interface XBViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *items;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addNote;

@end

@implementation XBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.accessibilityLabel = @"list";
    
    //self.automaticallyAdjustsScrollViewInsets = NO;
    self.addNote.accessibilityLabel = @"newNote";
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.items = nil;
    self.items =  [[[XBNoteManager sharedManager] fetchNotes] mutableCopy];
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    Note *note = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = note.noteText;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
//    tableView.separatorColor = [UIColor clearColor];
//    tableView.backgroundColor = [UIColor colorWithRed:216/255.0f green:216/255.0f blue:216/255.0f alpha:1.0f];
    return 1;
}
@end
