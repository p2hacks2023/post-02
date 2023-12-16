//
//  BattleMainView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/17.
//

import SwiftUI

struct BattleMainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("GameBackGround2")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BattleMainView()
}
