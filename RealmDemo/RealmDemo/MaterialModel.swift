//
//  MaterialModel.swift
//  XiaoKa
//
//  Created by ShawnDu on 15/12/16.
//  Copyright © 2015年 SmarterEye. All rights reserved.
//

import Foundation

enum MaterialCategory: String {
    case Star = "明星", Old = "古装", Fun = "搞怪", Fat = "三胖", Movies = "影视", Sports = "体育"
}

class OneItem: RLMObject {
    var category: MaterialCategory!
    var thumbnailUrl: String?
    var bigPicUrl: String?
    var isLocal = false
    var landmark: [Float] = []
    
    init(category: MaterialCategory, thumb: String, big: String) {
        super.init()
        self.thumbnailUrl = thumb
        self.bigPicUrl = big
    }
}


class OneCategory: RLMObject {
    var category: MaterialCategory!
    var thumbnailUrl: String?
    var bigPicUrl: String?
    
    init(category: MaterialCategory, item: OneItem) {
        super.init()
        self.category = category
        self.thumbnailUrl = item.thumbnailUrl
        self.bigPicUrl = item.bigPicUrl
    }
}

struct AllCategory {
    var categorys: [OneCategory] = []
}

