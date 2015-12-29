//
//  MaterialModel.swift
//  XiaoKa
//
//  Created by ShawnDu on 15/12/16.
//  Copyright © 2015年 SmarterEye. All rights reserved.
//

import Foundation

class OneItem: RLMObject {
    var id: String?
    dynamic var category: String?
    dynamic var thumbnailUrl: String?
    dynamic var bigPicUrl: String?
    
    override init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }

    
    convenience init(id: String, category: String, thumb: String, big: String) {
        self.init()
        self.id = id
        self.category = category
        self.thumbnailUrl = thumb
        self.bigPicUrl = big
    }
}


class OneCategory: RLMObject {
    dynamic var category: String?
    dynamic var thumbnailUrl: String?
    
    override init() {
        super.init()
    }
    
    override static func primaryKey() -> String? {
        return "category"
    }
    
    convenience init(category: String, thumb: String) {
        self.init()
        self.category = category
        self.thumbnailUrl = thumb
    }
}


