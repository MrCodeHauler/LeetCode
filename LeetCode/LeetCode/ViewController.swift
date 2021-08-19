//
//  ViewController.swift
//  LeetCode
//
//  Created by Kenny on 2020/9/16.
//  Copyright © 2020 Kenny. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let heights = [1,8,6,2,5,4,8,4,9]
        print(maxArea(heights));
        print(twoSum(heights, target: 11))
    }
    
    // 移除重复的元素
    func removeDuplicates(_ nums: [Int]) -> Int {
        
        return 0;
    }
    
    // 盛更多水的容器
    func maxArea(_ heights: [Int]) -> Int {
        var res = 0
        var i = 0, j = heights.count - 1
        while i < j {
            let area = (j - i) * min(heights[i], heights[j])
            res = max(res, area)
            if (heights[i] < heights[j]) {
                i+=1
            } else {
                j-=1
            }
        }
        return res
    }
    
    // 两数之和
    func twoSum(_ nums: [Int], target: Int) -> [Int] {
        // 暴力解法
        for i in 0..<nums.count {
            for j in ((i + 1)..<nums.count).reversed() {
                if (nums[i] + nums[j] == target) {
                    return [i, j]
                }
            }
        }
        return []
    }
    
    // 三数之和
    func threeSum(_ nums: [Int], target: Int) {
        
    }
    
    // pow(x, n)
    func myPow() {
        
    }
    
    // 电话号码的字母组合

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

