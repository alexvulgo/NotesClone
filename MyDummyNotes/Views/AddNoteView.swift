//
//  AddNoteView.swift
//  MyDummyNotes
//
//  Created by Alessandro Esposito Vulgo Gigante on 14/11/23.
//

import SwiftUI
import SwiftData

struct AddNoteView: View {
    //SwiftData Variable
    @Environment(\.modelContext) private var context
    @Query private var notes : [DataNote]
    
    //Text Editor Field
    @State private var additionalText : String = ""
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(){
                TextEditor(text: $additionalText)
                    .focused($isFocused)
            }
            
            
            .toolbar {
                
                ToolbarItem() {
                    Button("Done") {
                        saveText()
                        isFocused = false
                    }.bold()
                }
            }
        }
    }
    
    //Function for add the additional Text in a Note
    func saveText() {
        let note = DataNote(additionalText: additionalText)
        context.insert(note)
        
    }
}

#Preview {
    AddNoteView()
}
