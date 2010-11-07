//
//  XSSkypePlugin.m
//  XSSkypePlugin
//
//  Created by Xavi Aracil on 07/11/10.
//  Copyright (c) 2010 Tecsidel, S.A. All rights reserved.
//

#import "XSSkypePlugin.h"

@implementation XSSkypePlugin

// This example action works with phone numbers.
- (NSString *)actionProperty
{
    return kABPhoneProperty;
}

// Our menu title will look like Speak 555-1212
- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    ABMultiValue* values = [person valueForProperty:[self actionProperty]];
    NSString* value = [values valueForIdentifier:identifier];

    return [NSString stringWithFormat:@"Speak %@", value];    
}

// This method is called when the user selects your action. As above, this method
// is passed information about the data item rolled over.
- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    ABMultiValue* values = [person valueForProperty:[self actionProperty]];
    NSString* value = [values valueForIdentifier:identifier];

    NSSpeechSynthesizer* speech = [[NSSpeechSynthesizer alloc] initWithVoice:[NSSpeechSynthesizer defaultVoice]];
    [speech startSpeakingString:value];
    [speech autorelease];
}

// Optional. Your action will always be enabled in the absence of this method. As
// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier
{
    return YES;
}

@end