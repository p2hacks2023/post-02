//
//  BattleThreeView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/17.
//

import SwiftUI

struct BattleThreeView: View {
    @State private var chkBool = false
    @State private var count = 2.0
    
    var body: some View {
        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("GameBackGround")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                Image("gameText1")
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
                BattleMainView()
            })
        }
    }
}

#Preview {
    BattleThreeView()
}
