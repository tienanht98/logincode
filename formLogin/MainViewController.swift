//
//  MainViewController.swift
//  formLogin
//
//  Created by Trần Tiến Anh on 10/1/18.
//  Copyright © 2018 iAnh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITextFieldDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor.gray
        TFUsername.delegate = self
        TFPass.delegate = self
        TFUsername.tag = 0
        TFPass.tag = 1
        TFUsername.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TFUsername)
        view.addConstraints(generateConstraintsTextFieldTop())
        TFPass.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(TFPass)
        view.addConstraints(generateConstraintsTextFieldPass())
        BTlogin.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(BTlogin)
        view.addConstraints(generateConstraintsButton())
        // Do any additional setup after loading the view.
    }
    let BTlogin:UIButton = {
        let bt = UIButton(type:UIButton.ButtonType.system)
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.setTitle("Login", for: UIControl.State.normal)
        bt.frame = CGRect(x: 200, y: 200, width: 30, height: 10)
        bt.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return bt
    }()
    @objc func buttonAction(sender: UIButton!) {
    print("Button tapped")
        let vc = TableView()
        self.present(vc, animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    let TFUsername:UITextField = {
        let tf = autolayoutTF(title: "enter username")
        tf.returnKeyType = .next
        tf.keyboardType = .emailAddress
        return tf
    }()
    let TFPass: UITextField = {
        let tf =  autolayoutTF(title: "enter password ")
        tf.isSecureTextEntry = true
        tf.tintColor = UIColor.white
        return tf
    }()
    private func generateConstraintsTextFieldTop() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: TFUsername,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view,
                                               attribute: .centerY,
                                               multiplier: 1.0,
                                               constant: -90)
        let constraintX = NSLayoutConstraint(item: TFUsername,
                                             attribute: .centerX,
                                             relatedBy: .equal,
                                             toItem: view,
                                             attribute: .centerX,
                                             multiplier: 1.0,
                                             constant: 0.0)
        let constraintWidth = NSLayoutConstraint(item: TFUsername,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1.0,
                                                 constant: 200.0)
        return [constraintTop,constraintX,constraintWidth]
    }
    private func generateConstraintsTextFieldPass() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: TFPass, attribute: .top, relatedBy: .equal, toItem: TFUsername, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintLeading = NSLayoutConstraint(item: TFPass, attribute: .leading, relatedBy: .equal, toItem: TFUsername, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let constraintTrailing = NSLayoutConstraint(item: TFPass, attribute: .trailing, relatedBy: .equal, toItem: TFUsername, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        return [constraintTop, constraintLeading, constraintTrailing]
    }
    private func generateConstraintsButton() -> [NSLayoutConstraint] {
        let constraintTop = NSLayoutConstraint(item: BTlogin, attribute: .top, relatedBy: .equal, toItem: TFPass, attribute: .bottom, multiplier: 1.0, constant: 8.0)
        let constraintX = NSLayoutConstraint(item: BTlogin, attribute: .centerX, relatedBy: .equal, toItem: TFUsername, attribute: .centerX, multiplier: 1.0, constant: 40)
        return [constraintTop, constraintX]
    }
}
