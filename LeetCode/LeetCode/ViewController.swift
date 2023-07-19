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

//        let heights = [1,8,6,2,5,4,8,4,9]
//        print(maxArea(heights));
//        print(twoSum(heights, target: 11))
        
        let s = "lrloseumgh"
        print(reverseLeftWords_2(s, 6))
        
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
    
    /// 哈希表法
    func twoSum_1(_ nums: [Int], target: Int) -> [Int] {
        var map = [Int: Int]()
        for i in 0..<nums.count {
            map[target - nums[i]] = i
        }
        for (index, item) in nums.enumerated() {
            if let mapItem = map[item], mapItem != index {
                return [mapItem, index]
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
        if right == 0 {
            return numbers[0]
        }
        while left < right {
            var mid = left + (right - left)/2
            if numbers[mid] < numbers[right] {
                right = mid
            } else if numbers[mid] > numbers[right] {
                left = mid + 1
            } else if numbers[mid] == numbers[right] {
                right -= 1
            }
        }
        return numbers[left]
    }
    
    //  MARK: 旋转字符串
    /// - Parameters:
    ///   - s: 即将旋转的字符串
    ///   - goal: 目标字符串
    /// - Returns: true or false
    /// - Description: 若 s = 'abcde'，在旋转一次之后结果就是'bcdea' 。s 的 旋转操作 就是将 s 最左边的字符移动到最右边。
    func rotateString(_ s: String, _ goal: String) -> Bool {
        // 若s和goal的长度不一样，则s都不能得到goal
        if s.count != goal.count {
            return false
        }
        
        return (s + s).contains(goal)
    }
    
    func rotateString_KMP(_ s: String, _ goal: String) -> Bool {
        // TODO: KMP算法待补充
        return false
    }
    
    
    //  MARK: 左旋转字符串
    /// - Parameters:
    ///   - s: 字符串
    ///   - n: 旋转字符个数
    /// - Returns: 时间复杂度: O(N) 空间复杂度: O(N)
    func reverseLeftWords_1(_ s: String, _ n: Int) -> String {
        // 左旋转长度大于等于字符串长度，相当于不旋转
        guard n < s.count else {
            return s
        }
        let startIndex = s.index(s.startIndex, offsetBy: n)
        let leftPart = String(s[startIndex...])
        let rightPart = String(s[..<startIndex])
        return leftPart + rightPart
    }
    
    /// 列表遍历拼接
    /// - Returns: 时间复杂度: O(N) 空间复杂度: O(N)
    func reverseLeftWords_2(_ s: String, _ n: Int) -> String {
        var res: [String] = []
        var sList = s.map{ String($0) }
        let sLen = s.count
        
        // 求余运算
        for i in n..<(sLen+n) {
            res.append(sList[i%sLen])
        }
        return res.joined()
    }
    
    //  MARK: 替换空格
    /// - Parameter s: 字符串
    /// - Returns: 替换后的结果
    func replaceSpace_1(_ s: String) -> String {
        return s.replacingOccurrences(of: "", with: "%20")
    }
    
    func replaceSpace_2(_ s: String) -> String {
        return s.map{ $0 == " " ? "%20" : String($0) }.reduce("", +)
    }
    
    //  MARK: 调整数组顺序使奇数位于偶数前面
    /// - Parameter nums: 数组
    /// - Returns: 调整后的结果
    /// - Description:  双指针法 => 时间复杂度：O(n) 空间复杂度：O(1)
    func exchange_1(_ nums: [Int]) -> [Int] {
        let len = nums.count
        var res = [Int](repeating: 0, count: len)
        var left = 0
        var right = len - 1
        for item in nums {
            if item%2 == 1 {
                // 奇数
                res[left] = item
                left += 1
            } else {
                // 偶数
                res[right] = item
                right -= 1
            }
        }
        return res
    }
    
    /// - Description: 一次遍历 => 时间复杂度：O(n) 空间复杂度：O(1)
    func exchange_2(_ nums: [Int]) -> [Int] {
        var evenNums: [Int] = []
        var oddNums: [Int] = []
        for item in nums {
            if item%2 == 1 {
                // 奇数
                oddNums.append(item)
            } else {
                // 偶数
                evenNums.append(item)
            }
        }
        return oddNums + evenNums
    }
    
    /// - Description: 原地交换 => 时间复杂度：O(n) 空间复杂度：O(1)
    func exchange_3(_ nums: [Int]) -> [Int] {
        var res = nums
        let len = res.count
        var left = 0, right = len - 1
        while left < right {
            while left < right && res[left]%2 == 1 {
                left += 1
            }
            while left < right && res[right]%2 == 0 {
                right -= 1
            }
            if left < right {
                let temp = res[left]
                res[left] = res[right]
                res[right] = temp
                left += 1
                right -= 1
            }
        }
        return res
    }
    
    
    //  MARK: 和为s的两个数字
    /// - Parameters:
    ///   - nums: 递增排序的数组
    ///   - target: 数字
    /// - Returns: 和为target的任意一对数字
    /// - Description: 双指针法 => 时间复杂度：O(n) 空间复杂度：O(1)
    func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
        let len = nums.count
        var left = 0, right = len - 1
        while left < right {
            if nums[left] + nums[right] > target {
                right -= 1
            }
            if nums[left] + nums[right] < target {
                left += 1
            }
            if nums[left] + nums[right] == target {
                return [nums[left], nums[right]]
            }
        }
        return []
    }
    
    /// - Description: 暴力解决法 => 时间复杂度：O(n^2) 空间复杂度：O(1)
    func twoSum_2(_ nums: [Int], _ target: Int) -> [Int] {
        let len = nums.count
        for i in 0..<len {
            for j in (i+1)..<len {
                if nums[i] + nums[j] == target {
                    return [nums[i], nums[j]]
                }
            }
        }
        return []
    }
    
    
    func twoSum_3(_ nums: [Int], _ target: Int) -> [Int] {
        let len = nums.count
        if len < 2 {
            return []
        }
        if len == 2 {
            return (nums.first! + nums.last!) == target ? nums : []
        }
        var map = [Int : Int]()
        for i in 0..<len {
            if map[target - nums[i]] == nil {
                map[target - nums[i]] = i
            }
        }
        for item in nums {
            if let mapItem = map[item] {
                return [item, nums[mapItem]]
            }
        }
        return []
    }
    
    /// - Description: 二分法 => 时间复杂度：O(NLogN) 空间复杂度：O(1)
//    func twoSum_3(_ nums: [Int], _ target: Int) -> [Int] {
//        let len = nums.count
//        var left = 0, right = len - 1
//        while left < right {
//            var mid = left + (right - left)/2
//            if nums[mid] >= target - nums[left] {
//                right = mid
//            } else if nums[mid] < target - nums[left] {
//                left = mid + 1
//            } else {
//                return [nums[left], nums[right]]
//            }
//        }
//        return []
//    }
}

