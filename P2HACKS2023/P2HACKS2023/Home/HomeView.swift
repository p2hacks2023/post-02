//
//  HomeView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            /* 背景追加 */
            Image("background")
            /* リサイズする */
                .resizable()
            /* 画面全体表示（セーフエリア外も）*/
                .edgesIgnoringSafeArea(.all)
            /* アスペクト比を維持 */
                .aspectRatio(contentMode: .fill)
            //「キャラクター変更」を表示
            Image("Home")
            /* リサイズする */
                .resizable()
            /* フレームサイズ指定 */
                .frame(width: sceneLaWidth, height: sceneLaHeight)
            /* 表示位置の設定 */
                .position(x: sceneLaWidth/2, y: sceneLaY)
            /* 「キャラ変更」ボタン表示 */
            Button {
                /* アクションコードここから */
                print("button push")
            } /* アクションコードここまで */ label: {
                Image("toSelectButton")
                    /* リサイズする */
                    .resizable()
            }
            /* フレームサイズ指定 */
            .frame(width:toSelectButtonW, height:toSelectButtonH)
            /* 表示位置の指定 */
            .position(x:toSelectButtonX, y:toSelectButtonY)
            /* キャラクター変更ここまで*/
            
            /* 「左」ボタンコードここまで */
            HStack {
                /* 「左」ボタン表示 */
                Button {
                    /* アクションコードここから */
                    print("button push")
                } /* アクションコードここまで */ label: {
                    Image("toGameButtonL")
                        /* リサイズする */
                        .resizable()
                }
                /* フレームサイズ指定 */
                .frame(width:toGameButtonW, height:toGameButtonH)
                /* 表示位置の指定 */
                .position(x:toGameLeButtonX, y:toGameButtonY)
                /* 「左」ボタンコードここまで */
                
                /* 「右」ボタン表示 */
                Button {
                    /* アクションコードここから */
                    print("button push")
                } /* アクションコードここまで */ label: {
                    Image("toGameButtonL")
                        /* リサイズする */
                        .resizable()
                }
                /* フレームサイズ指定 */
                .frame(width:toGameButtonW, height:toGameButtonH)
                /* 表示位置の指定 */
                .offset(x:toGameRiButtonX)
                .position(y:toGameButtonY)
                /* 「右」ボタンコードここまで */
            }
        } /* ZStackここまで */
    }
}

#Preview {
    HomeView()
}
