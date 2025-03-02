//
//  ContentView.swift
//  Rock-Paper-Scissor
//
//  Created by Dylan COUTO DE OLIVEIRA on 02/03/2025.

import SwiftUI

enum Choix: String, CaseIterable {
    case rock
    case paper
    case scissors
}

struct ContentView: View {
    
    @State var scorePlayer: Int = 0
    @State var scoreOrdinateur: Int = 0
    @State var choixOrdinateur: Choix?
    @State var message: String = ""
    
    var body: some View {
        VStack {
            Text("Rock Paper Scissors Game !").font(.title)
            Text("Choisissez un des trois symboles en bas de l'écran pour jouer contre l'ordinateur et verifiez qui a gagné !")
                .font(.headline)
                .padding(.horizontal, 20)
                .padding(.top, 20)
        }
        HStack {
            Image("paper")
                .resizable()
                .frame(width: 100, height: 100)
                .onTapGesture {
                    selectionChoixOrdinateur()
                    verifierGagnant(choixJoueur: Choix.paper)
                }
            Image("rock")
                .resizable()
                .frame(width: 100, height: 100)
                .onTapGesture {
                    selectionChoixOrdinateur()
                    verifierGagnant(choixJoueur: Choix.rock)
                }
            Image("scissors")
                .resizable()
                .frame(width: 100, height: 100)
                .onTapGesture {
                    selectionChoixOrdinateur()
                    verifierGagnant(choixJoueur: Choix.scissors)
                }
            
        }.padding(.top, 50)
        VStack {
            Text("L'ordinateur à choisi : \(choixOrdinateur?.rawValue ?? "")").padding(.vertical, 10)
            HStack {
                Text("Score du joueur : \(scorePlayer)")
                Text("Score de l'ordinateur : \(scoreOrdinateur)")
            }
            Text(message).font(.headline).padding(.top, 10)
                .foregroundStyle(.green)
        }
    }
    
    func selectionChoixOrdinateur() {
        choixOrdinateur = Choix.allCases.randomElement()
        
    }
    
    func verifierGagnant(choixJoueur: Choix?) -> Void {
        if(choixJoueur == Choix.rock && choixOrdinateur == Choix.scissors){
            scorePlayer += 1
            message = "Vous avez gagné !"
        }
        else if(choixJoueur == Choix.paper && choixOrdinateur == Choix.rock){
            scorePlayer += 1
            message = "Vous avez gagné !"
        }
        else if(choixJoueur == Choix.scissors && choixOrdinateur == Choix.paper){
            scorePlayer += 1
            message = "Vous avez gagné !"
        }
        else if(choixJoueur == choixOrdinateur) {
            scorePlayer += 1
            scoreOrdinateur += 1
            message = "Match nul !"
        }
        else{
            scoreOrdinateur += 1
            message = "L'ordinateur a gagné !"
        }
    }
}

#Preview {
    ContentView()
}
