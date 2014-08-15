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

- (IBAction)logoutUser:(id)sender {
    NSLog(@"%@", self.navigationController.viewControllers);
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    posts = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return posts.count;
}


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

    cell.timeLabel.text = resultString;
    
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
    selectedPost = [posts objectAtIndex:indexPath.row];
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

@end
