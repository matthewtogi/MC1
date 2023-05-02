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
    var name: String
    var id: String
    var dateEnd: Date
    var isCompleted: Bool
    var description: String
    
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

    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, name: String, dateEnd: Date, isCompleted: Bool, description: String) {
        self.eventType = eventType
        self.date = date
        self.dateEnd = dateEnd
        self.isCompleted = isCompleted
        self.name = name
        self.id = id
        self.description = description
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .location, date: Date().diff(numDays: -10), name: "Venue", dateEnd: Date().diff(numDays: -3), isCompleted: true, description: "List possible venues"),
            Event(eventType: .outfit, date: Date().diff(numDays: -9), name: "Outfit", dateEnd: Date().diff(numDays: -2), isCompleted: true, description: "List possible outfits"),
            Event(eventType: .photo, date: Date().diff(numDays: -8), name: "Photographer", dateEnd: Date().diff(numDays: -1), isCompleted: false, description: "List possible photographers"),
            Event(eventType: .makeup, date: Date().diff(numDays: 3), name: "Make-up", dateEnd: Date().diff(numDays: 13), isCompleted: false, description: "List possible make-up artists"),
            Event(eventType: .pose, date: Date().diff(numDays: 4), name: "Pre-wedding Pose", dateEnd: Date().diff(numDays: 14), isCompleted: false, description: "List possible poses"),
            Event(eventType: .props, date: Date().diff(numDays: 5), name: "Props", dateEnd: Date().diff(numDays: 15), isCompleted: false, description: "List possible props"),
            Event(date: Date().diff(numDays: 6), name: "Miscellanous", dateEnd: Date().diff(numDays: 16), isCompleted: false, description: "List random things")
        ]
    }
}
