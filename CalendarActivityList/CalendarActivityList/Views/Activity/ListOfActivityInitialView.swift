//
//  ListOfActivityInitialView.swift
//  CalendarActivityList
//
//  Created by Matthew Togi on 02/05/23.
//

import SwiftUI

struct ListOfActivityInitialView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    @State private var userSearch = ""
    
    var body: some View {
        NavigationView(){
            VStack{
                ToDoView()
                Button("Save Recommendations"){
                    
                }.buttonStyle(.bordered)
                
                .searchable(text: $userSearch, placement: .navigationBarDrawer(displayMode: .always))
            }
            .navigationTitle("List of Activity")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(item: $formType) { $0 }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Text("Add")
                    }
                }
            }
            .toolbarBackground( Color.white , for: .navigationBar)
        }
    }
}

struct ListOfActivityInitialView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfActivityInitialView()
            .environmentObject(EventStore(preview: true))
    }
}
