//
//  GameView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var activie = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("GameBackGround")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                //「ゲーム」を表示
                Image("Game")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                
                /* 「挨拶」ボタン表示 */
                Button {
                    /* アクションコードここから */
                    activie.toggle()
                } /* アクションコードここまで */ label: {
                    Image("strGameButton")
                    /* リサイズする */
                        .resizable()
                }
                /* フレームサイズ指定 */
                .frame(width:toSelectButtonW, height:toSelectButtonH)
                /* 表示位置の指定 */
                .position(x:toSelectButtonX, y:toSelectButtonY)
                /* 招待ボタンここまで*/
                VStack{
                    /* 「戻る」ボタン表示 */
                    Button {
                        /* アクションコードここから */
                        dismiss()
                    } /* アクションコードここまで */ label: {
                        Image("returnButton")
                        /* リサイズする */
                            .resizable()
                    }
                    /* フレームサイズ指定 */
                    .frame(width:returnButtonWidth, height:returnButtonHeight)
                    /* 表示位置の指定 */
                    .position(x:returnButtonX, y:returnButtonY)
                    /* 「戻る」ボタンコードここまで */
                    
                    
                } /* VStackここまで */
            } /* ZStackここまで */
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $activie, destination: {
                BattleOneView()
            })
        }
    }
}

#Preview {
    GameView()
}
