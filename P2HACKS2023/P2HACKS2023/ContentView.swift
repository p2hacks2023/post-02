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

//音声認識するために便宜上作ったView
struct AudioRecognizedView: View {
    @ObservedObject var speechManager = SpeechManager()
    
    var body: some View{
        VStack {
            
            //音声認識が始まる
            Text("Recognized Text: \(speechManager.recognizedText)")
                .padding()
            
            Button("Start Recording") {
                speechManager.startRecording()
            }
            .padding()
            
            //音声認識されたテキストデータを更新したかった。以下のコードではできない
            Button("Reset Recording") {
                speechManager.resetRecognizedText()
            }
            .padding()
            
            Button("Stop Recording") {
                speechManager.stopRecording()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
