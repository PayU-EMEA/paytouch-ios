# AFOAuth2Client

AFOAuth2Client is an extension for [AFNetworking](http://github.com/AFNetworking/AFNetworking/) that greatly simplifies the process of authenticating against an [OAuth 2](http://oauth.net/2/) provider.

## Example Usage

``` objective-c
NSURL *url = [NSURL URLWithString:@"http://example.com/"];
AFOAuth2Client *oauthClient = [AFOAuth2Client clientWithBaseURL:url clientID:kClientID secret:kClientSecret];

[oauthClient authenticateUsingOAuthWithPath:@"/oauth/token"
                                   username:@"username"
                                   password:@"password"
                                      scope:@"email"
                                    success:^(AFOAuthCredential *credential) {
                                        NSLog(@"I have a token! %@", credential.accessToken);
                                        [AFOAuthCredential storeCredential:credential withIdentifier:oauthClient.serviceProviderIdentifier];
                                    }
                                    failure:^(NSError *error) {
                                        NSLog(@"Error: %@", error);
                                    }];
```

## Documentation

Documentation for all releases of AFOAuth1Client, including the latest, are [available on CocoaDocs](http://cocoadocs.org/docsets/AFOAuth2Client/).

## Contact

Mattt Thompson

- http://github.com/mattt
- http://twitter.com/mattt
- m@mattt.me

## License

AFOAuth2Client is available under the MIT license. See the LICENSE file for more info.
