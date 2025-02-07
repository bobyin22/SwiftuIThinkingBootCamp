//
//  EnvironmentObjectBootcamp.swift
//  SwiftuIThinkingBootCamp
//
//  Created by Yin Bob on 2025/2/7.
//

import SwiftUI

// ObservedObject
// StateObject
// EnviromentObject (有點像是StateObject)

class EnvironmentViewMode: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
    
}

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: EnvironmentViewMode = EnvironmentViewMode()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: DetailView(selectedItem: item),
                                   label: {
                                       Text(item)
                                   })
                }
            }
            .navigationTitle("iOS Devices")
        }
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            //foreground
            NavigationLink(destination: FinalVIew(), label: {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundColor(Color.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            })
        }
    }
}

struct FinalVIew: View {
    var body: some View {
        ZStack{
            // background
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.cyan]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // foreground
            ScrollView {
                VStack(spacing: 20) {
                    Text("Item1")
                    Text("Item2")
                    Text("Item3")
                }
                .foregroundColor(.white)
                .font(.largeTitle)
            }
        }
    }
}


#Preview {
    EnvironmentObjectBootcamp()
    //DetailView(selectedItem: "iPhone")
    //FinalVIew()
}
