//
//  BattleMainView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/17.
//

import SwiftUI

struct BattleMainView: View {
    @State private var chkBool = false
    @State private var count = 0
    //textScoreの値をGameResultViewまで渡す
    @State var textScore1:Int = 0
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var speechManager = SpeechManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("GameBackGround2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .onAppear() {
                        speechManager.startRecording()
                        
                        count = speechManager.countdown
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            self.count -= 1
                            //処理スピードの問題なのかcount==0にするとtextScore1の値が、きちんと計算される前（0）の値を返してくる。　
                            if self.count == -1 {
                                /* speechManager.countdown秒後 */
                                chkBool.toggle()
                                timer.invalidate()
                                textScore1 = speechManager.textScore
                                print(textScore1)
                                print(textScore1)
                                print(speechManager.textScore)
                            }
                        }
                    }
                
                Text("\(speechManager.countdown)")
                    .font(.system(size: 105.0))
                    .foregroundColor(Color.white)
                    .bold()
                    .position(x:toSelectButtonX, y: toSelectButtonY - 320)
                Image("scriptUI")
                    .resizable()
                    .frame(width: readTextW, height:readTextH)
                    .position(x: readTextX, y: readTextY)
            }
            .navigationBarBackButtonHidden(true)
            // NavigationLink を使用して BattleShakeView に移動
            .navigationDestination(isPresented: $chkBool, destination: {
                BattleShakeView(textScore1: $textScore1)
            })
        }
    }
}


