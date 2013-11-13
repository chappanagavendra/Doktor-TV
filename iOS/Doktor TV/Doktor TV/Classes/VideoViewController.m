//
//  VideoViewController.m
//  Doktor TV
//
//  Created by Tobias DM on 13/11/13.
//  Copyright (c) 2013 developmunk. All rights reserved.
//

#import "VideoViewController.h"

#import "KeepLayout.h"
#import "AFNetworking.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	
	UIButton *streamVideoButton = [UIButton new];
	[self.view addSubview:streamVideoButton];
	[streamVideoButton addTarget:self action:@selector(streamVideo) forControlEvents:UIControlEventTouchUpInside];
	[streamVideoButton setTitle:@"Stream" forState:UIControlStateNormal];
	[streamVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	
	UIButton *downloadVideoButton = [UIButton new];
	[self.view addSubview:downloadVideoButton];
	[downloadVideoButton addTarget:self action:@selector(downloadVideo) forControlEvents:UIControlEventTouchUpInside];
	[downloadVideoButton setTitle:@"Download" forState:UIControlStateNormal];
	[downloadVideoButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	
	NSArray *buttons = @[streamVideoButton,downloadVideoButton];
	[buttons keepSize:CGSizeMake(200, 44)];
	[buttons keepLeftAligned];
	[buttons keepVerticalOffsets:KeepRequired(20.0f)];
	((UIView *)buttons.firstObject).keepLeftInset.equal = KeepRequired(20.0f);
	((UIView *)buttons.firstObject).keepTopInset.equal = KeepRequired(20.0f);
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)streamVideo
{
	NSString *link = @"http://vodfiles.dr.dk/CMS/Resources/dr.dk/NETTV/DR3/2013/11/dd50a214-8aee-4c6a-8631-70a0c671a1b1/BoesseStudier---Stereotyper--2_9a4fb08b27d24c46992e81bd967a52b4_122.mp4?ID=1629336";
	NSURL *url = [NSURL URLWithString:link];
	MPMoviePlayerViewController *moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
	
	[self presentMoviePlayerViewControllerAnimated:moviePlayerViewController];
}

- (void)downloadVideo
{
	NSString *stringURL = @"http://vodfiles.dr.dk/CMS/Resources/dr.dk/NETTV/DR3/2013/11/dd50a214-8aee-4c6a-8631-70a0c671a1b1/BoesseStudier---Stereotyper--2_9a4fb08b27d24c46992e81bd967a52b4_122.mp4?ID=1629336";
	NSURL  *url = [NSURL URLWithString:stringURL];
	NSData *urlData = [NSData dataWithContentsOfURL:url];
	if ( urlData )
	{
		NSArray       *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
		NSString  *documentsDirectory = [paths objectAtIndex:0];
		NSString  *filePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"test.mp4"];
		[urlData writeToFile:filePath atomically:YES];
		NSLog(@"Saved video to: %@",filePath);
	}
}

- (void)getAllSeriesFromDR
{
	
}

@end
