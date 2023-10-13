#import <Foundation/Foundation.h>

%hook WCFacade
-(bool) isTimelineVideoSightAutoPlayEnable {return NO;}
%end

%hook WCDataItem
-(bool) isVideoAd {return NO;}
-(bool) isAd {return NO;}
%end

%hook WCMediaItem
-(bool) isAd {return NO;}
%end

%hook WCAdvertiseStorage
-(void) setOAdvertiseData:(id)x {}
%end

%hook JailBreakHelper
-(bool) IsJailBreak {return NO;}
-(bool) HasInstallJailbreakPlugin:(id)x {return NO;}
-(bool) JailBroken {return NO;}
%end

%hook BTCanvasItemCellView
-(void)popUpCanvas:(id)arg0 rect:(id)arg1 hexColor:(id)arg2 mode:(unsigned int)arg3 closeBlock:(id)arg4 {}
-(double) canvasViewHeight {return 0;}
-(double) getCanvasViewVisibleContainerHeight {return 0;}
-(double) getCanvasViewVisibleOffsetY {return 0;}
-(void) setViewModel:(id)x {}
%end

%hook __NSURLSessionLocal
- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest  *)request
                            completionHandler:(void (^)(NSData *data,
                                                        NSURLResponse *response,
                                                        NSError *error))completionHandler
{
	NSString *url=request.URL.absoluteString;
	//NSLog(@"LOL:%@ %@", url, completionHandler);
	if ([url rangeOfString:@"getappmsgad"].location!=NSNotFound){
		NSURL *x = [NSURL URLWithString:@"https://www.gstatic.com/generate_204"];
		return %orig([NSMutableURLRequest requestWithURL:x], completionHandler);

	}
	else
		return %orig;
};
%end
