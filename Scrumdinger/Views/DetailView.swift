//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 06/04/2024.
//

import SwiftUI

struct DetailView: View {
	@Binding var scrum: DailyScrum
	
	@State private var editingScrum = DailyScrum.emptyScrum
	@State private var isPresentingEditView = false
	
	var body: some View {
		List {
			Section("Meeting Info") {
				NavigationLink(destination: MeetingView(scrum: $scrum)) {
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
			
			Section("History") {
				if scrum.history.isEmpty {
					Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
				}
				
				ForEach(scrum.history) { history in
					HStack {
						Image(systemName: "calendar")
							.foregroundStyle(.link)
						Text(history.date, style: .date)
					}
				}
			}
		}
		.navigationTitle(scrum.title)
		.toolbar {
			Button("Edit") {
				isPresentingEditView = true
				editingScrum = scrum
			}
		}
		.sheet(isPresented: $isPresentingEditView) {
			EditScrumSheet(scrum: $editingScrum, isPresentingSheet: $isPresentingEditView)
				.onDisappear { scrum = editingScrum }
		}
	}
}

#Preview {
	NavigationStack {
		DetailView(scrum: .constant(DailyScrum.sampleData[0]))
	}
}
