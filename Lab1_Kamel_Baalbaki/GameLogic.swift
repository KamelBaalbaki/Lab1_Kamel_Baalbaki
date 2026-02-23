//
//  GameLogic.swift
//  Lab1_Kamel_Baalbaki
//
//  Created by Kamel Baalbaki on 2026-02-23.
//

import Combine
import SwiftUI

class GameLogic: ObservableObject {
    @Published var currentNumber: Int = Int.random(in: 1...100)
    @Published var correctAnswers: Int = 0
    @Published var wrongAnswers: Int = 0
    @Published var attempts: Int = 0
    @Published var showResultIcon: Bool = false
    @Published var isCorrectSelection: Bool = false
    @Published var showDialog: Bool = false
    
    private var timer: Timer?
    private var timeRemaining: Int = 5
    private var answered: Bool = false
    
    func isPrime(_ number: Int) -> Bool {

            if number < 2 { return false }

            for i in 2..<number {
                if number % i == 0 {
                    return false
                }
            }

            return true
        }
    
    func startTimer() {
        
        timer?.invalidate()
        
        timeRemaining = 5
        answered = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            self.timeRemaining -= 1
            
            if self.timeRemaining == 0 {
                self.timeOut()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func timeOut() {
        
        if answered { return }
        
        answered = true
        
        stopTimer()
        
        wrongAnswers += 1
        attempts += 1
        
        isCorrectSelection = false
        showResultIcon = true
        
        checkGameEnd()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextRound()
        }
    }
    
    
}
