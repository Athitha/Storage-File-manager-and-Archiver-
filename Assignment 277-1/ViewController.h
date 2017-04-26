//
//  ViewController.h
//  Assignment 277-1
//
//  Created by Athitha Anantharamu on 9/26/16.
//  Copyright © 2016 Athitha Anantharamu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *Author;
@property (weak, nonatomic) IBOutlet UITextField *Desc;

@property (weak, nonatomic) IBOutlet UIButton *SaveArchiveBtn;
@property (strong, nonatomic) NSString *dataFilePath;
@property (weak, nonatomic) IBOutlet UIButton *SaveFileBtn;

@end

