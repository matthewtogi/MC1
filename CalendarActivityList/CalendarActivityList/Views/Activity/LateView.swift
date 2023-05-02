//
//  LateView.swift
//  CalendarActivityList
//
//  Created by Matthew Togi on 02/05/23.
//

import SwiftUI

struct LateView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    @State private var filteredEvents: [Event] = []
    var body: some View {

        NavigationStack {
            List {
                ForEach(filteredEvents.sorted {$0.date < $1.date }) { event in
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
        .onAppear {
            filteredEvents = myEvents.events.filter {
                !$0.isCompleted && ($0.dateEnd < Date())
            }
        }
    }
}

struct LateView_Previews: PreviewProvider {
    static var previews: some View {
        LateView()
            .environmentObject(EventStore(preview: true))
    }
}
