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
    
    
}
