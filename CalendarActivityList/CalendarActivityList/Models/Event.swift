//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-28
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case location, outfit, photo, makeup, pose, props, unspecified
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .location:
                return "🏢"
            case .outfit:
                return "👗"
            case .photo:
                return "📸"
            case .makeup:
                return "💄"
            case .pose:
                return "🕺"
            case .props:
                return "🧳"
            case .unspecified:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    var dateEnd: Date
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String, dateEnd: Date) {
        self.eventType = eventType
        self.date = date
        self.dateEnd = dateEnd
//        self.test = test
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .location, date: Date().diff(numDays: 0), note: "List possible venues", dateEnd: Date().diff(numDays: 10)),
            Event(eventType: .outfit, date: Date().diff(numDays: 1), note: "List possible outfits", dateEnd: Date().diff(numDays: 11)),
            Event(eventType: .photo, date: Date().diff(numDays: 2), note: "List possible photographers", dateEnd: Date().diff(numDays: 12)),
            Event(eventType: .makeup, date: Date().diff(numDays: 3), note: "List possible make-up artists", dateEnd: Date().diff(numDays: 13)),
            Event(eventType: .pose, date: Date().diff(numDays: 4), note: "List possible poses", dateEnd: Date().diff(numDays: 14)),
            Event(eventType: .props, date: Date().diff(numDays: 5), note: "List possible props", dateEnd: Date().diff(numDays: 15)),
            Event(date: Date().diff(numDays: 6), note: "Miscellanous", dateEnd: Date().diff(numDays: 16))
        ]
    }
}
