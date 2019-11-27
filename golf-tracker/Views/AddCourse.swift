//
//  AddCourse.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct AddCourse: View {
    @State var holes = [3,1,2,4]
    @State var holeInput = ""
    @State var nameInput = ""
    
    func delete(at offsets: IndexSet) {
        holes.remove(atOffsets: offsets)
    }
    
    func saveCourse() {
        
    }
    
    func addHole() {
        if let num = Int(holeInput) {
            holes.append(num)
        }
        
        self.holeInput = ""

    }
    
    var body: some View {
        VStack {
            Text("Add course")
                .font(.title)
            
            
            HStack {
                Text("Add course name")
                     .font(.headline)
                Spacer()
            }.padding()
            
            TextField("Enter course name", text: $nameInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            VStack(alignment: .leading) {
                Text("Add holes")
                    .font(.headline)
                
                HStack {
                    TextField("Enter par", text: $holeInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                    Button("Add") {
                        self.addHole()
                    }
                }
            }.padding()
            
            
            if holes.count > 0 {
                List {
                    ForEach(holes.indices, id: \.self) { i in
                        Text("\(i): Par \(self.holes[i])")
                    }.onDelete(perform: delete)
                }
            } else {
                Text("No holes added")
            }
                        
            
            HStack {
                Spacer()
                Button(action: saveCourse) {
                    Text("Save course")
                        .font(.title)
                    Image(systemName:"plus")
                }
                Spacer()
            }.padding()
        }
    }
}

struct AddCourse_Previews: PreviewProvider {
    static var previews: some View {
        AddCourse()
    }
}
