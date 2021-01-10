//
//  Habit_Model.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/7/21.
//

import Foundation


class Habits: ObservableObject{
    
    @Published var list:[Habit]
    
    
    init(){
        let decoder = JSONDecoder()
            
        if let data = UserDefaults.standard.data(forKey: "Habits") {
                
            if let decoded = try? decoder.decode([Habit].self, from: data) {
                    
                list = decoded
                    
            }
        }
        list = []
    }
    
    
}


struct Habit: Codable, Identifiable, Hashable{
    var count = 0
    var name = ""
    var description:String? // User might not want a description
    
    let id = UUID() // Makes habit unique
    
    init(count:Int, name:String, desc:String?){
        self.count = count
        self.name = name
        self.description = desc
    }
}
