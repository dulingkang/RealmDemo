
//
//  MaterialManager.swift
//  XiaoKa
//
//  Created by ShawnDu on 15/12/16.
//  Copyright © 2015年 SmarterEye. All rights reserved.
//

import Foundation

let kBaseUrlKey = "kMaterialBaseUrlKey"
let kPlistFolder = "materialPlistFolder"

enum MaterialKey: String {
    case baseUrl, swapFaceType, name, logoUrl, swapFaceResources, swapFaceChildren, type, bigPictureUrl, faces, facePosition
}

struct MaterialManager {
    static let materialUrl = "http://192.168.100.199/xiaoka/iOS/swapFaceResources/swapFaceType.json"
    
    static func requestMaterial() {
        SSNetworking.request(materialUrl, sessionConfig: .ephemeralSessionConfiguration()) { (data, response, error) -> Void in
            if data != nil {
                do {
                    let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                    if let dict = parsedObject as? NSDictionary {
                        self.parseMainDict(dict)
                        let jsonUrl = dict[MaterialKey.swapFaceResources.rawValue] as! String
                        let str = NSUserDefaults.standardUserDefaults().valueForKey(kBaseUrlKey) as! String
                        let oneCategoryJsonStr = str + jsonUrl
                        self.requestChildren(oneCategoryJsonStr)
                        
                    }
                } catch {}
            }
        }
    }
    
    static func requestChildren(urlStr: String) {
        SSNetworking.request(urlStr, sessionConfig: .ephemeralSessionConfiguration()) { (data, response, error) -> Void in
            if data != nil {
                do {
                    let parsedObject: AnyObject? = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
                    if let dict = parsedObject as? NSDictionary {
                        self.parseChildenDict(dict)
                    }
                } catch {}
            }
        }
    }
    
    static func parseMainDict(dict: NSDictionary) {
        let baseUrl = dict[MaterialKey.baseUrl.rawValue] as! String
        let str = NSUserDefaults.standardUserDefaults().valueForKey(kBaseUrlKey) as? String
        if str != baseUrl {
            NSUserDefaults.standardUserDefaults().setValue(baseUrl, forKey: kBaseUrlKey)
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        
        let categoryArray = dict[MaterialKey.swapFaceType.rawValue] as! NSArray
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()

        for one in categoryArray {
            let oneDict = one as! NSDictionary
            let category = oneDict[MaterialKey.name.rawValue] as! String
            let thumb =  oneDict[MaterialKey.logoUrl.rawValue] as! String
            let oneCategory = OneCategory.init(category: category, thumb: thumb)
            let predicate = NSPredicate(format: "category == %@", category)
            let findName = OneCategory.objectsWithPredicate(predicate)
            if findName.count == 0 {
                realm.addObject(oneCategory)
            }
        }
        try! realm.commitWriteTransaction()
    }
    
    static func parseChildenDict(dict: NSDictionary) {
        let allFaceChildren = dict[MaterialKey.swapFaceChildren.rawValue] as! NSArray
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        
        for one in allFaceChildren {
            if let oneDict = one as? NSDictionary {
                let type = oneDict[MaterialKey.type.rawValue] as! String
                let logoUrl = oneDict[MaterialKey.logoUrl.rawValue] as! String
                let bigUrl = oneDict[MaterialKey.bigPictureUrl.rawValue] as! String
                let faces = oneDict[MaterialKey.faces.rawValue] as! NSArray
                let landmarkDict = faces[0] as! NSDictionary
                let now = NSDate()
                let time = now.timeIntervalSince1970
                SSFileManager.createFolderInDocument(kPlistFolder)
                SSFileManager.createPlistFileInDocument(kPlistFolder, plistName: String(time), dict: landmarkDict)
                
                let oneItem = OneItem.init(id: String(time), category: type, thumb: logoUrl, big: bigUrl)
                
                let predicate = NSPredicate(format: "id == %@", String(time))
                let findName = OneItem.objectsWithPredicate(predicate)
                if findName.count == 0 {
                    realm.addObject(oneItem)
                }
            }
        }
        try! realm.commitWriteTransaction()
    }
}