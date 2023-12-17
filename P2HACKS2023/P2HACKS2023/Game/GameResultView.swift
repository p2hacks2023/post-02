//
//  GameResultView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/16.
//

import SwiftUI

struct GameResultView: View {
    @Binding var finalScore3: Int
    
    var body: some View {
        Text("倒したゲヒーン数：\(finalScore3)")
    }
}
