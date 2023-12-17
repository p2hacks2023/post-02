//
//  BattleAnimationView.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import SwiftUI

struct BattleAnimationView: View {
    @State private var chkBool = false
    @State private var count = 1.0
    @Binding var finalScore2: Int
    @State var finalScore3 = 0

    
    var body: some View {
        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("GameBackGround2")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            self.count -= 1
                            if self.count == 0.0 {
                                /* 1秒後 */
                                chkBool.toggle()
                                timer.invalidate()
                                finalScore3 = finalScore2
                            }
                        }
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $chkBool, destination: {
                GameResultView(finalScore3: $finalScore3)
            })
        }
    }
}

