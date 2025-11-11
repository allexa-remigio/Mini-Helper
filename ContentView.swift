//
//  ContentView.swift
//  Mini Helper
//
//  Created by A R on 9/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var teamsInput = ""
    @State private var patientsInput = ""
    @State private var result = ""
    @FocusState private var isInputFocused: Bool

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text("Patient Team Distribution")
                .font(.largeTitle)
                .padding()
            
            // Input field for number of teams
            TextField("Enter number of teams", text: $teamsInput)
                .keyboardType(.numberPad)
                .focused($isInputFocused)
                .onSubmit {
                    // Dismiss the keyboard
                    isInputFocused = false
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Input field for number of patients
            TextField("Enter number of patients", text: $patientsInput)
                .keyboardType(.numberPad)
                .focused($isInputFocused)
                .onSubmit {
                    // Dismiss the keyboard
                    isInputFocused = false
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            // Button to calculate
            Button(action: calculatePatientsPerTeam) {
                Text("Distribute Patients")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            // Display the result
            Text(result)
                .font(.title2)
                .padding()
            
            Spacer()
        }
    }
    
    private func calculatePatientsPerTeam() {
        // Ensure the inputs are valid
        
        guard let teams = Int(teamsInput), teams > 0 else {
            result = "Please enter a valid number of teams."
            return
        }
        guard let patients = Int(patientsInput), patients > 0 else {
            result = "Please enter a valid number of patients."
            return
        }
    
        // Perform the calculation
        let patientsPerTeam = patients / teams
        let remainder = patients % teams
        let lessTeam = teams - remainder

        if remainder == 0 {
            result = "For \(teams) teams...\nALL TEAMS get \(patientsPerTeam) patients."
        } else {
            result = "For \(teams) teams...\nEach team gets \(patientsPerTeam) patients.\n" +
                     "\(remainder) patients will be distributed as extra.\n\n" +
                     "\(remainder) teams get \(patientsPerTeam + 1) patients\n" +
                     "\(lessTeam) teams get \(patientsPerTeam) patients."
        }
    }
}

