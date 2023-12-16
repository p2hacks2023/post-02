//
//  TitleView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI

struct BattleOneView: View {
    @State private var chkBool = false
    @State private var count = 2.0
    
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
                Image("gameText3")
                    .resizable()
                    .frame(width: BattleTextWH, height: BattleTextWH)
                    .position(x: BattleTextX, y: BattleTextY)
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            self.count -= 1
                            if self.count == 0.0 {
                                /* 1秒後 */
                                chkBool.toggle()
                                timer.invalidate()
                            }
                        }
                    }
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $chkBool, destination: {
                BattleTwoView()
            })
        }
    }
}

#Preview {
    BattleOneView()
}
