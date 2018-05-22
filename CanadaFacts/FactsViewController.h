//
//  FactsViewController.h
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FactModel.h"

@interface FactsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableView;
    FactModel *canadaFactsList;
}
@property(strong,nonatomic)UITableView *tableView;
@property(strong,nonatomic)FactModel *canadaFactsList;

@end
