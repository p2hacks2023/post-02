//
//  AllUsePara.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

/* 携帯画面のサイズ取得用*/
let bounds = UIScreen.main.bounds

/* シーンラベルのパラメータ */
let sceneLaWidth = CGFloat(bounds.width)
let sceneLaHeight = 55.0
let sceneLaY = 104.0

/* キャラセレクトの「戻る」ボタンのパラメータ */
let returnButtonWidth = 65.0
let returnButtonHeight = 65.0
let returnButtonX = returnButtonWidth
let returnButtonY = CGFloat(bounds.height) - returnButtonWidth*1.5

/* キャラ選択画面の1キャラUIのパラメータ */
let rangeW = CGFloat(bounds.width) - 80
let rangeH = 272.0
let rangeX = CGFloat(bounds.width)/2
let rangeY = CGFloat(bounds.height)/3

/* ガチャ結果のUIパラメータ */
let gachResultY = CGFloat(bounds.height)/2 + rangeH/3
let gachResultTextW = CGFloat(bounds.width) - 48
let gachResultTextH = gachResultTextW/3
let gachResultTextX = CGFloat(bounds.width)/2
let gachResultTextY = sceneLaY + 144
let resultIsSelectButtonY = rangeH + rangeH*1.1

/* ホームの左と右のボタンのパラメータ */
let toGameButtonW = 150.0
let toGameButtonH = 105.0
/* 左 ボタン座標 */
let toGameLeButtonX = CGFloat(bounds.width)/2 - CGFloat(bounds.width)/4
let toGameButtonY = CGFloat(bounds.height) - toGameButtonH * 1.5
/* 右 オフセット */
let toGameRiButtonX = CGFloat(bounds.width)/4
/*
 ・ホームからキャラ選択に行くボタン 
 ・キャラセレクトするボタン
 ・
 ・
 */
let toSelectButtonW = 110.0
let toSelectButtonH = 65.0
let toSelectButtonX = CGFloat(bounds.width)/2
let toSelectButtonY = CGFloat(bounds.height)/2

/* キャラセレクトするボタン座標 */
let isSelectButtonX = CGFloat(bounds.width)/2 + CGFloat(bounds.width)/4
let isSelectButtonY = rangeH + rangeH/4

///* 所持キャラの名前格納配列*/
//var inimyCharNames = ["raihin", "johin"]
///* ガチャキャラの名前格納配列*/
//var iniGachaInCharNames = ["syuhin", "kokuhin"]

/* イントロのUI表示パラメータ */
let IntroWandH = CGFloat(bounds.width) - 30.0
let IntroX = CGFloat(bounds.width)/2
let IntroY = CGFloat(bounds.height)/2 - 65

let nextButtonW = toSelectButtonW
let nextButtonH = toSelectButtonH
let nextButtonX = CGFloat(bounds.width)/2
let nextButtonY = CGFloat(bounds.height)/2 + 260.0

/* バトルカウントのパラメータ */
let BattleTextWH = 170.0
let BattleTextX = CGFloat(bounds.width)/2
let BattleTextY = CGFloat(bounds.height)/2

