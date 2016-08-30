//
//  infoTableViewController.m
//  JSONparsing
//
//  Created by Student-002 on 22/08/16.
//  Copyright © 2016 Felix-ITS. All rights reserved.
//

#import "infoTableViewController.h"
#import "infoTableViewCell.h"
#import "database.h"

@interface infoTableViewController ()

@end

@implementation infoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    _countarray=[[NSMutableArray alloc]init];
    
    _mydata=[[NSMutableData alloc]init];
    NSString *url=@"http://www.physics.leidenuniv.nl/json/news.php";///url is in string format
    NSURL *actualurl=[NSURL URLWithString:url];//assign to nsurl
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:actualurl];//make connection with server so create request
    NSURLConnection *connection=[NSURLConnection connectionWithRequest:request delegate:self];
    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"infoTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_mydata setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_mydata appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *outerdic=[NSJSONSerialization JSONObjectWithData:_mydata options:NSJSONReadingAllowFragments error:nil];
    NSArray *array=[outerdic objectForKey:@"newsItems"];
    
    for (NSDictionary *temp in array)
    {
        database *d1=[[database alloc]init];
        d1.ndate=[temp objectForKey:@"date"];
        //NSString *str= [temp objectForKey:@"contents"];
        [_countarray addObject:d1];
    }
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _countarray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    

    database *temp=[_countarray objectAtIndex:indexPath.row];
    
    cell.text=temp.ndate;
    //cell.numberOfLines=7;
/////////fregdgdf
    //////////fgget
    //////////erggge
    //jghejge
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
