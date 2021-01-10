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
        NavigationView{
            VStack{
                
                
                Text(habit.description ?? "")
                    .font(.headline)
                    .padding()
                Button(action: {
                }){
                    ZStack{
                        myCircle(widthPercentage: 0.9)
                            .stroke(/*@START_MENU_TOKEN@*/Color.blue/*@END_MENU_TOKEN@*/, lineWidth: 10)
                        myCircle(widthPercentage: 0.75)
                    }
                }
            }
            .navigationBarTitle("\(habit.name)")
        }
    }
}


struct myCircle: Shape{
    
    var widthPercentage:CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: CGFloat(rect.midX * widthPercentage), startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 360), clockwise: true)
        return path
    }
}

struct More_Info_View_Previews: PreviewProvider {
    static var previews: some View {
        More_Info_View(habit: Habit(name: "Running", desc: "Large descriptionassbasjajsabsjsbjbjjabsjabjajsab"))
    }
}
