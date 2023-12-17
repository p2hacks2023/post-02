//
//  BattleShakeView.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import SwiftUI

struct BattleShakeView: View {
    @State private var chkBool = false
    @State private var count = 0
    @Binding var textScore1: Int
    @State var shakeScore = 0
    @State var finalScore1 = 0
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var shakeDetection = ShakeDetection()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("GameBackGround2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .onAppear() {
                        shakeDetection.startMeasurement()
                        
                        count = shakeDetection.countdownSeconds
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            self.count -= 1
                            if self.count == 0 {
                                /* shakeDetection.countdownSeconds秒後 */
                                chkBool.toggle()
                                timer.invalidate()
                                shakeScore = shakeDetection.shakeCount
                                print("shakeScore")
                                finalScore1 = (ScoreCalculation(textScore: textScore1, shakeScore: shakeScore))
                                print("ふぁふぁふぁふぁ: \(textScore1)")
                            }
                        }
                    }
                VStack{
                    Text("\(shakeDetection.countdownSeconds)")
                    Text("振りカウント: \(shakeDetection.shakeCount)")
                }
            }
            .navigationBarBackButtonHidden(true)
            // NavigationLink を使用して BattleShakeView に移動
            .navigationDestination(isPresented: $chkBool, destination: {
                BattleThrowView(finalScore1: $finalScore1)
            })
        }
    }
}



//                HStack{
//                    Button {
//                        /* アクションコードここから */
//                        shakeDetection.startMeasurement()
//                    } /* アクションコードここまで */ label: {
//                        Text("振れ！！！")
//                    }
//                    Button {
//                        /* アクションコードここから */
//                        print(ScoreCalculation(textScore: speechManager.textScore, shakeScore: shakeDetection.shakeCount))
//                    } /* アクションコードここまで */ label: {
//                        Text("スコア")
//                    }
//                }
