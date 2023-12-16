//
//  ScoreCalculation.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import Foundation

func ScoreCalculation (textScore ts:Int, shakeScore ss:Int) -> Int{
    var finalScore:Int = 0
    
    // 文字列の一致度を計算
    finalScore = ts * ss

    return finalScore
}
