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

    /*
     数组 中心下标 是数组的一个下标，其左侧所有元素相加的和等于右侧所有元素相加的和。
     如果中心下标位于数组最左端，那么左侧数之和视为 0 ，因为在下标的左侧不存在元素。这一点对于中心下标位于数组最右端同样适用。
     如果数组有多个中心下标，应该返回 最靠近左边 的那一个。如果数组不存在中心下标，返回 -1
     */
    
    //  MARK: 计算数组的中心下标
    /// - Parameter nums: 数组
    /// - Returns: 数组的中心下标
    /// - Description:
    func pivotIndex(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, { $0 + $1 })
        var leftSum = 0
        for (index, num) in nums.enumerated() {
            if leftSum * 2 + num == sum {
                return index
            } else {
                leftSum = leftSum + num
            }
        }
        return -1
    }
    
    
    //  MARK: 搜索插入位置
    /// - Parameters:
    ///   - nums: 有序数组
    ///   - target: 目标值
    /// - Returns: 目标值即将插入的索引
    /// - Description: 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置
    func searchInsert_1(_ nums: [Int], _ target: Int) -> Int {
        for (index, num) in nums.enumerated() {
            if num >= target {
                return index
            }
        }
        return nums.count
    }
    
    // 二分法
    func searchInsert_2(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        while left <= right {
            var mid = left + (right - left)/2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
    
    
    //  MARK: 合并所有重叠的区间
    /// - Parameter intervals: 区间数组
    /// - Returns: 不重叠的区间数组
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        return []
    }
    
    
    //  MARK: 旋转图像
    /// - Parameter matrix: 矩阵
    /// - Description 时间复杂度: O(N^2) 空间复杂度: O(N^2)
    func rotate_1(_ matrix: inout [[Int]]) {
        let size = matrix.count
        var matrix_new = matrix
        for i in 0..<size {
            for j in 0..<size {
                matrix_new[j][size-i-1] = matrix[i][j]
            }
        }
        matrix = matrix_new
    }
    
    /// - 原地旋转
    /// - Description 时间复杂度: O(N^2) 空间复杂度: O(1)
    func rotate_2(_ matrix: inout [[Int]]) {
        let size = matrix.count
        for i in 0..<(size/2) {
            for j in 0..<((size+1)/2) {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[size-j-1][i]
                matrix[size-j-1][i] = matrix[size-i-1][size-j-1]
                matrix[size-i-1][size-j-1] = matrix[j][size-i-1]
                matrix[j][size-i-1] = temp
            }
        }
    }
    
    /// - 用翻转代替旋转
    /// - Description 时间复杂度: O(N^2) 空间复杂度: O(1)
    func rotate_3(_ matrix: inout [[Int]]) {
        let size = matrix.count
                
        // 水平翻转
        for i in 0..<size/2 {
            for j in 0..<size {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[size-i-1][j]
                matrix[size-i-1][j] = temp
            }
        }
        
        // 主对角线翻转
        for i in 0..<size {
            for j in 0...i {
                var temp = matrix[i][j]
                matrix[i][j] = matrix[j][i]
                matrix[j][i] = temp
            }
        }
    }
    
    
    //  MARK: 翻转图像
    /// - Parameter image: 二进制矩阵
    /// - Returns: 翻转图像后的结果
    /// - Description: 时间复杂度: O(N^2) 空间复杂度: O(1)
    func flipAndInvertImage(_ image: inout [[Int]]) {
        let size = image.count
        
        for i in 0..<size {
            var left = 0, right = size - 1
            while left < right {
                if image[i][right] == image[i][left] {
                    image[i][right] ^= 1
                    image[i][left] ^= 1
                }
                left += 1
                right -= 1
            }
            if left == right {
                image[i][left] ^= 1
            }
        }
    }
    
    
    //  MARK: 旋转数组中的最小数字
    /// - Parameter numbers: 旋转数组
    /// - Returns: 数组中的最小数字
    func minArray_1(_ numbers: [Int]) -> Int {
        for i in 0..<numbers.count {
            if i < (numbers.count - 1) && numbers[i] > numbers[i + 1] {
                return numbers[i + 1]
            }
        }
        // 所有数字大小一致的场景
        return numbers[0]
    }
    
    /// 二分法
    func minArray_2(_ numbers: [Int]) -> Int {
        var left = 0, right = numbers.count - 1
        var mid = left + (right - left)/2
        while left < right {
            if numbers[mid] < numbers[right] {
                right = mid
            } else if numbers[mid] > numbers[right] {
                left = mid + 1
            } else if numbers[mid] == numbers[right] {
                
            }
        }
    }
}

