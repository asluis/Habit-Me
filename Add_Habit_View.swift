//
//  Add_Habit_View.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/8/21.
//

import SwiftUI

struct Add_Habit_View: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name = ""
    @State var desc = ""
    
    @ObservedObject var habits:Habits
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Details")){
                    TextField("Habit Name", text: $name)
                }
                Section(header: Text("OPTIONAL")){
                    TextField("What does this habit mean to you?", text: $desc)
                }
            }
            .navigationBarTitle("Enter Habit Details")
            .navigationBarItems(leading:
                Button(action: {
                    if !name.isEmpty {
                        habits.list.append(Habit(count: 0, name: self.name, desc: desc.isEmpty ? nil : self.desc))
                    }
                    presentationMode.wrappedValue.dismiss()
                }){
                     Image(systemName: "arrowshape.turn.up.backward")
                        .padding()
                }
            )
        }
    }
}

struct Add_Habit_View_Previews: PreviewProvider {
    static var previews: some View {
        Add_Habit_View(habits: Habits())
    }
}
