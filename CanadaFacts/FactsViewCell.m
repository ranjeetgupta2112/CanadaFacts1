//
//  FactsViewCell.m
//  CanadaFacts
//
//  Created by Amal Rajan on 21/05/18.
//  Copyright © 2018 RanjeetHO. All rights reserved.
//

#import "FactsViewCell.h"

@implementation FactsViewCell
@synthesize labelTitle = _labelTitle;
@synthesize labelDescription = _labelDescription;
@synthesize imageFact = _imageFact;
@synthesize labelTemp = _labelTemp;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //creating text label programatically, we assume the parent view has its frame already set.
        self.labelTitle = [[UILabel alloc] init];
        [self.labelTitle setFont:[UIFont fontWithName:@"Arial-BoldMT" size:15]];
        self.labelTitle.tag = 1;
        self.labelTitle.textColor = [UIColor blackColor];
        self.labelTitle.numberOfLines=0;
        [self.labelTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
        self.labelTitle.preferredMaxLayoutWidth = self.frame.size.width;
        [self.labelTitle sizeToFit];
        [self.labelTitle setNeedsDisplay];
        [self.contentView addSubview:self.labelTitle];
        
        //creating text Description programatically, we assume the parent view has its frame already set.
        self.labelDescription = [[UILabel alloc] init];
        [self.labelDescription setFont:[UIFont fontWithName:@"Arial" size:15]];
        self.labelDescription.tag = 2;
        self.labelDescription.textColor = [UIColor blackColor];
        self.labelDescription.numberOfLines=0;
        self.labelDescription.lineBreakMode = NSLineBreakByWordWrapping;
        self.labelDescription.preferredMaxLayoutWidth = self.frame.size.width; // assumes the parent view has its frame already set.
        [self.labelDescription sizeToFit];
        [self.labelDescription setNeedsDisplay];
        [self.labelDescription setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.labelDescription];
        
        //creating text Description programatically, we assume the parent view has its frame already set.
        self.imageFact = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"default.png"]];
        [self.imageFact setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.contentView addSubview:self.imageFact];
        
        //creating the constraints around title label
        NSLayoutConstraint *leftTitle = [NSLayoutConstraint constraintWithItem:self.labelTemp attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:5];
        NSLayoutConstraint *topTitle = [NSLayoutConstraint constraintWithItem:self.labelTemp attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:10];
        NSLayoutConstraint *rightTitle = [NSLayoutConstraint constraintWithItem:self.labelTemp attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
        [self.contentView addConstraints:@[leftTitle, topTitle]];
        [self.contentView addConstraint:rightTitle];
        
        //creating the constraints around title description
        NSLayoutConstraint *topDescription = [NSLayoutConstraint constraintWithItem:self.labelDescription attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.labelTemp attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
        NSLayoutConstraint *leftDescription = [NSLayoutConstraint constraintWithItem:self.labelDescription attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
        NSLayoutConstraint *rightDescription = [NSLayoutConstraint constraintWithItem:self.labelDescription attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:-10];
        [self.contentView addConstraints:@[topDescription, leftDescription, rightDescription]];

        //creating the constraints around imageView
        NSLayoutConstraint *topImage = [NSLayoutConstraint constraintWithItem:self.imageFact attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.labelDescription attribute:NSLayoutAttributeBottom multiplier:1 constant:5];
        NSLayoutConstraint *leftImage = [NSLayoutConstraint constraintWithItem:self.imageFact attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:10];
        NSLayoutConstraint *heightImage = [NSLayoutConstraint constraintWithItem:self.imageFact attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
        NSLayoutConstraint *widthImage = [NSLayoutConstraint constraintWithItem:self.imageFact attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:100];
        NSLayoutConstraint *bottomImage = [NSLayoutConstraint constraintWithItem:self.imageFact attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-10];
        [self.contentView addConstraints:@[topImage,leftImage,heightImage,widthImage,bottomImage]];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
