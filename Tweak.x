@import UIKit;


@interface APSMessage : NSObject <NSCoding>
-(NSUUID *)guid;
@end

@interface APSIncomingMessage : APSMessage
@end

%hook APSIncomingMessage

-(id)initWithDictionary:(NSDictionary *)arg0 xpcMessage:(id)arg1
{
	
	id t = %orig;
	
	NSString *fileName = [NSString stringWithFormat:@"%@%.0f%@%@", @"/var/jb/var/mobile/Documents/notifications/",[[NSDate date] timeIntervalSince1970], @"-" ,[self guid]]; // filename is notification timestamp, a hyphen, and its guid
	NSError *ee;
	NSData *data = [arg0.description dataUsingEncoding:NSUTF8StringEncoding];
	
	BOOL success = [data writeToFile:fileName options:NSDataWritingAtomic error:&ee]; // error arg accepts pointer pointer
	
	if (!success) {
		NSLog(@"%@%@", @"Notification Logger Write Error: ", ee); // frcoal
	}
	
	return t;

}

%end


