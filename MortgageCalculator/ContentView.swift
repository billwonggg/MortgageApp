//
//  ContentView.swift
//  MortgageCalculator
//
//  Created by Bill Wong on 10/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var purchasePrice : Double = 750000.0
    @State var downPayment : Double = 150000.0
    @State var loanLength : Double = 25.0
    @State var interestRate : Double = 4.50
    
    var loanAmount : Double {
        return purchasePrice - downPayment
    }
    
    var repayment : Double {
        let r : Double = interestRate / 1200
        let n : Double = loanLength * 12
        return loanAmount * r * pow(1 + r, n) / (pow(1 + r, n) - 1)
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack(alignment: .leading) {
                
                Text("Mortgage Calculator")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Group {
                    Text("Property Price: $\(String(Int(purchasePrice)))")
                        
                    Slider(value: $purchasePrice, in: 400000...1500000, step: 2000)
                    
                    Text("Down Payment: $\(String(Int(downPayment)))")
                    Slider(value: $downPayment, in: 0...purchasePrice, step: 2000)
                    
                    Text("Loan Length: \( String(Int(loanLength))) years")
                    Slider(value: $loanLength, in: 10...40, step: 1)
                    
                    Text("Interest Rate: \(String(format: "%.2lf", interestRate))%")
                    Slider(value: $interestRate, in: 0.0...6.0, step: 0.01)
                    
                    Text("Loan Amount: $\(String(Int(loanAmount)))")
                    Text("Monthly Repayment: $" + String(Int(repayment)))
                }
                Spacer()
                Spacer()
                
            }
            .padding(40).font(.headline)
        }
        
    }
}

struct BackgroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.blue.opacity(0.1), Color.blue.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
