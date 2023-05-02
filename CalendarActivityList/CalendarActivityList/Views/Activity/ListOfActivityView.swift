//
//  ListOfActivityView.swift
//  CalendarActivityList
//
//  Created by Matthew Togi on 02/05/23.
//

import SwiftUI

struct ListOfActivityView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    @State private var currentState = 0
    @State private var userSearch = ""
    @State private var showSheet = false
    
    var body: some View {
        NavigationView(){
            VStack{
                Picker("Test", selection: $currentState) {
                    Text("To Do").tag(0)
                    Text("Late").tag(1)
                    Text("Done").tag(2)
                }
                .pickerStyle(.segmented)
                .padding()
                .searchable(text: $userSearch)
                containedView()
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
        }
        
    }
    
    func containedView() -> AnyView{
        switch currentState{
        case 0: return AnyView(ToDoView())
        case 1: return AnyView(LateView())
        case 2: return AnyView(DoneView())
        default:
            return AnyView(ToDoView())
        }
    }
}

struct ListOfActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfActivityView()
            .environmentObject(EventStore(preview: true))
    }
}
