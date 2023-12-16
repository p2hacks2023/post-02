//
//  HomeView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI

struct HomeView: View {
    @State private var activieA = false
    @State private var activieB = false
    @State private var activieC = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("background")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                
                /* ------------------------------------------------------------------ */
                //「キャラクター変更」を表示
                Image("Home")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                /* 「キャラ変更」ボタン表示 */
                NavigationLink {
                    /* アクションコードここから */
                    CharSelectView()
                } /* アクションコードここまで */ label: {
                    Image("toSelectButton")
                    /* リサイズする */
                        .resizable()
                }
                .navigationBarBackButtonHidden(true)
                /* フレームサイズ指定 */
                .frame(width:toSelectButtonW, height:toSelectButtonH)
                /* 表示位置の指定 */
                .position(x:toSelectButtonX, y:toSelectButtonY)
                /* キャラクター変更ここまで*/
                
                /* ------------------------------------------------------------------ */
                /* 「式場」ボタンコードここまで */
                HStack {
                    /* 「左」ボタン表示 */
                    NavigationLink{
                        /* アクションコードここから */
                        GameView()
                    } /* アクションコードここまで */ label: {
                        Image("toGameButton")
                        /* リサイズする */
                            .resizable()
                    }
                    .navigationBarBackButtonHidden(true)
                    /* フレームサイズ指定 */
                    .frame(width:toGameButtonW, height:toGameButtonH)
                    /* 表示位置の指定 */
                    .position(x:toGameLeButtonX, y:toGameButtonY)
                    /* 「式場」ボタンコードここまで */
                    
                    /* ------------------------------------------------------------------ */
                    /* 「招待」ボタン表示 */
                    NavigationLink {
                        /* アクションコードここから */
                        GachaView()
                    } /* アクションコードここまで */ label: {
                        Image("toGachaButton")
                        /* リサイズする */
                            .resizable()
                    }
                    .navigationBarBackButtonHidden(true)
                    /* フレームサイズ指定 */
                    .frame(width:toGameButtonW, height:toGameButtonH)
                    /* 表示位置の指定 */
                    .offset(x:toGameRiButtonX)
                    .position(y:toGameButtonY)
                    /* 「招待」ボタンコードここまで */
                }
            } /* ZStackここまで */
            .navigationBarBackButtonHidden(true)
        }
    }
}
#Preview {
    HomeView()
}
