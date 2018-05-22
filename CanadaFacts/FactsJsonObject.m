//
//  FactsJsonObject.m
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsJsonObject.h"
#import "FactModel.h"

@implementation FactsJsonObject

-(FactModel *)fetchJsonData{
    FactModel *jsonObject = nil;
    NSError* error = nil;
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"] options:NSDataReadingUncached error:&error];
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    } else {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
        NSData *encodedData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        
        
        //parsing the encoded data to get the Canda Facts data dictionary
        NSError *jsonError;
        jsonObject = [FactModel fromData:encodedData error:&jsonError];
        NSLog(@"JSOn Object %@",jsonObject);
        
        if (jsonError) {
            // Error Parsing JSON
            NSLog(@"Error Parsing Json%@",error.localizedDescription);
        }
    }
    
    return jsonObject;
}

@end
