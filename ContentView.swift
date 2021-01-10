//
//  ContentView.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/7/21.
//

/*
 My ideas are prefixed with a '-'
 
 Part A:
    At the very least, this means there should be a list of all activities they want to track, plus a form to add new activities – a title and description should be enough.
 
    - Navigation View -> List
    - List should display the user's score before they even click on it
        - Similar to iExpense app UI
    - Adding new activities will be done via sheet view
 
Part B:
 
    For a bigger challenge, tapping one of the activities should show a detail screen with the description, how many times they have completed it, plus a button incrementing their completion count.
 
    - Make a custom shape that user can click on (not sure if possible)
    - Inside custom shape will be the number of times they have checked in

 Part C:
    For an even bigger challenge, use Codable and UserDefaults to load and save all your data.
    
    - All data should be a strings and ints, so no need for special implementation
 */

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var habits = Habits()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habits.list, id: \.self){ habit in
                    NavigationLink(destination: Text("Sample Text")){
                        HStack{
                            Text(habit.name)
                                .font(.largeTitle)
                            
                            Spacer()
                            
                            Text("\(habit.count)")
                                .font(.headline)
                            
                        }
                        
                    }
                }.onDelete(perform: deleteSet)
            }
            
            .navigationBarTitle("Habit Me")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    print("TO DO")
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
