//
//  GachaAnimeView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/17.
//

import SwiftUI

struct GachaAnimeView: View {
    @State private var chkBool = false
    @State private var count = 1.0
    
    
    var body: some View {
        NavigationStack {
            Text("アニメが再生される")
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
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $chkBool, destination: {
                    GachaResultView()
                })
        }
    }
}


#Preview {
    GachaAnimeView()
}
