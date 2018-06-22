//
//  MAWMathView.h
//  MathWidget
//
//  Copyright © 2016 MyScript. All rights reserved.
//

#import "MAWSymbol.h"
#import "MAWDefines.h"
#import <UIKit/UIKit.h>

@interface MAWCaptureInfo : NSObject

@property (nonatomic, assign) float x;
@property (nonatomic, assign) float y;
@property (nonatomic, assign) float f;
@property (nonatomic, assign) float w;
@property (nonatomic, assign) int64_t t;

@end

@class MAWMathView;

/**
 * The MAWMathViewDelegate protocol defines the methods you can implement to be notified of
 * the activity of a MAWMathView object.
 * These methods allow to monitor events such as configuration, recognition or a change in the Undo
 * Redo stack.
 *
 * All of the methods in this protocol are optional.
 **/
@protocol MAWMathViewDelegate <NSObject>

@optional

#pragma mark - Configuration

/** @name Monitoring Configuration */

/**
 * Tells the delegate that the Math Widget has started its configuration.
 * @param mathView The math view that has started its configuration.
 */
- (void)mathViewDidBeginConfiguration:(MAWMathView *)mathView;

/**
 * Tells the delegate that the Math Widget has ended its configuration with success.
 * @param mathView The math view that has ended its configuration.
 */
- (void)mathViewDidEndConfiguration:(MAWMathView *)mathView;

/**
 * Tells the delegate that the Math Widget has failed its configuration.
 * @param mathView The math view that has failed its configuration.
 * @param error              An NSError object that encapsulates information why configuration
 *                           failed.
 */
- (void)mathView:(MAWMathView *)mathView didFailConfigurationWithError:(NSError *)error;

#pragma mark - Recognition

/** @name Monitoring Recognition Progress */

/**
 * Tells the delegate that the Math Widget has begun a recognition session.
 * @param mathView The math view that has begun a recognition process.
 * @discussion A recognition session starts when the user starts writing on the screen.
 *             The session can also start after an undo or redo or a after any context restoration
 *             such as screen rotation.
 */
- (void)mathViewDidBeginRecognition:(MAWMathView *)mathView;

/**
 * Tells the delegate that the Math Widget has ended a recognition process.
 * @param mathView The math view that has ended a recognition process.
 */
- (void)mathViewDidEndRecognition:(MAWMathView *)mathView;

#pragma mark - Undo Redo

/** @name Monitoring Changes in Undo Redo Stack */

/**
 * Tells the delegate that the Math Widget Undo/Redo stack has changed.
 * @param mathView The math view whose Undo/Redo stack has changed.
 */
- (void)mathViewDidChangeUndoRedoState:(MAWMathView *)mathView;

#pragma mark - Gesture

/** @name Handling Gestures */

/**
 * Tells the delegate that the Math Widget has detected an erase gesture.
 * @param mathView The math view that has detected an erase gesture.
 * @param partial            `YES` if the all the equation was deleted; otherwise, `NO`.
 */
- (void)mathView:(MAWMathView *)mathView didPerformEraseGesture:(BOOL)partial;

#pragma mark - Solver

/** @name Monitoring Solver Changes */

/**
 * Tells the delegate that the Math Widget has started or has stopped using an angle unit.
 * @param mathView The math view that has started or has stopped using
 *                           an angle unit.
 * @param used               `YES` if the current operation is using an angle unit; otherwise, `NO`.
 */
- (void)mathView:(MAWMathView *)mathView didChangeUsingAngleUnit:(BOOL)used;

#pragma mark - Writing

/** @name Monitoring User Input */

/**
 * Tells the delegate that math user has started touching the screen.
 * @param mathView The math view receiving touches.
 * @param captureInfo Coordinates and other information about touch sample.
 */
- (void)mathView:(MAWMathView*)mathView didPenDownWithCaptureInfo:(MAWCaptureInfo*)captureInfo;

/**
 * Tells the delegate that math user continue to touch the screen.
 * @param mathView The math view receiving touches.
 * @param captureInfo Coordinates and other information about touch sample.
 */
- (void)mathView:(MAWMathView*)mathView didPenMoveWithCaptureInfo:(MAWCaptureInfo*)captureInfo;

/**
 * Tells the delegate that math user has ending touching the screen.
 * @param mathView The math view receiving touches.
 * @param captureInfo Coordinates and other information about touch sample.
 */
- (void)mathView:(MAWMathView*)mathView didPenUpWithCaptureInfo:(MAWCaptureInfo*)captureInfo;

/**
 * Tells the delegate that the user has aborted touching the screen.
 * @param mathView The math view that has stopped receiving touches.
 */
- (void)mathViewDidPenAbort:(MAWMathView *)mathView;

@end

/**
 * The `MAWMathView` is the entry point of the Math Widget.
 */
@interface MAWMathView : UIView

#pragma mark - Certificate Configuration

/** @name Register the certificate */

/**
 * Register MyScript engine certificate.
 *
 *  @param certificate The data object containing the certificate.
 *
 *  @return `YES` on success, `NO` on failure.
 */
- (BOOL)registerCertificate:(NSData *)certificate;

#pragma mark - Engine Configuration

/** @name Configuring the Engine */

/** Add given directory to handwriting resources search path.
 * Directory name can point to a folder in the file system, or to a
 * directory in a zip file.
 *
 * @param directoryName Path to a folder containing handwriting resources.
 */
- (void)addSearchDir:(NSString *)directoryName;

/**
 *  Clear handwriting resources search path.
 */
- (void)clearSearchPath;

/** Configure handwriting recognition engine.
 * This method is non-blocking and returns immediately.
 *
 * Configuration is a lengthy process that may take up to several
 * seconds, depending on the handwriting resources to be configured.
 * It is recommended to setup a configuration listener to detect the end
 * of the configuration process.
 *
 *  @param bundleName Name of the configuration bundle (for example, "math").
 *  @param configName Name of the configuration mode (for example, "standard").
 */
- (void)configureWithBundle:(NSString *)bundleName andConfig:(NSString *)configName;

#pragma mark - Delegate

/** @name Getting and Setting the Delegate */

/**
 * The receiver’s delegate or nil if it doesn’t have a delegate.
 * @discussion See MAWMathViewDelegate for the methods this delegate can implement.
 */
@property (weak, nonatomic) id <MAWMathViewDelegate> delegate;

#pragma mark - Undo Redo

/** @name Managing Undo/Redo */

/**
 * Returns a Boolean value that indicates whether the Math Widget has any actions to undo.
 * @return `YES` if the Math Widget has any actions to undo, otherwise `NO`.
 */
- (BOOL)canUndo;

/**
 * Returns a Boolean value that indicates whether the Math Widget has any actions to redo.
 * @return `YES` if the Math Widget has any actions to redo, otherwise `NO`.
 */
- (BOOL)canRedo;

/**
 * Performs one undo step.
 * @discussion The behavior depends of the MAWBeautifyOption value and if the user write 
 *             into a single shot (only one mathViewDidEndWriting: call) or severals.
 */
- (void)undo;

/**
 * Performs one redo step.
 */
- (void)redo;

#pragma mark - Items management

/** @name Managing items */

/**
 *  Simulate a pen down event. This simulates a user that starts writing.
 *
 *  @param captureInfo Capture information.
 */
- (void)penDown:(MAWCaptureInfo*)captureInfo;

/**
 *  Simulate a pen move event. This simulates a user writing.
 *
 *  @param captureInfo Capture information.
 */
- (void)penMove:(MAWCaptureInfo*)captureInfo;

/**
 *  Simulate a pen up event. This simulates a user that ends writing.
 *
 *  @param captureInfo Capture information.
 */
- (void)penUp:(MAWCaptureInfo*)captureInfo;

/**
 *  Simulate a pen abort event. This simulates a user writing.
 */
- (void)penAbort;

/**
 * Adds a stroke to the MyScript document model.
 * @param points an NSArray of MAWCaptureInfo constituting the path of the stroke.
 */
- (void)addStroke:(NSArray<MAWCaptureInfo*>*)points;

/**
 * Clears the ink and the text.
 * @param allowUndo YES to allow the undo, NO otherwise.
 */
- (void)clear:(BOOL)allowUndo;

/**
 * Returns a Boolean value that indicates whether the Math Widget contains items (ink or text).
 * @return `YES` if the Math Widget does not contain any items, otherwise `NO`.
 */
@property (assign, nonatomic, readonly) BOOL isEmpty;

#pragma mark - Solver Configuration

/** @name Configuring the Solver */

/**
 * Angle unit to be used in calculations.
 * @discussion  The default value of this property is `MAWAngleUnitDegree`.
 */
@property (assign, nonatomic) MAWAngleUnit angleUnit;

/**
 * Number of decimals displayed in the result.
 * @discussion Value must be between `0` and `6`.
 *
 *             The default value of this property is `3`.
 */
@property (assign, nonatomic) NSInteger decimalsCount;

/**
 * Enable or disable solving and/or beautification of written equation.
 * @discussion The default value of this property is `MAWBeautifyFontifyAndSolve`. It replaces the
 *             previous settings `solverEnabled` (`solverEnabled = NO` => `MAWBeautifyFontify` and
 *             `solverEnabled = YES` => `MAWBeautifyFontifyAndSolve`).
*/
@property (assign, nonatomic) MAWBeautifyOption beautificationOption;

/**
* Rounding mode used by the solver.
* @discussion The default value of this property is `MAWRoundingModeTruncation`.
*/
@property (assign, nonatomic) MAWRoundingMode roundingMode;

#pragma mark - Appearance

/** @name Customizing Appearance */

/**
 * Background view of the writing area.
 * @discussion The view is automatically resized to match the size of the Math Widget View.
 *
 * The default background view is a `UIImageView` displaying a graph paper pattern. You can set this
 * property to `nil` to remove the background.
 */
@property (strong, nonatomic) UIView *backgroundView;

/**
 * Color of the baseline.
 * @discussion The default value of this property is `[UIColor lightGrayColor]`.
 */
@property (strong, nonatomic) UIColor *baselineColor;

/**
 * Dash pattern of the baseline.
 * @discussion The dash pattern is specified as an array of NSNumber objects that specify the
 *             lengths of the painted segments and unpainted segments, respectively, of the dash
 *             pattern.
 *
 *             The default value for of this property is `@[@8, @8]`.
 *             The value should not be null neithe empty.
 *
 *              For example, passing an array with the values
 *              [2,3] sets a dash pattern that alternates 
 *              between a 2-user-space-unit-long painted
 *              segment and a 3-user-space-unit-long unpainted segment. 
 *              Passing the values [1,3,4,2] sets the pattern to a 1-unit 
 *              painted segment, a 3-unit unpainted segment, a 4-unit painted 
 *              segment, and a 2-unit unpainted segment.
 */
@property (strong, nonatomic) NSArray *baselinePattern;

/**
 * Dash phase of the baseline.
 * @discussion A value that specifies how far into the dash pattern the line starts, in points.
 *
 *             The default value for of this property is `0`.
 */
@property (assign, nonatomic) CGFloat baselinePhase;

/**
 * Thickness of the baseline in points.
 * @discussion The default value of this property is `1`.
 *             The min value is `1` and the max value is `10`.
 */
@property (assign, nonatomic) CGFloat baselineThickness;

/**
 * Color of the ink.
 * @discussion The default value of this property is `[UIColor colorWithRed:75/255.0 green:87/255.0
 *             blue:117/255.0 alpha:1]`.
 */
@property (strong, nonatomic) UIColor *inkColor;

/**
 * Thickness of the ink.
 * @discussion This is the maximum thickness of the ink. Real thickness vary slightly to simulate
 *             pressure.
 *
 *             The default value of this property is `1.5`.
 *             The min value is `1` and the max value is `10`.
 */
@property (assign, nonatomic) CGFloat inkThickness;

/**
 * Color of the text.
 * @discussion The default value of this property is `[UIColor colorWithRed:75/255.0 green:87/255.0
 *             blue:117/255.0 alpha:1]`.
 */
@property (strong, nonatomic) UIColor *textColor;

/**
 * Color of the text added by the solver.
 * @discussion The default value of this property is `[UIColor lightGrayColor]`.
 */
@property (strong, nonatomic) UIColor *transientTextColor;

/**
 * Equation text font.
 * @discussion The default font used by the Math Widget is `STIXGeneral.ttf`, embedded in
 *             MathWidget.bundle. If the bundle cannot be loaded, the default system font is used.
 *             The font size does not matter since the text is dynamically determined by the Math
 *             Widget.
 */
@property (strong, nonatomic) UIFont *font;

#pragma mark - Padding

/** @name Customizing Padding */

/**
 * Top, left, bottom and right padding of the writing area, used when doing equation layout.
 * @discussion The user can write within the margins but no character will be displayed there.
 *             The values of the margins must be in the range 0.0 to 1.0.
 *             0.0 means no margins. 1.0 means that the margin will take a quarter of the widget
 *             width/height.
 *             It replaces the previous `writeAreaHorizontalMargin` and
 *             `writeAreaVerticalMargin` APIs.
 */
@property (assign, nonatomic) UIEdgeInsets paddingRatio;


#pragma mark - Input

/** @name Importing Equations */

/**
 * Append a calculation symbol to the current recognition result.
 * @param symbol The symbol to add.
 * @param allowUndo Indicates whether the undo redo stack must be updated with additions.
 */
- (void)addSymbol:(MAWSymbol *)symbol allowUndo:(BOOL)allowUndo;

/**
 * Append a calculation symbol list to the current recognition result.
 * @param symbols An array of symbols to add.
 * @param allowUndo Indicates whether the undo redo stack must be updated with additions.
 */
- (void)addSymbols:(NSArray *)symbols allowUndo:(BOOL)allowUndo;

#pragma mark - Output

/** @name Exporting Equations */

/**
 * Get the equation as an image.
 * @return A UIImage similar to what is is displayed by the Math Widget.
 */
- (UIImage *)resultAsImage;

/**
 * Get the equation as a LaTeX text string.
 * @return A NSString representing the LaTeX equation.
 */
- (NSString *)resultAsLaTeX;

/**
 * Get the equation as a MathML text string.
 * @return A NSString representing the MathML equation.
 */
- (NSString *)resultAsMathML;

/**
 * Get the equation as a text string.
 * @return A NSString representing the equation, using the Math Widget string format.
 */
- (NSString *)resultAsText;

/**
 * Get the equation as a symbol list.
 * @return A NSArray of MAWSymbol.
 */
- (NSArray *)resultAsSymbolList;

#pragma mark - Palm rejection

/** @name Ignoring Unwanted Touches */

/**
 * A Boolean value that determines whether the Math Widget should ignore unwanted touches caused by
 * the user palm.
 *
 * @discussion The default value of this property is `YES`.
 */
@property (assign, nonatomic) BOOL palmRejectionEnabled;

/**
 * A Boolean value that determines whether the Palm Rejection should be configured for left handed
 * users.
 *
 * @discussion The default value of this property is `NO`.
 */
@property (assign, nonatomic) BOOL palmRejectionLeftHanded;

#pragma mark - Solver

/**
 * Perform on demand solving.
 * Becomes relevant when the `beautificationOption` is either `MAWBeautifyDisabled` or
 * `MAWBeautifyFontify`.
 */
- (void)solve;

/**
 * Returns a Boolean value that indicates whether the recognition engine is currently busy.
 * @return `YES` if the recognition engine is currently busy, otherwise `NO`.
 */
@property (assign, nonatomic, readonly) BOOL isBusy;

#pragma mark - Serialization

/** @name Saving and Restoring recognitions results */

/**
 * Serialize the current input.
 * @discussion This method can be used to save an equation as binary data.
 * @return A data object containing the serialized equation.
 */
- (NSData *)serialize;

/**
 * Restore an input saved using the `serialize` method.
 * @param      data The data to unserialize, provided by `serialize`.
 * @return     `YES` if the data was properly unserialized, `NO` otherwise.
 * @discussion This method can be used to restore an equation from binary data.
 */
- (BOOL)unserialize:(NSData *)data;

#pragma mark - Gestures

/**
 *  Gestures that should be recognized. The default value of this property is `MAWGesturesDefault`,
 *  which means that both strike gesture and overwrite gesture are enabled.
 */
@property (assign, nonatomic) MAWGestures gesturesEnabled;

@end