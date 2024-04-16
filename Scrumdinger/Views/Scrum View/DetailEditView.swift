//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 06/04/2024.
//

import SwiftUI

struct DetailEditView: View {
	@Binding var scrum: DailyScrum
	@State private var newAttendeeName = ""
	
    var body: some View {
		Form {
			Section("Meeting Info") {
				TextField("Title", text: $scrum.title)
				HStack {
					Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
						Text("Length")
					}
					.accessibilityValue("\(scrum.lengthInMinutes) minutes")
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
						.accessibilityHidden(true)
				}
				ThemePicker(selection: $scrum.theme)
			}
			
			Section("Attendees") {
				ForEach(scrum.attendees) { attendee in
					Text(attendee.name)
				}
				.onDelete { indicies in
					scrum.attendees.remove(atOffsets: indicies)
				}
				HStack {
					TextField("New Attendee", text: $newAttendeeName)
					Button {
						withAnimation {
							let attendee = DailyScrum.Attendee(name: newAttendeeName)
							scrum.attendees.append(attendee)
							newAttendeeName = ""
						}
					} label: {
						Image(systemName: "plus.circle.fill")
							.accessibilityLabel("Add attendee")
					}
					.disabled(newAttendeeName.isEmpty)
				}
			}
		}
    }
}

#Preview {
	DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
