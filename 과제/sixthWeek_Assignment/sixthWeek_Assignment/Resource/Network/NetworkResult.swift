//
//  NetworkResult.swift
//  sixthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/27.
//

import Foundation


import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
