//
//  BattleAnimationView.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/17.
//

import SwiftUI
import AVKit

struct BattleAnimationView: View {
    @State private var chkBool = false
    @State private var count = 6.0
    @Binding var finalScore2: Int
    @State var finalScore3 = 0
    
    private let player = AVPlayer(url: Bundle.main.url(forResource: "GameScene", withExtension: "mp4")!)
    
    var body: some View {
        NavigationStack {
            ZStack {
                /* 動画追加 */
                VideoPlayer(player: player)
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                    .frame(width: sceneLaWidth, height: screenH)
                Button {
                    player.play()
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        self.count -= 1
                        if self.count == 0.0 {
                            /* 1秒後 */
                            chkBool.toggle()
                            player.pause()
                            timer.invalidate()
                            finalScore3 = finalScore2
                        }
                    }
                } label: {
                    Image("tousou")
                        .resizable()
                        .frame(width: toSelectButtonW, height: toSelectButtonH)
                        .position(x: toSelectButtonX, y:screenH/2+screenH/3)
                }
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $chkBool, destination: {
                    GameResultView(finalScore3: $finalScore3)
                })
            }
        }
    }
}
