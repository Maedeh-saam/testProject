//
//  FirstViewController.swift
//  Test Project
//
//  Created by maedeh on 5/10/1399 AP.
//  Copyright © 1399 maedeh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.delegate = self;
    }

    //MARK: enterAction
    @IBAction func enter(_ sender: UIButton) {
        
        if(userName.text != nil){
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil);
            let vc = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController;
            vc.userNamePassed = self.userName.text!;
            self.present(vc, animated: true, completion: nil);
        } else {
            print("Please Enter Username!")
        }
        
    }
    
}

