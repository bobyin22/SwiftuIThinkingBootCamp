//
//  ViewModelBootcamp.swift
//  SwiftuIThinkingBootCamp
//
//  Created by Yin Bob on 2025/2/6.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = []
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
    
}

struct ViewModelBootcamp: View {
    
   @ObservedObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
                .onDelete(perform: fruitViewModel.deleteFruit)
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .onAppear{
                fruitViewModel.getFruits()
            }
        }
    }
}

#Preview {
    ViewModelBootcamp()
}
