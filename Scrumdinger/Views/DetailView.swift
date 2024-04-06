//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 06/04/2024.
//

import SwiftUI

struct DetailView: View {
	let scrum: DailyScrum
	
	var body: some View {
		List {
			Section("Meeting Info") {
				NavigationLink(destination: MeetingView()) {
					Label("Start Meeting", systemImage: "timer")
						.font(.headline)
						.foregroundStyle(.link)
				}
				HStack {
					Label("Length", systemImage: "clock")
					Spacer()
					Text("\(scrum.lengthInMinutes) minutes")
				}
				.accessibilityElement(children: .combine)
				
				HStack {
					Label("Theme", systemImage: "paintpalette")
					Spacer()
					Text(scrum.theme.name)
						.padding(4)
						.foregroundStyle(scrum.theme.accentColor)
						.background(scrum.theme.mainColor)
						.clipShape(RoundedRectangle(cornerRadius: 4))
				}
				.accessibilityElement(children: .combine)
			}
			
			Section("Attendees") {
				ForEach(scrum.attendees) { attendee in
					Label(attendee.name, systemImage: "person")
				}
			}
		}
		.navigationTitle(scrum.title)
	}
}

#Preview {
	NavigationStack {
		DetailView(scrum: DailyScrum.sampleData[0])
	}
}
