//
//  AddCourse.swift
//  golf-tracker
//
//  Created by Tuukka Juusela on 21.11.2019.
//  Copyright © 2019 Tuukka Juusela. All rights reserved.
//

import SwiftUI

struct AddCourse: View {
    @State var holes = [] as [Int]
    @State var holeInput = ""
    @State var nameInput = ""
    @State var showAlert = false
    var updateMainView : () -> Void
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    func delete(at offsets: IndexSet) {
        holes.remove(atOffsets: offsets)
    }
    
    func saveCourse() {
        if holes.count > 0 && nameInput.count > 0 {
            CourseSaver.addCourse(data: CourseData(name: nameInput, holes: holes))
            updateMainView()
            self.presentationMode.wrappedValue.dismiss()
        } else {
            self.showAlert = true
        }

    }
    
    func addHole() {
        if let num = Int(holeInput) {
            holes.append(num)
        }
        
        self.holeInput = ""

    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Course name")
                         .font(.headline)
                    Spacer()
                }
            
                TextField("Enter course name", text: $nameInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }.padding()
            
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
                        Text("\(i + 1): Par \(self.holes[i])")
                    }.onDelete(perform: delete)
                }
            } else {
                Text("No holes added")
                    .font(.headline)
                Spacer()
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
        }.alert(isPresented: $showAlert) {
            Alert(title: Text("Empty course"), message: Text("You must enter course name and add atleast one hole"), dismissButton: .default(Text("Got it!")))
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
