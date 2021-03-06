//
//  Habit_Model.swift
//  Habit Me
//
//  Created by Luis Alvarez on 1/7/21.
//

import Foundation


class Habits: ObservableObject{
    
    @Published var list:[Habit]{
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(list) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
            print("Saved")
        }
    }
    
    
    init(){
        let decoder = JSONDecoder()
            
        if let data = UserDefaults.standard.data(forKey: "Habits") {
                
            if let decoded = try? decoder.decode([Habit].self, from: data) {
                    
                list = decoded
                print("Accessed data")
                return
            }
        }
        list = []
    }
    
    
}


struct Habit: Codable, Identifiable, Hashable{
    var name = ""
    var description:String? // User might not want a description
    
    let id = UUID() // Makes habit unique
    
    init(name:String, desc:String?){
        self.name = name
        self.description = desc
    }
}
