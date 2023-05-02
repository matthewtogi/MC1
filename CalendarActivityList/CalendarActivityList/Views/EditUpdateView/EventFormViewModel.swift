//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

class EventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var dateEnd = Date()
    @Published var name = ""
    @Published var description = ""
    @Published var eventType: Event.EventType = .unspecified
    @Published var isCompleted = false

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ event: Event) {
        date = event.date
        dateEnd = event.dateEnd
        name = event.name
        eventType = event.eventType
        id = event.id
        isCompleted = event.isCompleted
    }

    var incomplete: Bool {
        name.isEmpty
    }
}
