#import <UIKit/UIKit.h>

typedef void (^sessionHandler)(NSData *data, NSURLResponse *response, NSError *error);
NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];

%hook NSURLSession

-(NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request completionHandler:(sessionHandler)completionHandler {
    if ([request.URL.absoluteString containsString:@"/premium/sync"]) {
        sessionHandler previousCompletionHandler = completionHandler;
        completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {
            previousCompletionHandler([NSData dataWithContentsOfFile:@"/Library/PreferenceBundles/DreamHackPreferences.bundle/sync.json"],
                                       response,
                                       error);
        };
    } else if ([request.URL.absoluteString containsString:@"/api/users"]) {
        sessionHandler previousCompletionHandler = completionHandler;
        completionHandler = ^(NSData *data, NSURLResponse *response, NSError *error) {
            previousCompletionHandler([NSData dataWithContentsOfFile:@"/Library/PreferenceBundles/DreamHackPreferences.bundle/users.json"],
                                       response,
                                       error);
        };
    }
    return %orig(request, completionHandler);
}

%end
