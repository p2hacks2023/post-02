//
//  ScoreCalculation.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import Foundation

//ゲヒーンを軟体倒せるかの計算をする
func ScoreCalculation (textScore ts:Int, shakeScore ss:Int) -> Int{
    var finalScore:Int = 0
    
    //2つの数値を掛け算
    finalScore = ts * ss

    return finalScore
}
