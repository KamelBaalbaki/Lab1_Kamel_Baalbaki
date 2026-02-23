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
        
        VStack(spacing: 40) {

                    Text("Prime Number Game")
                        .font(.largeTitle)
                        .bold()

                    Text("\(game.currentNumber)")
                        .font(.system(size: 80))
                        .fontWeight(.bold)

                    if game.showResultIcon {

                        Image(systemName: game.isCorrectSelection ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .resizable()
                            .frame(width: 90, height: 90)
                            .foregroundColor(game.isCorrectSelection ? .green : .red)
                    }
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
            
            
}

#Preview {
    ContentView()
}
