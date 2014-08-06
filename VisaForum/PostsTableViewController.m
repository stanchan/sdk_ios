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
    
    Posts *selectedPost;
}
@end

@implementation PostsTableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddPostViewController *source = [segue sourceViewController];
    Posts *item = source.post;
    if (item != nil) {
        [posts addObject:item];
        [self.tableView reloadData];
    }
}

//- (id)initWithStyle:(UITableViewStyle)style
//{
//    self = [super initWithStyle:style];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    posts = [[NSMutableArray alloc] init]; //allocate memory and initialize array
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return posts.count;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomTableCell" forIndexPath:indexPath];
//    
//    //might not be necessary
//    if (cell == nil)
//    {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    
//    //Gets current post for index path
//    Posts *p = [posts objectAtIndex:indexPath.row];
//    
//    //Populates regular table cell
//    //cell.textLabel.text = p.title;
//    //cell.detailTextLabel.text = p.details;
//    //cell.imageView.image = [UIImage imageNamed:@"hk.jpg"];
//    
//    //Populates custom table cell
//    cell.nameLabel.text = p.title;
//    cell.descriptionLabel.text = p.details;
//    cell.thumbnailImageView.image = [UIImage imageNamed:@"hk.jpg"];
//    
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"CustomTableCell";
    
    CustomTableViewCell *cell = (CustomTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //Gets current post for index path
    Posts *p = [posts objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = p.title;
    cell.descriptionLabel.text = p.details;
    
    //Image editing/rounding
    cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.height /2;
    cell.thumbnailImageView.layer.masksToBounds = YES;
    cell.thumbnailImageView.layer.borderWidth = 0;
    cell.thumbnailImageView.image = [UIImage imageNamed:@"hk.jpg"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    
    NSString *resultString = [formatter stringFromDate:[NSDate date]];
    //[formatter release];
    cell.timeLabel.text = resultString; //[p.timestamp description];
    
    return cell;
}

//change height of table
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //sets the selected post and segues to detail view controller
    NSLog(@"%@", indexPath);
    selectedPost = [posts objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"toForum" sender:self];
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    Posts *tappedItem = [posts objectAtIndex:indexPath.row];
//    tappedItem.completed = !tappedItem.completed;
//    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"toForum"]) {
        //sets correct post for the detail post to load
        ForumViewController *forumVC = [segue destinationViewController];
        forumVC.post = selectedPost;
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
}
//- (IBAction)unwindToList:(id)sender {
//}

//Delegate method for the add post, This allows for me to easily return the data created on the add post page without having to pass a reference to my posts array
//This helps a lot when you want to encapsulate or change the way data moves around. If i were to delete the posts array, I dont have to change it in 400 places
//This function takes the post and adds it to the posts array. It then reloads the tableview so the post is reflected in the view
-(void)addPostDidReturnWithPost:(Posts *)post {
    if(post == NULL)
        return;
    
    [posts addObject:post];
    NSLog(@"%@", post); //just prints (not really necessary besides debugging)
    [self.tableView reloadData];
}

//- (IBAction)logout:(id)sender {
////    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Login"
////                                                    message:@"Username or password is too short."
////                                                   delegate:nil
////                                          cancelButtonTitle:@"OK"
////                                          otherButtonTitles:nil];
////    [alert show];
//    [self.navigationController popToViewController:self animated:YES];
//    //[self dismissViewControllerAnimated:YES completion:nil];
//}
@end
