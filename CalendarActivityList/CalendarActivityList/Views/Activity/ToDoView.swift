//
//  ToDoView.swift
//  CalendarActivityList
//
//  Created by Matthew Togi on 02/05/23.
//

import SwiftUI

struct ToDoView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    var body: some View {
        NavigationStack {
            List {
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    ListViewRow(event: event, formType: $formType)
                    .swipeActions {
                        Button(role: .destructive) {
                            myEvents.delete(event)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
            .environmentObject(EventStore(preview: true))
    }
}
