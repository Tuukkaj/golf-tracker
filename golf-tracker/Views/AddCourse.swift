//
//  AddCourse.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct AddCourse: View {
    @State var holes = [3,5,2,4]
    @State var holeInput = ""
    @State var nameInput = ""
    var updateMainView : () -> Void
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func delete(at offsets: IndexSet) {
        holes.remove(atOffsets: offsets)
    }
    
    func saveCourse() {
        CourseSaver.addCourse(data: CourseData(name: nameInput, holes: holes))
        updateMainView()
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func addHole() {
        if let num = Int(holeInput) {
            holes.append(num)
        }
        
        self.holeInput = ""

    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Course name")
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
            
            .navigationBarTitle("Add course")
        }
    }
}

struct AddCourse_Previews: PreviewProvider {
    static var previews: some View {
        AddCourse(updateMainView: { () in
            NSLog("Preview test")
        })
    }
}
