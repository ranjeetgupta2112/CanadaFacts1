//
//  FactsViewController.m
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsViewController.h"
#import "FactsViewCell.h"
#import "FactsJsonObject.h"

@interface FactsViewController ()

@end

@implementation FactsViewController
@synthesize tableView = _tableView;
@synthesize jsonParsedData = _jsonParsedData;

- (void)viewDidLoad {
    [super viewDidLoad];
    FactsJsonObject *factsJsonObject = [[FactsJsonObject alloc]init];
    [factsJsonObject fetchJsonData];
    jsonParsedData = [factsJsonObject jsonObject];
    // Do any additional setup after loading the view.
    
    //We craete a tableView and add it to the current viewcontroller...
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"FactCellIdentifier";
    FactsViewCell *cell = (FactsViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[FactsViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
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
