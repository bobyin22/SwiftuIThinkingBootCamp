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

struct ViewModelBootcamp: View {
    
    @State var fruitArray: [FruitModel] = [
        FruitModel(name: "Apples", count: 5)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruitArray) { fruit in
                    HStack {
                        Text("\(fruit.count)")
                            .foregroundColor(.red)
                        Text(fruit.name)
                            .font(.headline)
                            .bold()
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .onAppear{
                getFruits()
            }
        }
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        fruitArray.append(fruit1)
        fruitArray.append(fruit2)
        fruitArray.append(fruit3)
    }
}

#Preview {
    ViewModelBootcamp()
}
