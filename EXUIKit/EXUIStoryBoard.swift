//
//  EXUIStoryBoard.swift
//  ReuseCode
//
//  Created by huanghe on 10/17/16.
//  Copyright © 2016 HH. All rights reserved.
//

import UIKit


extension UIStoryboard {
    
    /// EZSE: Get the application's main storyboard
    /// Usage: let storyboard = UIStoryboard.mainStoryboard
    public static var mainStoryboard: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return nil
        }
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    /// EZSE: Get view controller from storyboard by its class type
    /// Usage: let profileVC = storyboard!.instantiateVC(ProfileViewController) /* profileVC is of type ProfileViewController */
    /// Warning: identifier should match storyboard ID in storyboard of identifier class
    public func instantiateVC<T>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)
        if let vc = instantiateViewController(withIdentifier: storyboardID) as? T {
            return vc
        } else {
            return nil
        }
    }
    
    public static func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
}

public extension UIStoryboard {
    enum Storyboard : String {
        case Main
        case News
        case Gallery
    }
}

//protocol StoryboardIdentifiable {
//    static var storyboardIdentifier: String { get }
//}
//
//extension StoryboardIdentifiable where Self: UIViewController {
//    static var storyboardIdentifier: String {
//        return String(describing: self)
//    }
//}
//
//extension UIViewController : StoryboardIdentifiable { }
