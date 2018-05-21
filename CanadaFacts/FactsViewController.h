//
//  FactsViewController.h
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FactsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
}
@property(strong,nonatomic)UITableView *tableView;

@end
