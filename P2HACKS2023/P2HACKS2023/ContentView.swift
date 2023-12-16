//
//  ContentView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/12.
//

import SwiftUI
/*
 ここで各Viewを司るよ
 */
struct ContentView: View {
    @ObservedObject var speechManager = SpeechManager()

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
            //音声認識を開始するためのボタン
//            Button("Start Recording") {
//                           speechManager.startRecording()
//                       }
//                       .padding()
            //スマホの揺れを計測するトリガーとしてボタンが欲しかったから便宜上作ったView
            ShakeDetectionView()
        } /* Zstackここまで */
        
    }
}

#Preview {
    ContentView()
}
