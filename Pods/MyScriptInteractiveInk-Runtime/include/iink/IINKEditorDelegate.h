// Copyright @ MyScript. All rights reserved.

#import <Foundation/Foundation.h>


@class IINKEditor;

/**
 * The delegate interface for receiving editor events.
 *
 * @see IINKEditor
 */
@protocol IINKEditorDelegate <NSObject>

@required

//==============================================================================
#pragma mark - Required Methods
//==============================================================================

/**
 * Invoked when the part associated with the listened editor has changed.
 *
 * @param editor the editor.
 * @see IINKEditor#setPart:(IINKContentPart)
 */
- (void)partChanged:(nonnull IINKEditor*)editor;

/**
 * Invoked when the content has changed.
 *
 * @param editor the editor.
 * @param blockIds an array of block ids that have changed.
 */
- (void)contentChanged:(nonnull IINKEditor*)editor blockIds:(nonnull NSArray<NSString *> *)blockIds;

/**
 * Invoked when an error has occurred.
 *
 * @param editor the editor.
 * @param blockId the block id on which this error has occurred.
 * @param message the error message.
 */
- (void)onError:(nonnull IINKEditor*)editor
        blockId:(nonnull NSString*)blockId
        message:(nonnull NSString*)message;

@optional

//==============================================================================
#pragma mark - Optional Methods
//==============================================================================

/**
 * Invoked when the selection has changed.
 *
 * @param editor the editor.
 * @param blockIds a vector of block ids that have been selected.
 */
- (void)selectionChanged:(nonnull IINKEditor *)editor blockIds:(nonnull NSArray<NSString *> *)blockIds;

/**
 * Invoked when the active block has changed.
 * The active block is usually the last modified text block.
 *
 * @param editor the editor.
 * @param blockId the identifier of the active block.
 */
- (void)activeBlockChanged:(nonnull IINKEditor *)editor blockId:(nonnull NSString *)blockId;

@end
