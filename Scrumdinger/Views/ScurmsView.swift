//
//  ScurmsView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 05/04/2024.
//

import SwiftUI

struct ScurmsView: View {
	let scrums: [DailyScrum]
	
    var body: some View {
		NavigationStack {
			List(scrums) { scrum in
				NavigationLink(destination: DetailView(scrum: scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: {}) {
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
    }
}

#Preview {
	NavigationStack {
		ScurmsView(scrums: DailyScrum.sampleData)
	}
}
