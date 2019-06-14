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

#import "iink/graphics/IINKICanvas.h"
#import "iink/graphics/IINKIPath.h"
#import "iink/graphics/IINKStyle.h"
#import "iink/IINK.h"
#import "iink/IINKConfiguration.h"
#import "iink/IINKConfigurationDelegate.h"
#import "iink/IINKContentBlock.h"
#import "iink/IINKContentPackage.h"
#import "iink/IINKContentPart.h"
#import "iink/IINKEditor.h"
#import "iink/IINKEditorDelegate.h"
#import "iink/IINKEngine.h"
#import "iink/IINKError.h"
#import "iink/IINKIImageDrawer.h"
#import "iink/IINKIRenderTarget.h"
#import "iink/IINKMimeType.h"
#import "iink/IINKParameterSet.h"
#import "iink/IINKRecognitionAssetsBuilder.h"
#import "iink/IINKRenderer.h"
#import "iink/IINKRendererDelegate.h"
#import "iink/text/IINKIFontMetricsProvider.h"
#import "iink/text/IINKText.h"
#import "iink/text/IINKTextSpan.h"

FOUNDATION_EXPORT double MyScriptInteractiveInk_RuntimeVersionNumber;
FOUNDATION_EXPORT const unsigned char MyScriptInteractiveInk_RuntimeVersionString[];

