//
// Created for UICalendarView_SwiftUI
// by Stewart Lynch on 2022-06-29
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct ListViewRow: View {
    @State var event: Event
    @Binding var formType: EventFormType?
    var body: some View {
        HStack {
            HStack() {
                Image(systemName: event.isCompleted ? "checkmark.square" : "square")
                    .font(.system(size: 22))
                    .onTapGesture {
                        event.isCompleted.toggle()
                    }
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(event.eventType.icon)
                            .font(.system(size: 17))
                        Text(event.name)
                            .font(.system(size: 17))
                    }
                    
                    Text(event.description)
                        .font(.system(size: 12))
                }
//                HStack{
//                    Text(
//                        event.date.formatted(.dateTime.day().month().year())
//                    )
//                    Text("-")
//                    Text(
//                        event.dateEnd.formatted(.dateTime.day().month().year())
//                    )
//                }
                
                
                
            }
            Spacer()
            Button {
                formType = .update(event)
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
        }
        
    }
}

struct ListViewRow_Previews: PreviewProvider {
    static let event = Event(eventType: .location, date: Date(), name: "Venue", dateEnd: Date().diff(numDays: -3), isCompleted: true, description: "List possible venues")
    static var previews: some View {
        ListViewRow(event: event, formType: .constant(.new))
    }
}
