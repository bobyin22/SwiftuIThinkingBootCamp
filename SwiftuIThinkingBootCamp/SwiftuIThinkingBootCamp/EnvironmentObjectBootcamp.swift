//
//  EnvironmentObjectBootcamp.swift
//  SwiftuIThinkingBootCamp
//
//  Created by Yin Bob on 2025/2/7.
//

import SwiftUI

// ObservedObject
// StateObject
// EnviromentObject (有點像是StateObject，但算是全域所以視情況使用)

class EnvironmentViewModel: ObservableObject {
    
    @Published var dataArray: [String] = []
    
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }
    
}

// MARK: VC1
struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: DetailView(selectedItem: item), //第二頁資料在這傳的
                        label: {
                            Text(item)
                        })
                }
            }
            .navigationTitle("iOS Devices")
        }
        .environmentObject(viewModel) //添加environmentObject，把資料傳到最後一頁
    }
}

// MARK: VC2
struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            // background
            Color.orange.ignoresSafeArea()
            
            //foreground
            NavigationLink(
                destination: FinalVIew(),
                label: {
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

// MARK: VC3
struct FinalVIew: View {
    
    @EnvironmentObject var viewModel: EnvironmentViewModel //直接拿到第一頁資料
    
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
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
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
