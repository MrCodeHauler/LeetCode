//
//  IsNumberViewController.swift
//  LeetCode
//
//  Created by linzhongbiao on 2023/7/18.
//  Copyright © 2023 Kenny. All rights reserved.
//  使用有限状态自动机。根据字符类型和合法数值的特点，先定义状态，再画出状态转移图

import Foundation

enum State {
    /// 起始的空格
    case initial
    /// 符号位
    case int_sign
    /// 整数部分
    case integer
    /// 左侧有整数的小数点
    case point
    /// 左侧无整数的小数点
    case point_without_int
    /// 小数部分
    case fraction
    /// 幂符号
    case exp
    /// 幂符号后的正负号
    case exp_sign
    /// 幂符号后的数字
    case exp_number
    /// 结尾的空格
    case end
    /// 非法字符
    case illegal
}

enum CharType {
    /// 数字「 0 - 9 」
    case number
    /// 幂符号 「 eE 」
    case exp
    /// 小数点 「 . 」
    case point
    /// 正负号 「 +− 」
    case sign
    /// 空格 「   」
    case space
    /// 非法字符
    case illegal
}

class IsNumberViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(isNumber_1("-1.e49046 "))
    }
    
    func toCharType(_ ch: Character) -> CharType {
        if ch >= "0" && ch <= "9" {
            return .number
        } else if ch == "e" || ch == "E" {
            return .exp
        } else if ch == "." {
            return .point
        } else if ch == "+" || ch == "-" {
            return .sign
        } else if ch == " " {
            return .space
        } else {
            return .illegal
        }
    }
    
    func transfer(_ st: State, _ type: CharType) -> State {
        switch st {
        case .initial:
            switch type {
            case .space:
                return .initial
            case .number:
                return .integer
            case .point:
                return .point_without_int
            case .sign:
                return .int_sign
            default:
                return .illegal
            }
        case .int_sign:
            switch type {
            case .number:
                return .integer
            case .point:
                return .point_without_int
            default:
                return .illegal
            }
        case .integer:
            switch type {
            case .number:
                return .integer
            case .exp:
                return .exp
            case .point:
                return .point
            case .space:
                return .end
            default:
                return .illegal
            }
        case .point:
            switch type {
            case .number:
                return .fraction
            case .space:
                return .end
            case .exp:
                return .exp
            default:
                return .illegal
            }
        case .point_without_int:
            switch type {
            case .number:
                return .fraction
            default:
                return .illegal
            }
        case .fraction:
            switch type {
            case .number:
                return .fraction
            case .exp:
                return .exp
            case .space:
                return .end
            default:
                return .illegal
            }
        case .exp:
            switch type {
            case .number:
                return .exp_number
            case .sign:
                return .exp_sign
            default:
                return .illegal
            }
        case .exp_sign:
            switch type {
            case .number:
                return .exp_number
            default:
                return .illegal
            }
        case .exp_number:
            switch type {
            case .number:
                return .exp_number
            case .space:
                return .end
            default:
                return .illegal
            }
        case .end:
            switch type {
            case .space:
                return .end
            default:
                return .illegal
            }
        default:
            return .illegal
        }
    }
    
    func isNumber_1(_ s: String) -> Bool {
        if s.count == 0 {
            return false
        }
        // 去除字符串前后的空格
        let trimmed = s.trimmingCharacters(in: .whitespaces)
        // 获取字符数组
        let sList = trimmed.map{ String($0) }
        var st: State = .initial
        for c in s {
            let type = toCharType(c)
            let nextState = transfer(st, type)
            if nextState == .illegal {
                return false
            }
            st = nextState
        }
        
        return st == .integer || st == .point || st == .fraction || st == .exp_number || st == .end
    }
    
    
    //  MARK: 判断字符串是否表示数值（包括整数和小数）
    /// - Parameter s: 字符串
    /// - Returns: 是否为数字
    func isNumber_2(_ s: String) -> Bool {
        return s.range(of: #"^ *([-\+]?\d+((\.\d+)?|\.?)|([-\+]?\.\d+))([Ee][\+-]?\d+)? *$"#, options: .regularExpression) != nil
    }
    
}
