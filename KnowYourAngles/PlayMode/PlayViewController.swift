//
//  PlayViewController.swift
//  KnowYourAngles
//
//  Created by Erin Nagoshi on 7/23/21.
//  Copyright © 2021 Iolani School. All rights reserved.
//

import SwiftUI
import UIKit

struct PlayViewController: UIViewControllerRepresentable {
    
    @EnvironmentObject var playViewDelegate : AppDelegate
    typealias UIViewControllerType = UIPlayViewController
    var editorViewController = EditorViewController()
    
    func makeUIViewController(context: Context) -> UIPlayViewController {
        let playViewController = UIPlayViewController()
        
        playViewController.addChild(editorViewController)
        playViewController.view.addSubview(editorViewController.view)
        editorViewController.view.frame = playViewController.view.bounds
        editorViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        editorViewController.didMove(toParent: playViewController)
        
        if (playViewDelegate.engine == nil)
        {
            let alert = UIAlertController(title: "Certificate error",
                                          message: playViewDelegate.engineErrorMessage,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertAction.Style.default,
                                          handler: {(action: UIAlertAction) -> Void in
                                            exit(1)
                                          }))
            playViewController.present(alert, animated: true, completion: nil)
        }
        editorViewController.engine = playViewDelegate.engine
        
        editorViewController.inputMode = .forcePen  // We want the Pen mode for this GetStarted sample code. It lets the user use either its mouse or fingers to draw.
        // If you have got an iPad Pro with an Apple Pencil, please set this value to InputModeAuto for a better experience.
        
        func createPackage(packageName: String) throws -> IINKContentPackage? {
            // Create a new content package with name
            var resultPackage: IINKContentPackage?
            let fullPath = FileManager.default.pathForFile(inDocumentDirectory: packageName) + ".iink"
            if let engine = playViewDelegate.engine {
                resultPackage = try engine.createPackage(fullPath.decomposedStringWithCanonicalMapping)
                
                // Add a blank page type Math
                if let part = try resultPackage?.createPart("Math") /* Options are : "Diagram", "Drawing", "Math", "Text Document", "Text" */ {
                    playViewController.title = "Type: " + part.type
                }
            }
            return resultPackage
        }
        
        do {
            if let package = try createPackage(packageName: "New") {
                try editorViewController.editor.part = package.getPartAt(0)
            }
        } catch {
            print("Error while creating package : " + error.localizedDescription)
        }

        return playViewController
    }
    
    func updateUIViewController(_ uiViewController: UIPlayViewController, context: Context) {
        print("updateUIViewController: ")
    }
}
