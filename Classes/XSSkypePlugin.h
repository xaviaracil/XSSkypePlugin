//
//  XSSkypePlugin.h
//  XSSkypePlugin
//
//  Created by Xavi Aracil on 07/11/10.
//  Copyright (c) 2010 Tecsidel, S.A. All rights reserved.
//

#import <AddressBook/AddressBook.h>
#import "XSSkypePlugin.h"

#define kXSSkypeProperty @"com.xaracSoft.SkypeToAddressBook.skypeName"
#define kSkypeToAddressBookDefaultValue @"Use SkypeToAddressBook to assign a Skype contact to this contact"

@interface XSSkypePlugin : NSObject
{
}

// Returns the property this action is for.
- (NSString *)actionProperty;

// Returns the title for this action. The current person is passed in as person.
// If the actionProperty is a multiValue type, identifier will contain the identifier
// of the item the user rolled over. If the actionProperty is not a multiValue type
// identifier will be nil.
- (NSString *)titleForPerson:(ABPerson *)person identifier:(NSString *)identifier;

// This method is called when the user selects your action. As above, this method
// is passed information about the data item rolled over.
- (void)performActionForPerson:(ABPerson *)person identifier:(NSString *)identifier;

// Optional. Your action will always be enabled in the absence of this method. As
// above, this method is passed information about the data item rolled over.
- (BOOL)shouldEnableActionForPerson:(ABPerson *)person identifier:(NSString *)identifier;

@end
