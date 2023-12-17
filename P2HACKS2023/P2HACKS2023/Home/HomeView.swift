//
//  HomeView.swift
//  P2HACKS2023
//
//  Created by 児玉拓海 on 2023/12/15.
//

import SwiftUI
import SceneKit

struct HomeView: View {
    @State private var activieA = false
    @State private var activieB = false
    @State private var activieC = false
    /* 所持キャラの名前格納配列*/
    @Binding var inimyCharNames: [String]
    /* ガチャキャラの名前格納配列*/
    @Binding var iniGachaInCharNames: [String]
    
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
                
                /* ------------------------------------------------------------------ */
                /* 3Dモデル表示 */
                SceneKitView(scene: loadScene())
                    .frame(width: modelW, height: modelH/2)
                    .background(Color.clear.opacity(0.2))
                //「キャラクター変更」を表示
                Image("Home")
                /* リサイズする */
                    .resizable()
                /* フレームサイズ指定 */
                    .frame(width: sceneLaWidth, height: sceneLaHeight)
                /* 表示位置の設定 */
                    .position(x: sceneLaWidth/2, y: sceneLaY)
                
                
                
                /* 「キャラ変更」ボタン表示 */
                Button {
                    /* アクションコードここから */
                    activieA.toggle()
                } /* アクションコードここまで */ label: {
                    Image("toSelectButton")
                    /* リサイズする */
                        .resizable()
                }
                .fullScreenCover(isPresented: $activieA) {
                    CharSelectView(myCharNames: $inimyCharNames, GachaInCharNames: $iniGachaInCharNames)
                }
                .navigationBarBackButtonHidden(true)
                /* フレームサイズ指定 */
                .frame(width:toSelectButtonW, height:toSelectButtonH)
                /* 表示位置の指定 */
                .position(x:toSelectButtonX, y:toSelectButtonY)
                /* キャラクター変更ここまで*/
                
                /* ------------------------------------------------------------------ */
                
                HStack {
                    /* 「式場」ボタンコードここから */
                    Button{
                        /* アクションコードここから */
                        activieB.toggle()
                    } /* アクションコードここまで */ label: {
                        Image("toGameButton")
                        /* リサイズする */
                            .resizable()
                    }
                    .fullScreenCover(isPresented: $activieB) {
                        GameView()
                    }
                    .navigationBarBackButtonHidden(true)
                    /* フレームサイズ指定 */
                    .frame(width:toGameButtonW, height:toGameButtonH)
                    /* 表示位置の指定 */
                    .position(x:toGameLeButtonX, y:toGameButtonY)
                    /* 「式場」ボタンコードここまで */
                    
                    /* ------------------------------------------------------------------ */
                    /* 「招待」ボタン表示 */
                    Button {
                        /* アクションコードここから */
                        activieC.toggle()
                    } /* アクションコードここまで */ label: {
                        Image("toGachaButton")
                        /* リサイズする */
                            .resizable()
                    }
                    .fullScreenCover(isPresented: $activieC) {
                        GachaView()
                    }
                    .navigationBarBackButtonHidden(true)
                    /* フレームサイズ指定 */
                    .frame(width:toGameButtonW, height:toGameButtonH)
                    /* 表示位置の指定 */
                    .offset(x:toGameRiButtonX)
                    .position(y:toGameButtonY)
                    /* 「招待」ボタンコードここまで */
                }
            } /* ZStackここまで */
            .navigationBarBackButtonHidden(true)
        }
    }
    func loadScene() -> SCNScene {
            guard let url = Bundle.main.url(forResource: "raiheen", withExtension: "usdz") else {
                fatalError("Failed to find model file.")
            }

            guard let scene = try? SCNScene(url: url, options: [.overrideAssetURLs: false]) else {
                fatalError("Failed to load scene from model file.")
            }

            // Create a light and add it to the scene
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .omni
            lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
            scene.rootNode.addChildNode(lightNode)

            // Create an ambient light and add it to the scene
            let ambientLightNode = SCNNode()
            ambientLightNode.light = SCNLight()
            ambientLightNode.light?.type = .ambient
            ambientLightNode.light?.color = UIColor.darkGray
            scene.rootNode.addChildNode(ambientLightNode)
            return scene
        }
}

struct SceneKitView: UIViewRepresentable {
    let scene: SCNScene
    let backgroundColor = UIColor(Color.clear) // 背景色を追加
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.backgroundColor = backgroundColor
        return scnView
    }
    func updateUIView( _ scnView: SCNView, context: Context) {
        scnView.backgroundColor = backgroundColor // 背景色をアップデート
    }
}

//#Preview {
//    HomeView()
//}
