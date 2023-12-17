//
//   TitleView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI

struct TitleView: View {
    @State private var activie = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                /* 背景追加 */
                Image("Title")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                Button {
                    activie.toggle()
                } /* アクションコードここまで */label: {
                    Image("AppStrButton")
                        .resizable()
                }
                .frame(width: toSelectButtonW, height: toSelectButtonH)
                .position(x: toSelectButtonX, y: strButtonY)
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $activie, destination: {
                ContentView()
            })
        }
    }
}
#Preview {
    TitleView()
}
