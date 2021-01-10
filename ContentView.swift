//
//  ContentView.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/7/21.
//


import SwiftUI

struct ContentView: View {
    
    @State var showingSheet = false
    
    @ObservedObject var habits = Habits()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(habits.list, id: \.self){ habit in
                        NavigationLink(destination: More_Info_View(habit: habit)){
                            HStack{
                                Text(habit.name)
                                    .font(.headline)
                                
                                Spacer()
                                
                                Text("Check in!")
                                    .font(.headline)
                            }
                            
                        }
                    }.onDelete(perform: deleteSet)
                }
            }
            .sheet(isPresented: $showingSheet){
                Add_Habit_View(habits: self.habits)
            }
            .navigationBarTitle("Habit Me")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingSheet = true
                }){
                    Image(systemName: "plus")
                        .padding()
                }
            )
        }
    }
    
    func deleteSet(at offSet:IndexSet){
        habits.list.remove(atOffsets: offSet)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}
