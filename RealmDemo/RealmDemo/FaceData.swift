//
//  FaceData.swift
//  RealmDemo
//
//  Created by dulingkang on 15/12/19.
//  Copyright © 2015年 dulingkang. All rights reserved.
//

import UIKit
import Foundation

let sourceLandmarkKey = "sourceLandmark"

struct FaceData {
    
    var outputLandmark: [Float] = []
    static var sourceLandmark: [String] {
        get {
            let array = [
                 "contour_chin", "contour_left1", "contour_left2", "contour_left3", "contour_left4", "contour_left5", "contour_left6", "contour_left7", "contour_left8", "contour_left9", "contour_right1", "contour_right2", "contour_right3", "contour_right4", "contour_right5", "contour_right6", "contour_right7", "contour_right8", "contour_right9", "left_eye_bottom", "left_eye_center", "left_eye_left_corner", "left_eye_lower_left_quarter", "left_eye_lower_right_quarter", "left_eye_pupil", "left_eye_right_corner", "left_eye_top", "left_eye_upper_left_quarter", "left_eye_upper_right_quarter", "left_eyebrow_left_corner", "left_eyebrow_lower_left_quarter", "left_eyebrow_lower_middle", "left_eyebrow_lower_right_quarter", "left_eyebrow_right_corner", "left_eyebrow_upper_left_quarter", "left_eyebrow_upper_middle", "left_eyebrow_upper_right_quarter", "mouth_left_corner", "mouth_lower_lip_bottom", "mouth_lower_lip_left_contour1", "mouth_lower_lip_left_contour2", "mouth_lower_lip_left_contour3", "mouth_lower_lip_right_contour1", "mouth_lower_lip_right_contour2", "mouth_lower_lip_right_contour3", "mouth_lower_lip_top", "mouth_right_corner", "mouth_upper_lip_bottom", "mouth_upper_lip_left_contour1", "mouth_upper_lip_left_contour2", "mouth_upper_lip_left_contour3", "mouth_upper_lip_right_contour1", "mouth_upper_lip_right_contour2", "mouth_upper_lip_right_contour3", "mouth_upper_lip_top", "nose_contour_left1", "nose_contour_left2", "nose_contour_left3", "nose_contour_lower_middle", "nose_contour_right1", "nose_contour_right2", "nose_contour_right3", "nose_left", "nose_right", "nose_tip", "right_eye_bottom", "right_eye_center", "right_eye_left_corner", "right_eye_lower_left_quarter", "right_eye_lower_right_quarter", "right_eye_pupil", "right_eye_right_corner", "right_eye_top", "right_eye_upper_left_quarter", "right_eye_upper_right_quarter", "right_eyebrow_left_corner", "right_eyebrow_lower_left_quarter", "right_eyebrow_lower_middle", "right_eyebrow_lower_right_quarter", "right_eyebrow_right_corner", "right_eyebrow_upper_left_quarter", "right_eyebrow_upper_middle", "right_eyebrow_upper_right_quarter"
            ]
            return array
        }
    }
    static func processLandmark(faceArray: NSArray, width: CGFloat, height: CGFloat) {
        for dict in faceArray {
            let landmarkDict = dict as! NSDictionary
            self.setAllValues(landmarkDict, width: width, height: height)
        }
    }
    
    static func setAllValues(dict: NSDictionary, width: CGFloat, height: CGFloat) {
        
    }
}