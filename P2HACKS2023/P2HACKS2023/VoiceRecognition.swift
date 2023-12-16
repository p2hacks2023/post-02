//
//  VoiceRecognition.swift
//  P2HACKS2023
//
//  Created by 小林龍ノ介 on 2023/12/16.
//

import Foundation
import Speech

class SpeechManager: ObservableObject {
    @Published var recognizedText = ""
    @Published var countdown = 10
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "ja-JP"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()

    func startRecording() {
        requestMicrophonePermission()

        do {
            try AVAudioSession.sharedInstance().setCategory(.record, mode: .measurement, options: .duckOthers)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()

            guard let recognitionRequest = recognitionRequest else { return }

            let inputNode = audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)

            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
                recognitionRequest.append(buffer)
            }

            audioEngine.prepare()
            try audioEngine.start()

            startCountdown()

            recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest) { result, error in
                if let result = result {
                    self.recognizedText = result.bestTranscription.formattedString
                    print("Recognized Text: \(self.recognizedText)")
                } else if let error = error {
                    print("Recognition Error: \(error)")
                }
            }
            
        } catch {
            print("Audio Session Error: \(error)")
        }
    }

    func stopRecording() {
        audioEngine.stop()
        recognitionRequest?.endAudio()
        recognitionTask?.cancel()
        resetCountdown()
        print(recognizedText)
    }

    private func requestMicrophonePermission() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            if authStatus == .authorized {
                print("Microphone permission granted")
            } else {
                print("Microphone permission denied")
            }
        }
    }

    func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.countdown > 0 {
                self.countdown -= 1
            } else {
                timer.invalidate()
                self.stopRecording()
            }
        }
    }

    private func resetCountdown() {
        countdown = 10
    }
}
