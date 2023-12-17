//
//  BattleThrowView.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import SwiftUI

struct BattleThrowView: View {
    @State private var chkBool = false
    @Binding var finalScore1: Int
    @State var finalScore2 = 0
    
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
                Button {
                    /* アクションコードここから */
                    chkBool.toggle()
                } /* アクションコードここまで */ label: {
                    Text("投槍")
                }
                .onAppear() {
                   finalScore2 = finalScore1
                }
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $chkBool, destination: {
                BattleAnimationView(finalScore2: $finalScore2)
            })
        }
    }
}


