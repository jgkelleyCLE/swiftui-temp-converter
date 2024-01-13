//
//  ContentView.swift
//  TempConverter_Day19
//
//  Created by Jack Kelley on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingUnit = "Fahrenheit"
    @State private var endingUnit = "Celsius"
    @State private var startingTemp = 0
    @State private var endingTemp = 0
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemp: Double {
        
        var temp = Double(endingTemp)
        let starting = Double(startingTemp)
        
        if startingUnit == "Fahrenheit" && endingUnit == "Celsius"{
            temp = Double((starting - 32) * 5/9)
        }
        
        if startingUnit == "Celsius" && endingUnit == "Fahrenheit" {
            temp = Double((starting * 9/5) + 32)
        }
        
        if startingUnit == "Fahrenheit" && endingUnit == "Kelvin" {
            temp = Double((starting - 32) * 5/9 + 273.15)
        }
        
        if startingUnit == "Kelvin" && endingUnit == "Fahrenheit" {
            temp = Double((starting - 273.15) * 9/5 + 32)
        }
        
        if startingUnit == "Celsius" && endingUnit == "Kelvin" {
            temp = Double(starting + 273.15)
        }
        
        if startingUnit == "Kelvin" && endingUnit == "Celsius" {
            temp = Double(starting - 273.15)
        }
        
        return temp
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("\(startingUnit)") {
                    Picker("Starting Unit", selection: $startingUnit){
                        ForEach(units, id: \.self){
                            Text("\($0)")
                        }
                    }
                    TextField("Temperature", value: $startingTemp, format: .number)
                }
                
                Section("\(endingUnit)") {
                    Picker("Converted Unit", selection: $endingUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    Text(" \(convertedTemp, specifier: "%.2f")")
                }
                
//                Text(convertedTemp)
                
            }
        }
    }
}

#Preview {
    ContentView()
}



//if startingUnit == "Celsius" && endingUnit == "Fahrenheit" {
//    return (Double(startingTemp) ?? 0 * 9/5) + 32
//} else if startingUnit == "Celsius" && endingUnit == "Kelvin" {
//    return (Double(startingTemp) ?? 0) + 273.15
//} else if startingUnit == "Fahrenheit" && endingUnit == "Celsius" {
//    return (Double(startingTemp) ?? 0 - 32) * 5/9
//} else if startingUnit == "Fahrenheit" && endingUnit == "Kelvin" {
//    return (Double(startingTemp) ?? 0 - 32) * 5/9 + 273.15
//} else if startingUnit == "Kelvin" && endingUnit == "Celsius" {
//    return (Double(startingTemp) ?? 0) - 273.15
//} else if startingUnit == "Kelvin" && endingUnit == "Fahrenheit" {
//    return (Double(startingTemp) ?? 0 - 273.15) * 9/5 + 32
//}
