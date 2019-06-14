#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IInkUIReferenceImplementation.h"
#import "Helper.h"
#import "IInkUIRefImplUtils.h"
#import "NSAttributedString+Helper.h"
#import "NSFileManager+Additions.h"
#import "UIfont+Helper.h"
#import "UIFont+Traits.h"
#import "Canvas.h"
#import "FontMetricsProvider.h"
#import "ImageDrawer.h"
#import "ImageLoader.h"
#import "Path.h"
#import "DisplayViewController.h"
#import "EditorViewController.h"
#import "SmartGuideViewController.h"
#import "InputView.h"
#import "RenderView.h"

FOUNDATION_EXPORT double IInkUIReferenceImplementationVersionNumber;
FOUNDATION_EXPORT const unsigned char IInkUIReferenceImplementationVersionString[];

