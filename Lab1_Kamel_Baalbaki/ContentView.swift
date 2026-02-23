//
//  ContentView.swift
//  Lab1_Kamel_Baalbaki
//
//  Created by Kamel Baalbaki on 2026-02-23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var game = GameLogic()

    var body: some View {

        ZStack {
            LinearGradient(
                            colors: [.purple.opacity(0.4), .blue.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .ignoresSafeArea()
            
            VStack(spacing: 30) {

                            Text("Prime Number Game")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)

                            Spacer()

        }

            if game.showResultIcon {

                Image(systemName: game.isCorrectSelection ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundColor(game.isCorrectSelection ? .green : .red)
            }

            HStack(spacing: 30) {

                Button {
                    game.selectAnswer(isPrimeSelected: true)
                } label: {

                    Text("Prime")
                        .frame(width: 140, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button {
                    game.selectAnswer(isPrimeSelected: false)
                } label: {

                    Text("Not Prime")
                        .frame(width: 140, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            VStack(spacing: 10) {

                Text("Correct: \(game.correctAnswers)")
                Text("Wrong: \(game.wrongAnswers)")
                Text("Attempts: \(game.attempts)/10")

            }
            .font(.headline)

        }
        .padding()
        .alert("Game Finished", isPresented: $game.showDialog) {

            Button("Play Again") {
                game.resetGame()
            }

        } message: {

            Text("Correct Answers: \(game.correctAnswers)\nWrong Answers: \(game.wrongAnswers)")
        }
    }
}

#Preview {
    ContentView()
}
