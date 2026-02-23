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

            // Background
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

                // Number Card
                ZStack {

                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(radius: 10)

                    Text("\(game.currentNumber)")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(.black)

                }
                .frame(width: 220, height: 160)
                .padding()

                // Result Icon
                if game.showResultIcon {

                    Image(systemName: game.isCorrectSelection ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(game.isCorrectSelection ? .green : .red)
                        .transition(.scale)
                }

                // Buttons
                HStack(spacing: 25) {

                    Button {
                        game.selectAnswer(isPrimeSelected: true)
                    } label: {

                        Text("Prime")
                            .font(.headline)
                            .frame(width: 140, height: 55)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 4)
                    }

                    Button {
                        game.selectAnswer(isPrimeSelected: false)
                    } label: {

                        Text("Not Prime")
                            .font(.headline)
                            .frame(width: 140, height: 55)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .shadow(radius: 4)
                    }
                }

                Spacer()

                // Score Card
                HStack(spacing: 40) {

                    VStack {
                        Text("Correct")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))

                        Text("\(game.correctAnswers)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }

                    VStack {
                        Text("Wrong")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))

                        Text("\(game.wrongAnswers)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                    }

                    VStack {
                        Text("Attempts")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))

                        Text("\(game.attempts)/10")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 30)

            }
            .padding()
        }

        .alert("Game Finished", isPresented: $game.showDialog) {

            Button("Play Again") {
                game.resetGame()
            }

        } message: {

            Text("Correct: \(game.correctAnswers)\nWrong: \(game.wrongAnswers)")
        }
    }
}
#Preview {
    ContentView()
}
