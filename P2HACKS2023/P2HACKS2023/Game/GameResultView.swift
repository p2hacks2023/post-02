//
//  GameResultView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

struct GameResultView: View {
    @Binding var finalScore3: Int
    @State private var chkBool = false
    /* 所持キャラの名前格納配列*/
    @State var inimyCharNames = ["raihin", "johin"]
    /* ガチャキャラの名前格納配列*/
    @State var iniGachaInCharNames = ["syuhin", "kokuhin"]
    
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
                /* 背景追加 */
                Image("resultback")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                //「キャラクター変更」を表示
                Image("resultScore")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: resultY)
                Image("gameResultText")
                    .resizable()
                    .scaledToFill()
                    .frame(width: gachResultTextW, height: gachResultTextH, alignment: .bottom)
                    .position(x: gachResultTextX, y: gachResultTextY)
                Image("Result")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                Text("\(finalScore3)")
                    .font(.system(size: 65.0))
                    .foregroundColor(Color.white)
                    .bold()
                    .position(x: resultX, y:resultY)
                Button {
                    /* アクションコードここから */
                    chkBool.toggle()
                } /* アクションコードここまで */ label: {
                    Image("introFinButton")
                        .resizable()
                        .frame(width: toSelectButtonW, height: toSelectButtonH)
                        .position(x: toSelectButtonX, y:screenH/2+screenH/3)
                        
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $chkBool, destination: {
                HomeView(inimyCharNames: $inimyCharNames, iniGachaInCharNames: $iniGachaInCharNames)
            })
        }
        
    }
}
