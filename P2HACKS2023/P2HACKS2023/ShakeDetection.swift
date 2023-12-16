//
//  ShakingPhone.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/16.
//

import SwiftUI
import CoreMotion

class ShakeDetectionViewModel: ObservableObject {
    @Published var shakeCount = 0
    @Published var countdownSeconds = 5

    private var motionManager: CMMotionManager
    private var timer: Timer?

    init() {
        self.motionManager = CMMotionManager()
    }

    func startMeasurement() {
        resetCountdown()
        startMotionDetection()

        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.countdownSeconds -= 1
            if self.countdownSeconds == 0 {
                self.stopMeasurement()
            }
        }
    }

    func stopMeasurement() {
        stopMotionDetection()
        timer?.invalidate()
        resetCountdown()
    }

    private func startMotionDetection() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.deviceMotionUpdateInterval = 0.1
            motionManager.startDeviceMotionUpdates(to: .main) { [weak self] (data, error) in
                if let acceleration = data?.userAcceleration {
                    let shakeThreshold: Double = 1.5

                    if abs(acceleration.x) > shakeThreshold ||
                       abs(acceleration.y) > shakeThreshold ||
                       abs(acceleration.z) > shakeThreshold {
                        self?.shakeCount += 1
                        print("Shake detected! Count: \(self?.shakeCount ?? 0)")
                    }
                }
            }
        }
    }

    private func stopMotionDetection() {
        motionManager.stopDeviceMotionUpdates()
    }

    private func resetCountdown() {
        countdownSeconds = 5
    }
}


//スマホの揺れを計測するトリガーとしてボタンが欲しかったから便宜上作ったView。消して大丈夫。
struct ShakeDetectionView: View {
    //インスタンス生成
    @StateObject private var viewModel = ShakeDetectionViewModel()

    var body: some View {
        VStack {
            //viewModel.shakeCountで振った回数取得できる
            Text("Shake count: \(viewModel.shakeCount)")
                .font(.title)
                .padding()
            
            //viewModel.countdownSecondsでカウントダウン秒数が取得できる。
            Text("Countdown: \(viewModel.countdownSeconds)")
                .font(.headline)
                .padding()

            Button(action: {
                //ボタンを押すと計測が始まる
                viewModel.startMeasurement()
            }) {
                Text("Start Measurement")
                    .padding()
            }
        }
        .onDisappear {
            viewModel.stopMeasurement()
        }
    }
}

