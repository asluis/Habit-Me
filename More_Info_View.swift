//
//  More_Info_View.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/9/21.
//

import SwiftUI

struct More_Info_View: View {
    
    @State var habit:Habit
    
    
    var body: some View {
        VStack{
            graphic(num: habit.count)
            
            
            Text(habit.description ?? "")
                .padding(.top)
        }
    }
}


struct graphic: View{
    
    let num:Int
    
    var body: some View{
        GeometryReader{ geo in
            ZStack{
                Circle()
                    .strokeBorder(Color.blue, lineWidth: 10)
                    .frame(width: geo.size.width)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: geo.size.width * 0.9)
                
                
                Text("\(num)")
                    .foregroundColor(.white)
                    .font(.system(size: 75))
            }
        }
    }
    
}

struct More_Info_View_Previews: PreviewProvider {
    static var previews: some View {
        More_Info_View(habit: Habit(count: 10, name: "Running", desc: "Large description"))
    }
}
