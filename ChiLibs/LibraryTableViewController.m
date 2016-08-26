//
//  LibraryTableViewController.m
//  ChiLibs
//
//  Created by Allan Evans on 7/8/16.
//  Copyright © 2016 lingo-slingers.org. All rights reserved.
//

#import "LibraryTableViewController.h"
#import "LibraryDetailViewController.h"
#import "LibraryURLSession.h"
#import "Library.h"

@interface LibraryTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *sectionDictionary;
@property (nonatomic, strong) NSArray *sectionTitles;
@property (nonatomic, strong) LibraryURLSession *libraryURLSession;

- (void)setupSectionsWithLibraryArray:(NSArray *)libraryArray;

@end

@implementation LibraryTableViewController

- (LibraryURLSession *)libraryURLSession
{
    if (_libraryURLSession == nil)
    {
        _libraryURLSession = [[LibraryURLSession alloc] init];
    }
    return _libraryURLSession;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableArray *libraryArray = [NSMutableArray array];
    [self.libraryURLSession sendRequest:self completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil)
        {
            NSError *JSONerror;
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONerror];
            for (NSDictionary *libraryDict in responseArray) {
                Library *library = [[Library alloc] initWithDictionary:libraryDict];
                [libraryArray addObject:library];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setupSectionsWithLibraryArray:libraryArray];
                [self.tableView reloadData];
                
            });
        }
        else
        {
            // something other than a toy app would have real error handling...
        }
    }];
}

#pragma mark - UITableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = self.sectionTitles[section];
    NSArray *sectionArray = [self.sectionDictionary objectForKey:sectionTitle];
    return [sectionArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionTitles count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionTitles;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionTitles[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LibraryTableViewCell"];
    NSString *sectionTitle = self.sectionTitles[indexPath.section];
    NSArray *sectionArray = [self.sectionDictionary objectForKey:sectionTitle];
    Library *library = sectionArray[indexPath.row];
    cell.textLabel.text = library.name;
    return cell;
}

#pragma mark - navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:NSStringFromClass([LibraryDetailViewController class])])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        LibraryDetailViewController *detailViewController = (LibraryDetailViewController *)[segue destinationViewController];
        NSString *sectionTitle = self.sectionTitles[indexPath.section];
        NSArray *sectionArray = [self.sectionDictionary objectForKey:sectionTitle];
        detailViewController.detailLibrary = sectionArray[indexPath.row];
    }
}

#pragma mark - private methods
- (void)setupSectionsWithLibraryArray:(NSArray *)libraryArray
{
    self.sectionDictionary = [NSMutableDictionary dictionary];
    for (Library *library in libraryArray)
    {
        NSString *firstLetterOfName = [library.name substringToIndex:1];
        
        if ([self.sectionDictionary objectForKey:firstLetterOfName] == nil)
        {
            NSMutableArray *sectionArray = [NSMutableArray arrayWithObject:library];
            [self.sectionDictionary setObject:sectionArray forKey:firstLetterOfName];
        }
        else
        {
            [self.sectionDictionary[firstLetterOfName] addObject:library];
        }
    }
    self.sectionTitles = [[self.sectionDictionary allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

@end
