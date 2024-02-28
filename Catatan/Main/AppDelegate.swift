//
//  AppDelegate.swift
//  Catatan
//
//  Created by apple on 2024/2/26.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = FristViewController()
        keyboardManager()
        noti()
        window?.makeKeyAndVisible()
        return true
    }
    
    func keyboardManager(){
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
    }
    
    func noti(){
        CNotificationCenter.addObserver(self, selector: #selector(setUpRootVc), name: NSNotification.Name(SET_ROOTVC), object: nil)
    }
    
    @objc func setUpRootVc(){
        windowAnimation()
        window?.rootViewController = TabBarViewController()
    }
    
    func windowAnimation() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        self.window?.layer.add(transition, forKey: "animation")
    }
    
    func getFontNames() {
        let familyNames = UIFont.familyNames
        for familyName in familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in fontNames {
                print("--------\tfontName-------- = \(fontName)")
            }
        }
    }
}


