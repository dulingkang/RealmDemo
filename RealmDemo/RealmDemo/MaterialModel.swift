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
    dynamic var category: String?
    dynamic var thumbnailUrl: String?
    dynamic var bigPicUrl: String?
    dynamic var isLocal = false
    
    override init() {
        super.init()
    }
    convenience init(category: String, thumb: String, big: String) {
        self.init()
        self.category = category
        self.thumbnailUrl = thumb
        self.bigPicUrl = big
    }
}


class OneCategory: RLMObject {
    var category: String!
    dynamic var thumbnailUrl: String?
    dynamic var bigPicUrl: String?
    
    override init() {
        super.init()
    }
    
    convenience init(category: String, item: OneItem) {
        self.init()
        self.category = category
        self.thumbnailUrl = item.thumbnailUrl
        self.bigPicUrl = item.bigPicUrl
    }
}

struct AllCategory {
    var categorys: [OneCategory] = []
}

