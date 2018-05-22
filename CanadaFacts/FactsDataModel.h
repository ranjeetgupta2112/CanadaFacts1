//
//  FactsDataModel.h
//  CanadaFacts
//
//  Created by Amal Rajan on 22/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FactModel;
@class FactRow;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces
@interface FactsDataModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSArray<FactRow *> *rows;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;

@end

@interface FactRow : NSObject
@property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSString *theDescription;
@property (nonatomic, nullable, copy) NSString *imageHref;
@end

NS_ASSUME_NONNULL_END
