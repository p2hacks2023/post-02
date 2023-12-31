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

    @State private var pageIndex = 0
    @State private var activie = false
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    /* 所持キャラの名前格納配列*/
    @State var inimyCharNames = ["raihin", "johin"]
    /* ガチャキャラの名前格納配列*/
    @State var iniGachaInCharNames = ["syuhin", "kokuhin"]
    
    var body: some View {

        NavigationStack {
            ZStack {
                /* 背景追加 */
                Image("background")
                /* リサイズする */
                    .resizable()
                /* 画面全体表示（セーフエリア外も）*/
                    .edgesIgnoringSafeArea(.all)
                /* アスペクト比を維持 */
                    .aspectRatio(contentMode: .fill)
                
                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        ZStack {
                            IntroView(page: page)
                            if (page == pages.last) {
                                Button { /* アクションコードここから */
                                    activie.toggle()
                                    goToZero()
                                } /* アクションコードここまで */ label: {
                                    Image("introFinButton")
                                        .resizable()
                                }
                                .frame(width: nextButtonW, height: nextButtonH)
                                .position(x: nextButtonX, y: nextButtonY)
                            } else {
                                Button { /* アクションコードここから */
                                    incrementPage()
                                } /* アクションコードここまで */ label: {
                                    Image("nextButton")
                                        .resizable()
                                }
                                .frame(width: nextButtonW, height: nextButtonH)
                                .position(x: nextButtonX, y: nextButtonY)
                            }
                        }
                        .tag(page.tag)
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
            } /* Zstackここまで */
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $activie, destination: {
                HomeView(inimyCharNames: $inimyCharNames, iniGachaInCharNames: $iniGachaInCharNames)
            })

        }
    }
    func incrementPage() {
        pageIndex += 1
    }
    func goToZero() {
        pageIndex = 0
    }
}


#Preview {
    ContentView()
}
