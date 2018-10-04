//
//  File.swift
//  formLogin
//
//  Created by Trần Tiến Anh on 10/2/18.
//  Copyright © 2018 iAnh. All rights reserved.
//

import UIKit
func autolayoutTF(title:String )->UITextField {
    let _TFUsername = UITextField()
    _TFUsername.translatesAutoresizingMaskIntoConstraints = false
    _TFUsername.placeholder = title
    _TFUsername.clearsOnBeginEditing = true
    _TFUsername.enablesReturnKeyAutomatically = true
   // _TFUsername.isSecureTextEntry = true
    _TFUsername.keyboardAppearance = .dark
    _TFUsername.layer.cornerRadius = 0.5
    _TFUsername.tintColor = UIColor.white
    return _TFUsername
}
