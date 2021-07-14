// Copyright @ MyScript. All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <iink/IINKContentBlock.h>
#import <iink/IINKIImageDrawer.h>
#import <iink/IINKEditorDelegate.h>
#import <iink/IINKError.h>
#import <iink/IINKMimeType.h>
#import "iink/IINKParameterSet.h"
#import <iink/text/IINKIFontMetricsProvider.h>


@class IINKContentPart;
@class IINKEngine;
@class IINKRenderer;
@class IINKConfiguration;

/**
 * Describes the types of pointer that can be used for input.
 */
typedef NS_ENUM(NSUInteger, IINKPointerType)
{
  /** The pointer is a pen. */
  IINKPointerTypePen,
  /** The pointer is a touch point. */
  IINKPointerTypeTouch,
  /** The pointer is an eraser. */
  IINKPointerTypeEraser
};

/**
 * Describes the types of pointer event that can be provided to the editor.
 */
typedef NS_ENUM(NSUInteger, IINKPointerEventType)
{
  /** A pointer down event. */
  IINKPointerEventTypeDown,
  /** A pointer move event. */
  IINKPointerEventTypeMove,
  /** A pointer up event. */
  IINKPointerEventTypeUp,
  /** A pointer cancel event. */
  IINKPointerEventTypeCancel
};

/**
 * Represents a pointer event.
 */
typedef struct _IINKPointerEvent
{
  /** The event type. */
  IINKPointerEventType eventType;
  /** The event x coordinate. */
  float x;
  /** The event y coordinate. */
  float y;
  /** The event timestamp. */
  int64_t t;
  /** The event normalised pressure. */
  float f;
  /** The type of input pointer. */
  IINKPointerType pointerType;
  /** The id of the pointer. */
  int pointerId;
} IINKPointerEvent;

CG_INLINE IINKPointerEvent
IINKPointerEventMake(IINKPointerEventType eventType,
                     CGPoint point, int64_t t, float f,
                     IINKPointerType pointerType, int pointerId)
{
  IINKPointerEvent e;
  e.eventType = eventType;
  e.x = (float)point.x;
  e.y = (float)point.y;
  e.t = t;
  e.f = f;
  e.pointerType = pointerType;
  e.pointerId = pointerId;
  return e;
}

CG_INLINE IINKPointerEvent
IINKPointerEventMakeDown(CGPoint point, int64_t t, float f,
                         IINKPointerType pointerType, int pointerId)
{
  return IINKPointerEventMake(IINKPointerEventTypeDown, point, t, f, pointerType, pointerId);
}

CG_INLINE IINKPointerEvent
IINKPointerEventMakeMove(CGPoint point, int64_t t, float f,
                         IINKPointerType pointerType, int pointerId)
{
  return IINKPointerEventMake(IINKPointerEventTypeMove, point, t, f, pointerType, pointerId);
}

CG_INLINE IINKPointerEvent
IINKPointerEventMakeUp(CGPoint point, int64_t t, float f,
                       IINKPointerType pointerType, int pointerId)
{
  return IINKPointerEventMake(IINKPointerEventTypeUp, point, t, f, pointerType, pointerId);
}

CG_INLINE IINKPointerEvent
IINKPointerEventMakeCancel(int pointerId)
{
  return IINKPointerEventMake(IINKPointerEventTypeCancel, CGPointMake(0, 0), -1, 0, (IINKPointerType)0, pointerId);
}


/**
 * The Editor is the entry point by which modification is associated to a part.
 * An editor is associated with a single part.
 *
 * @see IINKContentPart.
 */
@interface IINKEditor : NSObject
{

}


//==============================================================================
#pragma mark - Delegate
//==============================================================================

/**
 * The delegate that will receive editor events.
 */
@property (weak, nonatomic, nullable) id<IINKEditorDelegate> delegate;

/**
 * Adds a delegate to this editor without changing the `delegate` property.
 * @param delegate the delegate to add.
 */
- (void)addDelegate:(nonnull id<IINKEditorDelegate>)delegate;

/**
 * Removes a delegate added by `addDelegate:`
 * @param delegate the delegate to remove.
 */
- (void)removeDelegate:(nonnull id<IINKEditorDelegate>)delegate;


//==============================================================================
#pragma mark - Properties
//==============================================================================

/**
 * The `Engine` to which this editor is attached.
 */
@property (nonatomic, readonly, nonnull) IINKEngine *engine;

/**
 * The `Renderer` associated with this editor.
 */
@property (strong, nonatomic, readonly, nonnull) IINKRenderer *renderer;

/**
 * The part managed by this editor.
 */
@property (strong, nonatomic, nullable) IINKContentPart *part;

/**
 * Sets the part managed by this editor.
 *
 * @param part the part.
 * @param error the recipient for the error description object
 *
 *   * IINKErrorRuntime  when no `IFontMetricProvider` has been set,
 *   via `setFontMetricsProvider()`.
 *   * IINKErrorRuntime  when `part` is already bound.
 *   * IINKErrorRuntime  when this editor cannot be configured.
*/
- (void)setPart:(nullable IINKContentPart*)part
          error:(NSError * _Nullable * _Nullable)error;

/**
 * The configuration associated with this editor.
 */
@property (nonatomic, readonly, nonnull) IINKConfiguration *configuration;


//==============================================================================
#pragma mark - Content Manipulation
//==============================================================================

/**
 * Removes all content from the part.
 */
- (void)clear;

/**
 * Whether undo can be performed on the part or not.
 */
@property (nonatomic, readonly) BOOL canUndo;

/**
 * Undo the last action on part.
 */
- (void)undo;

/**
 * Whether redo can be performed on the part or not.
 */
@property (nonatomic, readonly) BOOL canRedo;

/**
 * Redo the last action reverted by `undo` on part.
 */
- (void)redo;

/**
 * The number of operations performed on the part, since content part was opened.
 *
 * @note the undo stack is partially purged from time to time to control memory consumption.
 *   The number of possible undo operations at a given time is `possibleUndoCount`,
 *   while the total number of operations since content part was opened is `undoStackIndex`.
 */
@property (nonatomic, readonly) NSInteger undoStackIndex;

/**
 * The number of operations that can be undone.
 */
@property (nonatomic, readonly) NSInteger possibleUndoCount;

/**
 * The number of operations that can be redone.
 */
@property (nonatomic, readonly) NSInteger possibleRedoCount;

/**
 * Returns the id of an undo or redo action, based on its position in the stack index.
 * Valid stack index values range from (current stack index - possible undo count) to (current stack index + possible redo count).
 *
 * @param stackIndex the index in the stack of the undo/redo action to retrieve.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when `stackIndex` is invalid.
 *   * IINKErrorRuntime when editor is not associated with a part.
 * @return the id of the undo/redo operation at the specific index in the undo/redo stack.
 */
- (nonnull NSString *)getUndoRedoIdAt:(int)stackIndex
                            error:(NSError * _Nullable * _Nullable)error;

//==============================================================================
#pragma mark - Pointer Events
//==============================================================================

/**
 * Registers a pointer down event.
 *
 * @param point pointer event coordinates.
 * @param t pointer event timestamp, in ms since Unix EPOCH.
 * @param f normalized pressure.
 * @param type the type of input.
 * @param pointerId the id of the pointer.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when pointerType is invalid.
 *   * IINKErrorInvalidArgument when x or y is not a number.
 *   * IINKErrorInvalidArgument when t exceeds year 9999.
 *   * IINKErrorInvalidArgument when f is not a number or is negative.
 *   * IINKErrorRuntime when `pointerDown()` has already been called.
 *   * IINKErrorRuntime in "Text Document" parts, when no view size is set.
 * @return the render item identifier of the starting stroke if any, otherwise
 *   an empty string.
 */
- (nonnull NSString *)pointerDown:(CGPoint)point
                               at:(int64_t)t
                            force:(float)f
                             type:(IINKPointerType)type
                        pointerId:(NSInteger)pointerId
                            error:(NSError * _Nullable * _Nullable)error;

/**
 * Registers a pointer move event.
 *
 * @param point pointer event coordinates.
 * @param t pointer event timestamp, in ms since Unix EPOCH.
 * @param f normalized pressure.
 * @param type the type of input.
 * @param pointerId the id of the pointer.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when pointerType is invalid.
 *   * IINKErrorInvalidArgument when x or y is not a number.
 *   * IINKErrorInvalidArgument when t exceeds year 9999.
 *   * IINKErrorInvalidArgument when f is not a number or is negative.
 *   * IINKErrorRuntime when `pointerDown()` has not been called before.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)pointerMove:(CGPoint)point
                 at:(int64_t)t
              force:(float)f
               type:(IINKPointerType)type
          pointerId:(NSInteger)pointerId
              error:(NSError * _Nullable * _Nullable)error;

/**
 * Registers a pointer up event.
 *
 * @param point pointer event coordinates.
 * @param t pointer event timestamp, in ms since Unix EPOCH.
 * @param f normalized pressure.
 * @param type the type of input.
 * @param pointerId the id of the pointer.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when pointerType is invalid.
 *   * IINKErrorInvalidArgument when x or y is not a number.
 *   * IINKErrorInvalidArgument when t exceeds year 9999.
 *   * IINKErrorInvalidArgument when f is not a number or is negative.
 *   * IINKErrorRuntime when `pointerDown()` has not been called before.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)pointerUp:(CGPoint)point
               at:(int64_t)t
            force:(float)f
             type:(IINKPointerType)type
        pointerId:(NSInteger)pointerId
            error:(NSError * _Nullable * _Nullable)error;

/**
 * Cancels an ongoing pointer trace.
 *
 * @param pointerId the id of the pointer.
 * @param error the recipient for the error description object
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)pointerCancel:(NSInteger)pointerId
                error:(NSError * _Nullable * _Nullable)error;

/**
 * Sends a series of pointer events.
 *
 * @note this method can be used to perform batch recognition by representing
 *   the sequence of digital ink strokes as a series of pointer events and
 *   sending them with the gesture processing disabled.
 *
 * @param events the list of events.
 * @param count the event count.
 * @param processGestures tells whether to process gestures or not.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when pointerType is invalid.
 *   * IINKErrorInvalidArgument when a pointer event contains incorrect data.
 *   * IINKErrorRuntime when event sequence is not allowed.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)pointerEvents:(nonnull IINKPointerEvent *)events
                count:(NSInteger)count
    doProcessGestures:(BOOL)processGestures
                error:(NSError * _Nullable * _Nullable)error;


//==============================================================================
#pragma mark - ViewBox Control
//==============================================================================

/**
 * Sets the size of the view.
 *
 * @param viewSize the view size.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `viewSize`'s width or height is negative.
 */
- (void)setViewSize:(CGSize)viewSize
              error:(NSError * _Nullable * _Nullable)error;

/**
 * Sets the size of the view.
 *
 * @param viewSize the view size.
 */
- (void)setViewSize:(CGSize)viewSize DEPRECATED_MSG_ATTRIBUTE("Use setViewSize:error: instead.");

/**
 * The size of the view.
 */
@property (nonatomic, readonly) CGSize viewSize;

/**
 * Clamps the supplied view offset to the area that ensures standard scrolling
 * behavior. For "Diagram", "Drawing" and "Math" it allows scrolling one
 * screen outside of the view box on each direction. For "Text" and "Text
 * Document" it allows scrolling one screen outside of the view box downward.
 *
 * @param viewOffset the view offset to clamp.
 */
- (void)clampViewOffset:(CGPoint * _Nonnull)viewOffset;

/**
 * Whether scrolling on the part is allowed at this time.
 *
 * @note this applies for example when the editor is resizing or moving an
 *   object.
 */
@property (nonatomic, readonly, getter=isScrollAllowed) BOOL scrollAllowed;


//==============================================================================
#pragma mark - Theme
//==============================================================================

/**
 * The rendering theme style sheet, from a buffer containing
 * CSS styling information.
 */
@property (nonatomic, strong, nonnull) NSString *theme;

/**
 * Changes the rendering theme style sheet, from a buffer containing
 * CSS styling information.
 *
 * @param theme the style sheet, in CSS format.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `theme` is invalid.
 */
- (void)setTheme:(nullable NSString *)theme
           error:(NSError * _Nullable * _Nullable)error;

/**
 * The style classes associated with new strokes.
 *
 * @note style properties `penStyle` may override the styling associated with
 *   the style classes provided here.
 */
@property (nonatomic, strong, nonnull) NSString *penStyleClasses;

/**
 * The CSS style properties associated with new strokes.
 *
 * @note style properties provided with `penStyle()` may override the
 *   properties associated with the style classes provided via
 *   `penStyleClasses()`.
 */
@property (nonatomic, strong, nonnull) NSString *penStyle;

/**
 * Lists the style classes that match a given predicate, associated with their
 * styling properties.
 *
 * @param predicate a function that checks style class names and returns `true`
 *   if class should be added to the returned map, otherwise `false`.
 *
 * @return a map associating class names with styling properties
 *   (NSString->IINKStyle).
 */
- (nonnull NSDictionary *)listStyleClasses:(BOOL (* _Nonnull)(NSString * _Nonnull))predicate;


//==============================================================================
#pragma mark - Block Management
//==============================================================================

/**
 * The content block at the root of the current part.
 */
@property (nonatomic, strong, readonly, nullable) IINKContentBlock *rootBlock;

/**
 * Returns the content block associated with a given `id`.
 *
 * @param identifier the identifier of the block.
 * @return the content block associated with `id` or `nil` if there is no
 *   such block in the current part.
 */
- (nullable IINKContentBlock *)getBlockById:(nullable NSString *)identifier;

/**
 * Checks whether a block is empty.
 *
 * @param block the block to check, `nil` means check full part.
 * @return `true` if block is empty or invalid or editor is not associated with
 *   a part, otherwise `false`.
 */
- (BOOL)isEmpty:(nonnull IINKContentBlock *)block;

/**
 * The types of blocks that can be added to the part.
 * @note new blocks can be added only to a content part with "Text Document"
 *   type: "Text" blocks are automatically created but other blocks must be
 *   added via addBlock(). Blocks cannot be added on other types of part.
 */
@property (nonatomic, readonly, nonnull) NSArray<NSString *> *supportedAddBlockTypes;

/**
 * Returns the supported format for adding a new block with data.
 *
 * @param type the type of the new block.
 *
 * @return an array of the supported mime types.
 */
- (nonnull NSArray<IINKMimeTypeValue *> *)getSupportedAddBlockDataMimeTypes:(nonnull NSString *)type;

/**
 * Adds a new block to the part.
 *
 * @param position the approximative position of the new block.
 * @param type the type of the new block.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when type is not supported by current part
 *   type.
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when a block already exists at this position,
 *   and is not a "Container" block.
 *   * IINKErrorRuntime when empty space around position is too small
 *   for a new block.
 *
 * @return block the newly added block on success, otherwise `nil`.
 */
- (nullable IINKContentBlock *)addBlock:(CGPoint)position
                                   type:(nonnull NSString *)type
                              error:(NSError * _Nullable * _Nullable)error;

/**
 * Adds a new block to the part and fills it with data.
 *
 * @param position the approximative position of the new block.
 * @param type the type of the new block.
 * @param mimeType the mime type that specifies the format of `data`.
 * @param data the data to put i the new block.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when type is not supported by current part
 *   type.
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when a block already exists at this position,
 *   and is not a "Container" block.
 *   * IINKErrorRuntime when empty space around position is too small
 *   for a new block.
 *   * IINKErrorRuntime when the content of `data` could not be added to
 *   the new block.
 *
 * @return block the newly added block on success, otherwise `nil`.
 */
- (nullable IINKContentBlock *)addBlock:(CGPoint)position
                                   type:(nonnull NSString *)type
                               mimeType:(IINKMimeType)mimeType
                                   data:(nonnull NSString *)data
                                  error:(NSError * _Nullable * _Nullable)error;

/**
 * Adds a new image to the part.
 *
 * @note this method creates a new "Drawing" block in which the image will
 *   be added.
 *
 * @param position the approximative position of the new image.
 * @param file the image file to add.
 * @param mimeType the mime type that specifies the format of `inputFile`.
 *   * IINKErrorInvalidArgument when `inputFile` does not exist.
 * @param error the recipient for the error description object
 *   * IINKErrorInvalidArgument when `mimeType` is not an image type.
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when a block already exists at this position,
 *   and is not a "Container" block.
 *   * IINKErrorRuntime when empty space around position is too small
 *   for a new block.
 *   * IINKErrorRuntime when an I/O operation fails.
 *
 * @return the "Drawing" block associated with the newly added image on success,
 *   otherwise `nil`.
 */
- (nullable IINKContentBlock *)addImage:(CGPoint)position
                                   file:(nonnull NSString *)file
                               mimeType:(IINKMimeType)mimeType
                              error:(NSError * _Nullable * _Nullable)error;

/**
 * Removes a block from the part.
 * @note the root block cannot be removed.
 *
 * @param block the block to remove.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 * @return `YES` on succerss, otherwise `NO`.
 */
- (BOOL)removeBlock:(nonnull IINKContentBlock *)block
          error:(NSError * _Nullable * _Nullable)error;

/**
 * Return the block at the given position, or `nil` if there is no block
 * at that position.
 *
 * @param position the hit position coordinates.
 *
 * @return the block below hit position, or `nil` if no block was found.
 */
- (nullable IINKContentBlock *)hitBlock:(CGPoint)position;


//==============================================================================
#pragma mark - Convert & Import/Export
//==============================================================================

/**
 * Returns the supported target conversion states for the specified content.
 *
 * @param block the block for which the supported target conversion states are
 *   requested, `nil` means full part.
 *
 * @return an array of the supported target conversion states.
 */
- (nonnull NSArray<IINKConversionStateValue *> *)getSupportedTargetConversionState:(nullable IINKContentBlock *)block;

/**
 * Converts the specified content to digital form.
 *
 * @param block the block to convert, `nil` means convert full
 *   part.
 * @param targetState the target conversion state for the block.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorInvalidArgument when the target conversion state is not
 *   reachable from the current state of the specified block.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)convert:(nullable IINKContentBlock *)block
      targetState:(IINKConversionState)targetState
      error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the supported export formats for specified content.
 *
 * @param block the block to request, `nil` means full part.
 * @return an array of the supported mime types.
 */
- (nonnull NSArray<IINKMimeTypeValue *> *)getSupportedExportMimeTypes:(nullable IINKContentBlock *)block;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param mimeType the mime type that specifies the output format.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when the specified mime type is not supported.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 * @return the exported content on success, otherwise `nil`.
 */
- (nullable NSString *)export_:(nullable IINKContentBlock *)block
                      mimeType:(IINKMimeType)mimeType
                     error:(NSError * _Nullable * _Nullable)error;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param file the file to export to.
 * @param imageDrawer an image drawer that is required for some output
 *  formats. If you know that the specified output format does not require it you
 *  can leave it null.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when imageDrawer does not create the expected file.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 *   * IINKErrorInvalidArgument when `outputFile` is invalid.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)export_:(nullable IINKContentBlock *)block
         toFile:(nonnull NSString *)file
    imageDrawer:(nullable id<IINKIImageDrawer>)imageDrawer
      error:(NSError * _Nullable * _Nullable)error;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param file the file to export to.
 * @param mimeType the mime type that specifies the output format.
 * @param imageDrawer an image drawer that is required for some output
 *  formats. If you know that the specified output format does not require it you
 *  can leave it null.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when the specified mime type is not supported.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when imageDrawer does not create the expected file.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 *   * IINKErrorInvalidArgument when `outputFile` is invalid.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)export_:(nullable IINKContentBlock *)block
         toFile:(nonnull NSString *)file
       mimeType:(IINKMimeType)mimeType
    imageDrawer:(nullable id<IINKIImageDrawer>)imageDrawer
          error:(NSError * _Nullable * _Nullable)error;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param mimeType the mime type that specifies the output format.
 * @param overrideConfiguration the extra configuration used when exporting.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when the specified mime type is not supported.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 *   * IINKErrorInvalidArgument when there is nothing to export.
 *   * IINKErrorInvalidArgument when `overrideConfiguration` is invalid.
 * @return the exported content on success, otherwise `nil`.
 *
 * @since 1.2
 */
- (nullable NSString *)export_:(nullable IINKContentBlock *)block
                      mimeType:(IINKMimeType)mimeType
         overrideConfiguration:(nonnull IINKParameterSet *)overrideConfiguration
                         error:(NSError * _Nullable * _Nullable)error;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param file the file to export to.
 * @param imageDrawer an image drawer that is required for some output
 *  formats. If you know that the specified output format does not require it you
 *  can leave it null.
 * @param overrideConfiguration the extra configuration used when exporting.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when imageDrawer does not create the expected file.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 *   * IINKErrorInvalidArgument when there is nothing to export.
 *   * IINKErrorInvalidArgument when `outputFile` is invalid.
 *   * IINKErrorInvalidArgument when `overrideConfiguration` is invalid.
 * @return `YES` on success, otherwise `NO`.
 *
 * @since 1.2
 */
- (BOOL)export_:(nullable IINKContentBlock *)block
         toFile:(nonnull NSString *)file
    imageDrawer:(nullable id<IINKIImageDrawer>)imageDrawer
overrideConfiguration:(nonnull IINKParameterSet *)overrideConfiguration
          error:(NSError * _Nullable * _Nullable)error;

/**
 * Exports the specified content.
 *
 * @note the method is named `export_` because the C++ standard defines
 * `export` as a keyword.
 *
 * @param block the block to export, `nil` means export full part.
 * @param file the file to export to.
 * @param mimeType the mime type that specifies the output format.
 * @param imageDrawer an image drawer that is required for some output
 *  formats. If you know that the specified output format does not require it you
 *  can leave it null.
 * @param overrideConfiguration the extra configuration used when exporting.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when the specified mime type is not supported.
 *   * IINKErrorRuntime when an I/O operation fails.
 *   * IINKErrorRuntime when imageDrawer does not create the expected file.
 *   * IINKErrorRuntime when there are some ongoing operations on the part
 *   that prevent export, see `idle`.
 *   * IINKErrorInvalidArgument when there is nothing to export.
 *   * IINKErrorInvalidArgument when `outputFile` is invalid.
 *   * IINKErrorInvalidArgument when `overrideConfiguration` is invalid.
 * @return `YES` on success, otherwise `NO`.
 *
 * @since 1.2
 */
- (BOOL)export_:(nullable IINKContentBlock *)block
         toFile:(nonnull NSString *)file
       mimeType:(IINKMimeType)mimeType
    imageDrawer:(nullable id<IINKIImageDrawer>)imageDrawer
overrideConfiguration:(nonnull IINKParameterSet *)overrideConfiguration
          error:(NSError * _Nullable * _Nullable)error;

/**
 * Returns the supported import formats for specified content.
 *
 * @param block the block to request, `nil` means full part.
 * @return an array of the supported mime types.
 */
- (nonnull NSArray<IINKMimeTypeValue *> *)getSupportedImportMimeTypes:(nullable IINKContentBlock *)block;

/**
 * Imports data into the part, or a block.
 *
 * @param mimeType the mime type that specifies the format of `data`.
 * @param data the data to import.
 * @param block the target block, or `nil` to let editor detect the target.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when the specified mime type is not supported.
 *   * IINKErrorRuntime when `data` could not be imported.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)import_:(IINKMimeType)mimeType
           data:(nonnull NSString *)data
          block:(nullable IINKContentBlock *)block
      error:(NSError * _Nullable * _Nullable)error;


//==============================================================================
#pragma mark - Copy-Paste
//==============================================================================

/**
 * Copies a block to the internal clipboard.
 *
 * @param block the block to copy, `nil` means full part.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when block cannot be copied.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)copy:(nonnull IINKContentBlock *)block
   error:(NSError * _Nullable * _Nullable)error;

/**
 * Pastes the content of the internal clipboard at a given position.
 * Internal clipboard is filled by calling `copy()`. If internal clipboard is
 * empty, this does nothing.
 *
 * @note following limitation applies: the part managed by this editor must
 *   be a "Text Document" and clipboard must contain a single block, that is
 *   not a "Container", from a "Text Document".
 *
 * @param position the target pasted block coordinates.
 * @param error the recipient for the error description object
 *   * IINKErrorRuntime when editor is not associated with a part.
 *   * IINKErrorRuntime when content of the clipboard cannot be pasted on
 *   the part.
 * @return `YES` on success, otherwise `NO`.
 */
- (BOOL)paste:(CGPoint)position
    error:(NSError * _Nullable * _Nullable)error;


//==============================================================================
#pragma mark - Concurrency
//==============================================================================

/**
 * Whether part modification operations are over.
 */
@property (nonatomic, readonly) BOOL idle;

/**
 * Waits until part modification operations are over.
 */
- (void)waitForIdle;


//==============================================================================
#pragma mark - Font Layouting
//==============================================================================

/**
 * Sets a font metrics provider to this editor.
 *
 * @param fontMetricsProvider a `IINKIFontMetricsProvider`.
 */
- (void)setFontMetricsProvider:(nonnull id<IINKIFontMetricsProvider>)fontMetricsProvider;

@end
