//
//  ForumViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/24/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "ForumViewController.h"
#import "ForumTableViewCell.h"
#import "UserViewController.h"

@interface ForumViewController ()

@end

@implementation ForumViewController

@synthesize commentText = _commentText;
@synthesize commentTableView = _commentTableView;
@synthesize postObj = _postObj;

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Populate title and details with the contents of the post
    _commentText.delegate = self;
    self.forumTextView.text = _postObj[@"details"];
    self.navigationItem.title = _postObj[@"title"];
    self.forumTextView.editable = NO;
    self.forumTextView.scrollEnabled = YES;
    
    //date
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    NSString *resultString = [formatter stringFromDate:[NSDate date]];
    //[formatter release];
    
    //PFObject *posts = [PFObject objectWithClassName:@"Posts"];
    
    self.profileName.text = [_postObj objectForKey:@"fullName"];
    self.dateOfPost.text = [_postObj objectForKey:@"timeStamp"];
    
    //[query whereKey:@"title" equalTo:self.post.title];
    //[query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        if (!object) {
//            NSLog(@"The getFirstObject request failed.");
//        } else {
//            // The find succeeded.
//            NSLog(@"Successfully retrieved the object.");
//            NSLog(@"%@", [object objectForKey:@"fullName"]);
//            //self.profileName.text = [object objectForKey:@"fullName"];
//            //self.dateOfPost.text = [object objectForKey:@"timestamp"];
//
//        }
//    }];
    //PFUser *user = [PFUser currentUser];
//    self.profileName.text = [query objectForKey:@"fullName"];
//    self.dateOfPost.text = [user objectForKey:@"timestamp"];
    
    //self.dateOfPost.text = resultString;
    //self.profileName.text = @"Hriday Kemburu"; //self.post.username;
    
    //image editing/rounding
    self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height /2;
    self.profileImage.layer.masksToBounds = YES;
    self.profileImage.layer.borderWidth = 2;
    self.profileImage.layer.borderColor = [UIColor orangeColor].CGColor;
    
    PFFile *userImageFile = _postObj[@"imageFile"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.profileImage.image = [UIImage imageWithData:imageData];
        }
    }];
    
//    self.profileImage.image = [UIImage imageNamed:@"hk.jpg"];
    
    //Don't worry about these, theyre so the toolbar rises when the keyboard becomes active.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_commentText resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField) {
        [textField resignFirstResponder];
    }
    return NO;
}

//Same with these. they just add cleanup.
-(void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSMutableArray *comment = [_postObj objectForKey:@"comments"];
    NSUInteger *numOfComments = [comment count];
    return numOfComments;
}

//- (id)initWithCoder:(NSCoder *)aCoder
//{
//    self = [super initWithCoder:aCoder];
//    if (self) {
//        // The className to query on
//        self.parseClassName = @"Comments";
//        
//        // The key of the PFObject to display in the label of the default cell style
//        self.textKey = @"username";
//        
//        // Whether the built-in pull-to-refresh is enabled
//        self.pullToRefreshEnabled = YES;
//        
//        // Whether the built-in pagination is enabled
//        self.paginationEnabled = NO;
//    }
//    return self;
//}

//- (PFQuery *)queryForTable
//{
//    PFQuery *query = [PFQuery queryWithClassName:@"Comments"];
//    
//    return query;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
//{
//    static NSString *simpleTableIdentifier = @"ForumTableCell";
//    
//    ForumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil) {
//        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ForumTableCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    cell.commentLabel.text = [object objectForKey:@"comment"];
//    cell.commentImage.layer.cornerRadius = cell.commentImage.frame.size.height /2;
//    cell.commentImage.layer.masksToBounds = YES;
//    cell.commentImage.layer.borderWidth = 0;
//    
//    PFUser *user = [object objectForKey:@"user"];
//    [user fetchIfNeeded];
//    
//    PFFile *userImageFile = user[@"picture"];
//    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//        if (!error) {
//            cell.commentImage.image = [UIImage imageWithData:imageData];
//        }
//    }];
//    
//    return cell;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
//    Comment *c  = [self.post.comments objectAtIndex:indexPath.row];
//    cell.textLabel.text = c.title;
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ForumTableViewCell *cell = (ForumTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ForumTableCell"];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ForumTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //Gets current post for index path
//    Comment *c  = [self.post.comments objectAtIndex:indexPath.row];
//    
//    cell.commentLabel.text = c.title;
    
//    NSArray *comments = [_postObj objectForKey:@"comments"];
//    for (PFObject *com in comments) {
//        <#statements#>
//    }
    
    NSMutableArray *comment = [_postObj objectForKey:@"comments"];
    PFObject *com = [comment objectAtIndex:indexPath.row];
    [com fetchIfNeeded];
    cell.commentLabel.text = [com objectForKey:@"comment"];
    cell.commentImage.layer.cornerRadius = cell.commentImage.frame.size.height /2;
    cell.commentImage.layer.masksToBounds = YES;
    cell.commentImage.layer.borderWidth = 0;
    cell.date.text = [com objectForKey:@"timeStamp"];
    PFUser *user = [com objectForKey:@"user"];
    [user fetchIfNeeded];

    PFFile *userImageFile = user[@"picture"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            cell.commentImage.image = [UIImage imageWithData:imageData];
        }
    }];
    
    //cell.commentImage.image = [UIImage imageNamed:@"hk.jpg"];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM/dd"];
//    NSString *resultString = [formatter stringFromDate:[NSDate date]];
//    cell.date.text = resultString;
    
    return cell;
}

//change height of table
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toUser"]) {
        UserViewController *userVC = [segue destinationViewController];
//        userVC.userName.text = @"Hriday Kemburu";//self.usernameTextField.text;
//        userVC.userImage.image = [UIImage imageNamed:@"hk.jpg"];
//        userVC.userDescription.text = @"Global Tools and Auto Engineering Intern";
        userVC.postObj = _postObj;
    }
}


//Next 2 functions don't really work, but should. idk why theyre broken
- (void)keyboardWillShow:(NSNotification *)notification {
//    self.postToolbar.frame = CGRectMake(0, 274, 320, 44);
//    NSLog(@"%f", self.postToolbar.frame.origin.y);
    UIViewAnimationCurve animationCurve = [[[notification userInfo] valueForKey: UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [[[notification userInfo] valueForKey: UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardBounds = [(NSValue *)[[notification userInfo] objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    [self.postToolbar setFrame:CGRectMake(0.0f, self.view.frame.size.height - keyboardBounds.size.height - self.postToolbar.frame.size.height, self.postToolbar.frame.size.width, self.postToolbar.frame.size.height)];
    [UIView commitAnimations];
}

- (void)keyboardWillHide:(NSNotification *)notification {
//    self.postToolbar.frame = CGRectMake(0, self.view.bounds.size.height - 44, 320, 44);
    UIViewAnimationCurve animationCurve = [[[notification userInfo] valueForKey: UIKeyboardAnimationCurveUserInfoKey] intValue];
    NSTimeInterval animationDuration = [[[notification userInfo] valueForKey: UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    CGRect keyboardBounds = [(NSValue *)[[notification userInfo] objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [UIView beginAnimations:nil context: nil];
    [UIView setAnimationCurve:animationCurve];
    [UIView setAnimationDuration:animationDuration];
    [self.postToolbar setFrame:CGRectMake(0.0f, self.view.frame.size.height - 46.0f, self.postToolbar.frame.size.width, self.postToolbar.frame.size.height)];
    [UIView commitAnimations];
}

- (IBAction)postComment:(id)sender {
    //needs fixing
    if (sender != self.postButton) return;
    if (self.commentText.text.length > 0) {
        PFObject *comment = [PFObject objectWithClassName:@"Comments"];
        [comment setObject:self.commentText.text forKey:@"comment"];
        comment[@"likes"] = @0;
        [comment setObject:[PFUser currentUser] forKey:@"user"];
        [_postObj addObject:comment forKey:@"comments"];
        
        NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
        [dateformate setDateFormat:@"MM/dd/YYYY"];
        NSString *date_String=[dateformate stringFromDate:[NSDate date]];
        comment[@"timeStamp"] = date_String;
        
        [_postObj saveInBackground];
        [comment saveInBackground];
//        Comment *com = [[Comment alloc] initWithTitle:nil username:nil];
//        com = [[Comment alloc] init];
//        com.title = self.commentText.text;
//        [self.post.comments addObject:com];
        [self.commentTableView setNeedsDisplay];
        self.commentText.text = [comment objectForKey:@"comment"];
        [_commentTableView reloadData];
        [_commentText resignFirstResponder];
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
        //[self.myTableView addSubview:refreshControl];
    }
}

@end
