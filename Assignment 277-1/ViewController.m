//
//  ViewController.m
//  Assignment 277-1
//
//  Created by Athitha Anantharamu on 9/26/16.
//  Copyright © 2016 Athitha Anantharamu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSFileManager *fileMgr;
    NSString *dataFile;
    NSString *docDir;
    NSArray *dirPaths;
    
    fileMgr = [NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docDir = dirPaths[0];
    
    dataFile = [docDir stringByAppendingString:@ "datafile.dat"];
    
    
    if([fileMgr fileExistsAtPath:dataFile])
    {
        NSData *dataBuffer;
        dataBuffer = [fileMgr contentsAtPath:dataFile];
        
        NSString *dataString = [[NSString alloc]
                                initWithData:dataBuffer encoding:NSASCIIStringEncoding];
        _Name.text = dataString;
        
    }
    
    _dataFilePath = [[NSString alloc] initWithString:[docDir stringByAppendingString:@"data.archive"]];
    
    if([ fileMgr fileExistsAtPath:_dataFilePath]){
        NSMutableArray *dataArray;
        dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:_dataFilePath];
        _Name.text= dataArray[0];
        _Author.text = dataArray[1];
        _Desc.text = dataArray[2];
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SaveFileBtn:(id)sender {
    NSFileManager *fileMgr;
    NSString *dataFile;
    NSData *dataBuffer;
    NSString *docDir;
    NSArray *dirPaths;
    
    fileMgr =[NSFileManager defaultManager];
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    docDir = dirPaths[0];
    dataFile = [docDir stringByAppendingString:@ "datafile.dat"];
    NSLog(@"dataFile %@", dataFile);
    
    NSMutableArray *bookArray;
    
    bookArray = [[NSMutableArray alloc] init];
    NSString *temp = _Name.text;
    [bookArray addObject:temp];
    NSString *temp1 = _Author.text;
    [bookArray addObject:temp1];
    NSString *temp2 = _Desc.text;
    [bookArray addObject: temp2];
    [bookArray writeToFile:dataFile atomically:YES];
    //[fileMgr createFileAtPath: dataFile contents: dataBuffer attributes:nil];
    

    
}
- (IBAction)SaveArchiveBtn:(id)sender {
    
    NSMutableArray *contactArray;
    contactArray =[[NSMutableArray alloc] init];
    [contactArray addObject:_Name.text];
    [contactArray addObject:_Author.text];
    [contactArray addObject:_Desc.text];
    [NSKeyedArchiver archiveRootObject:contactArray toFile:_dataFilePath];
    NSLog(@"_dataFilePath %@", _dataFilePath);
    
}

@end
