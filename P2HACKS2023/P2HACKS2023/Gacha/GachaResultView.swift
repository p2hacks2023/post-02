//
//  GachaResultView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

struct GachaResultView: View {
    @State private var activie = false
    /* ガチャキャラの名前格納配列*/
    @State var myCharNames = ["raihin", "johin"]
    @State var GachaInCharNames = ["syuhin", "kokuhin"]
    @State private var check = true
    
    var body: some View {
        let gachaResult = GachaInCharNames.randomElement()
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
                //「結果」を表示
                Image("Result")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                Image("gachaResultText")
                    .resizable()
                    .scaledToFill()
                    .frame(width: gachResultTextW, height: gachResultTextH, alignment: .bottom)
                    .position(x: gachResultTextX, y: gachResultTextY )
                Image(gachaResult!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: rangeW, height: rangeH, alignment: .bottom)
                    .position(x: rangeX, y: gachResultY)
                Button { /* アクションコードここから */
                    print("saitaku")
                } /* アクションコードここまで */ label: {
                    Image("selectButton")
                    /* リサイズする */
                        .resizable()
                }
                /* フレームサイズ指定 */
                .frame(width:toSelectButtonW, height:toSelectButtonH)
                .position(x: isSelectButtonX, y: resultIsSelectButtonY)
                
                Button { /* アクションコードここから */
                    activie.toggle()
                    addMyChar(charName: gachaResult!)
                    removeGachaChar(charName: gachaResult!)
                } /* アクションコードここまで */ label: {
                    Image("introFinButton")
                        .resizable()
                }
                .frame(width: nextButtonW, height: nextButtonH)
                .position(x: nextButtonX, y: nextButtonY+40)
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $activie, destination: {
              HomeView(inimyCharNames: $myCharNames, iniGachaInCharNames: $GachaInCharNames)
            })
        }
    }
    func addMyChar(charName: String) {
        myCharNames.append(charName)
    }
    func removeGachaChar(charName: String) {
        GachaInCharNames.removeAll(where: {$0 == charName})
    }
}

#Preview {
    GachaResultView()
}
