// Copyright @ MyScript. All rights reserved.

#import <Foundation/Foundation.h>
#import <iink/IINKIRenderTarget.h>

@class IINKConfiguration;
@class IINKRenderer;
@class IINKEditor;
@class IINKContentPackage;
@class IINKParameterSet;
@class IINKRecognitionAssetsBuilder;


/**
 * Represents a Package open option.
 * @since 1.2
 */
typedef NS_ENUM(NSUInteger, IINKPackageOpenOption)
{
  /** Open an existing package. */
  IINKPackageOpenOptionExisting,
  /** Create a new package if it does not exist. */
  IINKPackageOpenOptionCreate,
  /** Create a new package, failing if it already exists. */
  IINKPackageOpenOptionCreateNew,
  /** If the package already exists then its content is discarded. */
  IINKPackageOpenOptionTruncateExisting
};


/**
 * Wrapper object for an `IINKPackageOpenOption` value.
 */
@interface IINKPackageOpenOptionValue : NSObject
{
  
}

@property (nonatomic) IINKPackageOpenOption value;

/**
 * Create a new `IINKPackageOpenOptionValue` instance.
 * @param value the package open option value.
 */
- (nullable instancetype)initWithValue:(IINKPackageOpenOption)value;

/**
 * Builds a new `IINKPackageOpenOptionValue` instance.
 * @param value the package open option value.
 */
+ (nonnull IINKPackageOpenOptionValue *)valueWithPackageOpenOption:(IINKPackageOpenOption)value;

@end

/**
 * Represents the iink runtime environment.
 */
@interface IINKEngine : NSObject
{

}

//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * The configuration associated with this engine.
 */
@property (nonatomic, readonly, nonnull) IINKConfiguration *configuration;

/**
 * Lists the part types supported by this engine.
 *
 * @return the list of supported part types.
 */
@property (nonatomic, readonly, nonnull) NSArray<NSString *> *supportedPartTypes;


//==============================================================================
#pragma mark - Constructors
//==============================================================================

/**
 * Create a new `Engine` instance.
 * @param aCertificate certificate bytes data.
 */
- (nullable instancetype)initWithCertificate:(nonnull NSData *)aCertificate;


//==============================================================================
#pragma mark - Factories
//==============================================================================

/**
 * Creates a new renderer.
 *
 * @param dpiX the physical horizontal resolution of the display in dots per
 *   inch.
 * @param dpiY the physical vertical resolution of the display in dots per
 *   inch.
 * @param target the render target.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument if `dpiX` is not a number or is negative.
 *   * IINKErrorInvalidArgument if `dpiY` is not a number or is negative.
 * @return the newly created renderer, otherwise `nil`.
 */
- (nullable IINKRenderer *)createRendererWithDpiX:(float)dpiX dpiY:(float)dpiY
                                           target:(nullable id<IINKIRenderTarget>)target
                                            error:(NSError * _Nullable * _Nullable)error;

/**
 * Creates a new renderer.
 *
 * @param dpiX the physical horizontal resolution of the display in dots per
 *   inch.
 * @param dpiY the physical vertical resolution of the display in dots per
 *   inch.
 * @param target the render target.
 * @return the newly created renderer, otherwise `nil`.
 */
- (nullable IINKRenderer *)createRendererWithDpiX:(float)dpiX dpiY:(float)dpiY target:(nullable id<IINKIRenderTarget>)target
                            DEPRECATED_MSG_ATTRIBUTE("Use createRendererWithDpiX:dpiY:target:error: instead.");

/**
 * Creates a new editor.
 *
 * @param renderer the renderer to be used to display editor's content.
 * @return the newly created editor on success, otherwise `nil`.
 */
- (nullable IINKEditor *)createEditor:(nonnull IINKRenderer *)renderer;

/**
 * Creates an empty parameter set.
 *
 * @return the newly created parameter set on success, otherwise `nil`.
 */
- (nullable IINKParameterSet *)createParameterSet;

/**
 * Creates a new recognition assets builder.
 *
 * @return the newly created recognition assets builder on success, otherwise `nil`.
 */
- (nullable IINKRecognitionAssetsBuilder *)createRecognitionAssetsBuilder;


//==============================================================================
#pragma mark - Package Management
//==============================================================================

/**
 * Creates a new package.
 *
 * @param fileName the package file.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when a package with associated fileName already exists.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorInvalidArgument when a package associated with the same
 *   fileName is already opened, it can be accessed via a call to openPackage().
 * @return the package on success, otherwise `nil`.
 */
- (nullable IINKContentPackage *)createPackage:(nonnull NSString *)fileName
                                     error:(NSError * _Nullable * _Nullable)error;

/**
 * Opens the specified package.
 *
 * @param fileName the package file.
 * @param openOption the package open option.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime if `openOption` is `IINKPackageOpenOptionExisting`,
 *   when a package with associated fileName does not exist.
 *   * IINKErrorRuntime if `openOption` is `IINKPackageOpenOptionCreateNew`,
 *   when a package with associated fileName already exists.
 *   * IINKErrorInvalidArgument if `openOption` is `IINKPackageOpenOptionCreateNew`,
 *   when a package associated with the same fileName is already opened.
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return the package on success, otherwise `nil`.
 */
- (nullable IINKContentPackage *)openPackage:(nonnull NSString *)fileName
                                  openOption:(IINKPackageOpenOption)openOption
                                       error:(NSError * _Nullable * _Nullable)error;

/**
 * Opens the specified package using `IINKPackageOpenOptionExisting`.
 *
 * @param fileName the package file.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when a package with associated fileName does not exist.
 *   * IINKErrorRuntime when an I/O operation fails.
 * @return the package on success, otherwise `nil`.
 */
- (nullable IINKContentPackage *)openPackage:(nonnull NSString *)fileName
                                       error:(NSError * _Nullable * _Nullable)error;

/**
 * Deletes the specified package.
 *
 * @param fileName the package file.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorInvalidArgument when a package associated with the same
 *   fileName is already opened.
 */
- (void)deletePackage:(nonnull NSString *)fileName
                error:(NSError * _Nullable * _Nullable)error;

@end
