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

- (void)fetchJsonData{
    jsonObject = [[NSMutableDictionary alloc]init];
        NSString *urlAsString = [NSString stringWithFormat:@"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"];
        
        NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
        NSString *encodedUrlAsString = [urlAsString stringByAddingPercentEncodingWithAllowedCharacters:set];
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        [[session dataTaskWithURL:[NSURL URLWithString:urlAsString]
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    NSLog(@"RESPONSE RECEIVED: %@",response);//just to check if its working or not
                    NSLog(@"DATA RECEIVED: %@",data);
                    
                    if (!error) {
                        // Success
                        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                            NSError *jsonError;
                            self.jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                            
                            if (jsonError) {
                                // Error Parsing JSON
                                NSLog(@"Error Parsing Json%@",error.localizedDescription);
                            } else {
                                // Success Parsing JSON
                                NSLog(@" LOG JSON RESPONCE%@",self.jsonObject);
                            }
                        }  else {
                            //Web server is returning an error
                        }
                    } else {
                        NSLog(@"error : %@", error.description);
                    }
                }] resume];
    
}

@end
