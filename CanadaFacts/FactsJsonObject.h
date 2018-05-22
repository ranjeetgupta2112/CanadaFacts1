//
//  FactsJsonObject.h
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FactsDataModel.h"

@interface FactsJsonObject : NSObject{
    NSMutableDictionary *jsonObject;
}
- (FactsDataModel *) fetchJsonData;
@property (nonatomic, strong)NSMutableDictionary *jsonObject;

@end
