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
        } /* Zstackここまで */
    }
}

#Preview {
    HomeView()
}
