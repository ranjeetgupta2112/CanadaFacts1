//
//  FactsJsonObject.m
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsJsonObject.h"

@implementation FactsJsonObject
@synthesize jsonObject = _jsonObject;

-(FactsDataModel *)fetchJsonData{
    FactsDataModel *jsonArray;
    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"] options:NSDataReadingUncached error:&error];
    if (error) {
        jsonArray = nil;
        NSLog(@"%@", [error localizedDescription]);
    } else {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSData *encodedData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        
        
        //parsing the encoded data to get the Canda Facts data dictionary
        NSError *jsonError;
        FactsDataModel *jsonObject = [NSJSONSerialization JSONObjectWithData:encodedData options:0 error:&jsonError];
        
        if (jsonError) {
            // Error Parsing JSON
            jsonArray = nil;
            NSLog(@"Error Parsing Json%@",error.localizedDescription);
        } else {
            // Success Parsing JSON
            jsonArray = [jsonObject valueForKey:@"rows"];
        }
        
    }
    
    return jsonArray;
}

@end
