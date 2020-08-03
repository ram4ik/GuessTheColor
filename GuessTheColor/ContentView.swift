//
//  ContentView.swift
//  GuessTheColor
//
//  Created by ramil on 03.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var rTarged = Double.random(in: 0..<1)
    @State private var gTarged = Double.random(in: 0..<1)
    @State private var bTarged = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(Color(red: rTarged, green: gTarged, blue: bTarged))
                        Text("Match this color")
                    }
                    VStack {
                        Rectangle()
                            .foregroundColor(Color(red: rGuess, green: gGuess, blue: bGuess))
                        Text("R:\(Int(rGuess * 255.0)) G:\(Int(gGuess * 255.0)) B:\(Int(bGuess * 255.0))")
                    }
                }
                
                VStack {
                    Button(action: {
                        self.showAlert = true
                    }, label: {
                        Text("Check your score")
                    }).padding()
                }
                
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score "), message: Text("\(computeScore())"), dismissButton: .default(Text("OK")) {
                    self.rTarged = Double.random(in: 0..<1)
                    self.gTarged = Double.random(in: 0..<1)
                    self.bTarged = Double.random(in: 0..<1)
                })
            }.navigationTitle("Guess the Color 🤪")
        }.padding()
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarged
        let gDiff = gGuess - gTarged
        let bDiff = bGuess - bTarged
        
        let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
        
        return Int((1.0 - diff) * 100.0 + 0.5)
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
            Text("255")
                .foregroundColor(textColor)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
    }
}
