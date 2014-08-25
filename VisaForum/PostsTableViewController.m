//
//  PostsTableViewController.m
//  VisaForum
//
//  Created by Hriday Kemburu on 7/22/14.
//  Copyright (c) 2014 hridaykemburu. All rights reserved.
//

#import "PostsTableViewController.h"
#import "ForumViewController.h"
#import "AddPostViewController.h"
#import "Posts.h"
#import "CustomTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface PostsTableViewController () {
    NSString *titleForPost;
    NSString *detailForPost;
    NSMutableArray *posts;
    //NSNumber *counter;
    Posts *selectedPost;
    PFObject *postObject;
    BOOL *hasLiked;
}
@end

@implementation PostsTableViewController

@synthesize userImage = _userImage;
@synthesize postDetailLabel = _postDetailLabel;
@synthesize likeButtonOutlet = _likeButtonOutlet;
@synthesize postTitleLabel = _postTitleLabel;
@synthesize numberOfLikes = _numberOfLikes;
@synthesize postTableViewCell = _postTableViewCell;

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddPostViewController *source = [segue sourceViewController];
    Posts *item = source.post;
    if (item != nil) {
        [posts addObject:item];
        [self.tableView reloadData];
    }
}

- (IBAction)logoutUser:(id)sender {
    //NSLog(@"%@", self.navigationController.viewControllers);
    [PFUser logOut];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    posts = [[NSMutableArray alloc] init];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return posts.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *simpleTableIdentifier = @"CustomTableCell";
//    
//    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    //Gets current post for index path
//    Posts *p = [posts objectAtIndex:indexPath.row];
//    
//    cell.nameLabel.text = p.title;
//    cell.descriptionLabel.text = p.details;
//    
//    //Image editing/rounding
//    cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height /2;
//    cell.thumbnailImageView.layer.masksToBounds = YES;
//    cell.thumbnailImageView.layer.borderWidth = 0;
//    cell.thumbnailImageView.image = [UIImage imageNamed:@"hk.jpg"];
//    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    
//    NSString *resultString = [formatter stringFromDate:[NSDate date]];
//
//    cell.timeLabel.text = resultString;
//    
//    return cell;
//}

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // The className to query on
        self.parseClassName = @"Posts";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"username";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = NO;
    }
    return self;
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    return query;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    
    //static NSString *simpleTableIdentifier = @"PostsCell";
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil) {
//        cell = [tableView reuseIdentifier:simpleTableIdentifier];
//    }
//    
//    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
//    UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
//    UILabel *detailLabel = (UILabel *)[cell viewWithTag:102];
//    UILabel *numOfLikesLabel = (UILabel *)[cell viewWithTag:103];
//    UIButton *likeButton = (UIButton *)[cell viewWithTag:104];
    
//    static NSString *simpleTableIdentifier = @"CustomTableCell";
//    
//    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    //UILabel *nameLabel = (UILabel*) [cell viewWithTag:101];
//    cell.nameLabel.text = [object objectForKey:@"title"];
//    cell.descriptionLabel.text = [object objectForKey:@"details"];
//    cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height /2;
//    cell.thumbnailImageView.layer.masksToBounds = YES;
//    cell.thumbnailImageView.layer.borderWidth = 0;
//    
////    PFUser *user = [PFUser currentUser];
////    NSString *userName = [user objectForKey:@"username"];
////    NSArray *likers = [postObject objectForKey:@"likers"];
////    if (![likers containsObject:userName]) { //not liked
////        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
////    } else { //liked
////        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
////    }
//
//    PFFile *userImageFile = object[@"imageFile"];
//    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//        if (!error) {
//            cell.thumbnailImageView.image = [UIImage imageWithData:imageData];
//        }
//    }];
    
    //UILabel *prepTimeLabel = (UILabel*) [cell viewWithTag:102];
    //cell.timeLabel.text = [object objectForKey:@"timestamp"];
//    NSDateFormatter *formatter = [object objectForKey:@"timestamp"];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    NSString *resultString = [formatter stringFromDate:[NSDate date]];
//    cell.timeLabel.text = resultString;
    
    static NSString *simpleTableIdentifier = @"CustomTableCell";
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // Configure the cell
    //    PFFile *thumbnail = [object objectForKey:@"picture"];
    //    PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:100];
    //    thumbnailImageView.image = [UIImage imageNamed:@"male18.jpg"];
    //    thumbnailImageView.file = thumbnail; //not sure how this will happen
    //    [thumbnailImageView loadInBackground];
    
    //UILabel *nameLabel = (UILabel*) [cell viewWithTag:101];
    cell.nameLabel.text = [object objectForKey:@"title"];
    cell.descriptionLabel.text = [object objectForKey:@"details"];
    cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height /2;
    cell.thumbnailImageView.layer.masksToBounds = YES;
    cell.thumbnailImageView.layer.borderWidth = 0;
    cell.numberOfLikesLabel.text = [NSString stringWithFormat:@"%@", [object objectForKey:@"likes"]];
    cell.timeLabel.text = [object objectForKey:@"timeStamp"];
    
    NSMutableArray *likers = [postObject objectForKey:@"likers"];
    PFUser *user = [PFUser currentUser];
    for (PFUser *u in likers) {
        [u fetchIfNeeded];
        if ([user objectForKey:@"id"] == [u objectForKey:@"id"]) {
            NSLog(@"user is there");
            [cell.likeButton setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
            break;
        } else {
            NSLog(@"user is NOT there");
            [cell.likeButton setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
        }
    }
    
    PFFile *userImageFile = object[@"imageFile"];
    [userImageFile getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            cell.thumbnailImageView.image = [UIImage imageWithData:imageData];
        }
    }];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
//    formatter = [object objectForKey:@"timestamp"];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
//    NSDate *d = [formatter dateFromString:<#(NSString *)#>]
//    NSString *resultString = [formatter stringFromDate:[NSDate date]];
//    cell.timeLabel.text = resultString;
//    NSLog(@"%@",resultString);
    
//    NSString *datestr = @"2013-08-06T03:51:54+00:00";
//    NSDateFormatter *dformat = [[NSDateFormatter alloc]init];
//    
//    [dformat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssz"];
//    
//    NSDate *date = [dformat dateFromString:datestr];
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    //Optionally for time zone converstions
    //[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
//    NSDate *myNSDateInstance = [postObject objectForKey:@"createdAt"];
//    NSLog(@"Todays date is %@",[formatter stringFromDate:myNSDateInstance]);
//    NSString *stringFromDate = [formatter stringFromDate:myNSDateInstance];
//    cell.timeLabel.text = stringFromDate;
//    NSLog(@"%@", stringFromDate);
    
    return cell;
}

//change height of table
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@", indexPath);
    //selectedPost = [posts objectAtIndex:indexPath.row];
    postObject = [self.objects objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toForum" sender:self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"toForum"]) {
        //sets correct post for the detail post to load
        ForumViewController *forumVC = [segue destinationViewController];
        //forumVC.post = selectedPost;
        forumVC.postObj = postObject;
    }
    else {
        //if creating new post, get a reference to the view controller thats about to be loaded and prepare it
//        AddPostViewController *postVC = [segue destinationViewController];
//        postVC.delegate = self;
//        postVC.username = self.username;
    }
}


- (IBAction)addPost:(id)sender {
    AddPostViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"addPostViewControllerID" ];
    self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:vc, nil];
    [self.navigationController pushViewController:vc animated:YES];
    
    //added
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Add New Post", @"Add New Poll", nil];
//    [actionSheet showInView:self.view];
}

//added
//-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
//    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
//    picker.delegate = self;
//    if (buttonIndex == 0) {
//        AddPostViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"addPostViewControllerID" ];
//        self.navigationController.viewControllers = [[NSArray alloc] initWithObjects:vc, nil];
//        [self.navigationController pushViewController:vc animated:YES];
//    } else if (buttonIndex == 1) {
//        //take picture from camera (doesn't work on simulator)
//        //picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        //[self presentModalViewController:picker animated:YES];
//    }
//}

//Delegate method for the add post, This allows for me to easily return the data created on the add post page without having to pass a reference to my posts array
//This helps a lot when you want to encapsulate or change the way data moves around. If i were to delete the posts array, I dont have to change it in 400 places
//This function takes the post and adds it to the posts array. It then reloads the tableview so the post is reflected in the view
-(void)addPostDidReturnWithPost:(Posts *)post {
    if(post == NULL) return;
    [posts addObject:post];
    [self.tableView reloadData];
}

- (IBAction)like:(id)sender {
//    if (sender != _likeButtonOutlet) return;
//    
//    PFUser *user = [PFUser currentUser];
//    NSString *userName = [user objectForKey:@"username"];
    
//    PFQuery *query = [PFQuery queryWithClassName:@"Posts"];
//    [query whereKey:@"objectID" equalTo:[postObject objectForKey:@"objectID"]];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
//        for (int i = 0; i < objects.count; i++) {
//            PFObject *event = [objects objectAtIndex:i];    // note using 'objects', not 'eventObjects'
//            [event removeObject:userName forKey:@"username"];
//        }
//        [PFObject saveAll:objects];
//    }];
    
    
//    NSArray *likers = [postObject objectForKey:@"likers"]; //make this emails
//    if (![likers containsObject:userName]) { //not liked
//        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
//        [postObject addObject:userName forKey:@"likers"];
//        
//    } else { //liked
//        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
//        [postObject removeObject:userName forKey:@"likers"];
//    }
    
//    NSNumber *counter = [postObject objectForKey:@"likes"];
//    int value = [counter intValue];
//    if (sender != _likeButtonOutlet) return;
//    if (counter == 0) {
//        [_numberOfLikes setText:[NSString stringWithFormat:@"%@", [NSNumber numberWithInt:value + 1]]];
//        //NSInteger *likes = [currentUser objectForKey:@"fullName"];
//        //[_likeButton setTitle:@"Unlike" forState:UIControlStateNormal];
//        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart280.png"] forState:UIControlStateNormal];
//    } else {
//        [_numberOfLikes setText:[NSString stringWithFormat:@"%@",[NSNumber numberWithInt:value - 1]]];
//        //[_likeButton setTitle:@"Like" forState:UIControlStateNormal];
//        [_likeButtonOutlet setImage:[UIImage imageNamed:@"heart34.png"] forState:UIControlStateNormal];
//    }

}
@end
