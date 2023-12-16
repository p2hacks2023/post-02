//
//  IntroView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

struct IntroView: View {
    var page: Page
    
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
            
            //「イントロ変更」を表示
            Image(page.description)
            /* リサイズする */
                .resizable()
            /* フレームサイズ指定 */
                .frame(width: sceneLaWidth, height: sceneLaHeight)
            /* 表示位置の設定 */
                .position(x: sceneLaWidth/2, y: sceneLaY)
            
            VStack(spacing: 20) {
                Image("\(page.imageUrl)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: IntroWandH, height: IntroWandH)
                    .position(x: IntroX, y: IntroY)
                
            }
        }
    }
}

#Preview {
    IntroView(page: Page.samplePage)
}
