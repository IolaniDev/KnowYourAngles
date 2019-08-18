// Copyright MyScript. All right reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@class IINKContentPackage;
@class IINKParameterSet;

/**
 * A part stores one content item. It is structured into several blocks that
 * consist of semantically meaningful sub sections of content. A part can be
 * interpreted as a hierarchy of blocks.
 *
 * @see IINKContentPackage.
 */
@interface IINKContentPart : NSObject
{

}

//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * The package that contains this part.
 */
@property (nonatomic, readonly, nonnull) IINKContentPackage *package;

/**
 * The identifier of this part.
 */
@property (nonatomic, readonly, nonnull) NSString *identifier;

/**
 * The type of this part.
 */
@property (nonatomic, readonly, nonnull) NSString *type;

/**
 * The view box, the rectangle that represents the viewable area of
 * this part's content.
 */
@property (nonatomic, readonly) CGRect viewBox;

/**
 * The part's metadata as a parameter set.
 */
@property (nonatomic, nullable) IINKParameterSet *metadata;

@end
