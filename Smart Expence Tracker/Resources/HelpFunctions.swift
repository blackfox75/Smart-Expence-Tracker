//
//  HelpFunctions.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/6/20.
//

import Foundation
import UIKit

extension UIViewController {
    public static func getfromStoryBoard(withId id: String) -> UIViewController {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: id)
        return vc
    }
}
