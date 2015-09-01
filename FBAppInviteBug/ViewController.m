
#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController () <FBSDKAppInviteDialogDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *inviteFriends = [UIButton buttonWithType:UIButtonTypeCustom];
    [inviteFriends setTitle:@"Invite friends to app" forState:UIControlStateNormal];
    inviteFriends.frame = CGRectMake(50, 50, 200, 100);
    inviteFriends.backgroundColor = [UIColor darkGrayColor];
    [inviteFriends addTarget:self action:@selector(inviteFriendsFromFacebook) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:inviteFriends];
}

- (void)inviteFriendsFromFacebook {
    FBSDKAppInviteContent *content =[[FBSDKAppInviteContent alloc] init];
    content.appLinkURL = [NSURL URLWithString:@"{FACEBOOK_APP_LINK}"]; //app link generated here: https://developers.facebook.com/quickstarts/?platform=app-links-host
    [FBSDKAppInviteDialog showWithContent:content delegate:self];
}


#pragma mark - FBSDKAppInviteDialogDelegate

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didCompleteWithResults:(NSDictionary *)results {
    NSLog(@"appInviteDialog:didCompleteWithResults: %@", results);
}

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didFailWithError:(NSError *)error {
    NSLog(@"appInviteDialog:didFailWithError: %@", error);
}

@end
