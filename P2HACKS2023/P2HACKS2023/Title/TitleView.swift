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
            Button {
                activie.toggle()
            } /* アクションコードここまで */label: {
                Text("次へ")
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
