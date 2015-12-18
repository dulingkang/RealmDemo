
//
//  MaterialManager.swift
//  XiaoKa
//
//  Created by ShawnDu on 15/12/16.
//  Copyright © 2015年 SmarterEye. All rights reserved.
//

import Foundation

struct MaterialManager {
    
    let localMaterial: [(MaterialCategory, String, String)] = [
        (.Star, "starThumb0", "starBig0"),
        (.Old, "oldThumb0", "oldBig0"),
        (.Fun, "funThumb0", "funBig0"),
        (.Fat, "fatThumb0", "fatBig0"),
        (.Movies, "moviesThumb0", "moviesBig0"),
        (.Sports, "sportsThumb0", "sportsBig0")
    ]
    
    init() {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        for one in localMaterial {
            let oneItem = OneItem.init(category: one.0.rawValue, thumb: one.1, big: one.2)
            let oneCategory = OneCategory.init(category: one.0.rawValue, item: oneItem)
            realm.addObject(oneItem)
            realm.addObject(oneCategory)
        }
       try! realm.commitWriteTransaction()
    }
}