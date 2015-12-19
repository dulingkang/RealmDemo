//
//  ViewController.swift
//  RealmDemo
//
//  Created by dulingkang on 15/12/18.
//  Copyright © 2015年 dulingkang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSTemporaryDirectory())
        let fullPath = NSTemporaryDirectory() + "/" + "Material.plist"
        if !NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
            NSFileManager.defaultManager().createFileAtPath(fullPath, contents: nil, attributes: nil)
        }
//        let array = FaceData.sourceLandmark
//        let dict = NSDictionary.init(object: array, forKey: sourceLandmarkKey)
        let dict = NSDictionary(contentsOfFile: fullPath)
        dict?.setValue(30, forKey: "myTest")
        dict?.writeToFile(fullPath, atomically: true)
        
        

//        let mater = MaterialManager.init()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

