//
//  ReusableIdentifierHelper.swift
//  GithubApp
//
//  Created by user124076 on 08.01.17.
//  Copyright © 2017 user124076. All rights reserved.
//

import UIKit

public protocol ReuseIdentifierProtocol:class{
    //getIdentifierFromClass
    static var defaultReuseIdentifier: String { get }
}

extension UITableViewCell : ReuseIdentifierProtocol{
    public static var defaultReuseIdentifier:String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
/*
 public extension ReuseIdentifierProtocol where Self: UIView{
 static var a:String {
 return NSStringFromClass(self).components(separatedBy: ".").last!
 }
 }*/
