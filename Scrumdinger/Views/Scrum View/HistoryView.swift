//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 17/04/2024.
//

import SwiftUI

struct HistoryView: View {
	let history: History
	
    var body: some View {
		ScrollView {
			VStack(alignment: .leading) {
				Divider()
					.padding(.bottom)
				Text("Attendees")
					.font(.headline)
				Text(history.attendeeString)
				
				if let transcript = history.transcript {
					Text("Transcript")
						.font(.headline)
						.padding(.top)
					Text(transcript)
				}
			}
		}
		.navigationTitle(Text(history.date, style: .date))
		.padding()
    }
}

#Preview {
	var history: History {
		History(attendees: [
			DailyScrum.Attendee(name: "Jon"),
			DailyScrum.Attendee(name: "Darla"),
			DailyScrum.Attendee(name: "Luis")
		],
				transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
	}
	
	return NavigationStack {
		HistoryView(history: history)
	}
}
