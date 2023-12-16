//
//  CharSelectView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI

struct CharSelectView: View {
    @Environment(\.dismiss) private var dismiss

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
                
                /* 選択キャラの縦スクロール表示 */
                ScrollView(.vertical) {
                    /* 縦に並べる*/
                    VStack(spacing:30) {
                        ForEach(myCharNames, id: \.self) { charName in
                            let name = charName
                            ZStack {
                                Image(name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: rangeW, height: rangeH, alignment: .bottom)
                                    .position(x: rangeX, y: rangeY)
                                Button { /* アクションコードここから */
                                    if(name == GachaInCharNames[0]){
                                        print(name)
                                    }
                                    if(name == GachaInCharNames[1]){
                                        print(name)
                                    }
                                    if(name == GachaInCharNames[2]){
                                        print(name)
                                    }
                                } /* アクションコードここまで */ label: {
                                    Image("selectButton")
                                    /* リサイズする */
                                        .resizable()
                                }
                                /* フレームサイズ指定 */
                                .frame(width:toSelectButtonW, height:toSelectButtonH)
                                .position(x: isSelectButtonX, y: isSelectButtonY)
                            }
                        }
                    }
                    .padding(.bottom, rangeH)
                }
                .padding(.top, 50)
                
                /* スクロール表示ここまで*/
                //「キャラクター変更」を表示
                Image("CharSelect")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                /* キャラクター変更ここまで */
                
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
                } /* Vstackここまで */
            } /* Zstackここまで */
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    CharSelectView()
}
