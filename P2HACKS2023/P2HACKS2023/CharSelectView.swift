//
//  CharSelectView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI
/* 「キャラクター変更」のパラメータ */
let sceneNaWidth = 270.0
let sceneNaHeight = 35.0
let sceneNaY = 70.0

/* 「戻る」ボタンのパラメータ */
let returnButtonWidth = 65.0
let returnButtonHeight = 65.0
let returnButtonX = (returnButtonWidth/2) + 30
let returnButtonY = 310.0
struct CharSelectView: View {
    
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
            
            VStack{
                //「キャラクター変更」を表示
                Image("sceneName")
                    /* リサイズする */
                    .resizable()
                    /* フレームサイズ指定 */
                    .frame(width: sceneNaWidth, height: sceneNaHeight)
                    /* 表示位置の設定 */
                    .position(x: sceneNaWidth/2, y: sceneNaY)
                
                /* 「戻る」ボタン表示 */
                Button(action: {
                    
                    print("button push")
                }, /* アクションコードここまで */ label: {
                    Image("returnButton")
                        /* リサイズする */
                        .resizable()
                        /* フレームサイズ指定 */
                        .frame(width:returnButtonWidth, height:returnButtonHeight)
                        /* 表示位置の指定 */
                        .position(x:returnButtonX, y:returnButtonY)
                }) /* 「戻る」ボタンコードここまで */
            } /* Vstackここまで */
        } /* Zstackここまで */
    
    }
}

#Preview {
    CharSelectView()
}
