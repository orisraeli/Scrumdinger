//
//  ScurmsView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 05/04/2024.
//

import SwiftUI

struct ScurmsView: View {
	@Binding var scrums: [DailyScrum]
	@State private var isPresentingNewScrumSheet = false
	
    var body: some View {
		NavigationStack {
			List($scrums) { $scrum in
				NavigationLink(destination: DetailView(scrum: $scrum)) {
					CardView(scrum: scrum)
				}
				.listRowBackground(scrum.theme.mainColor)
			}
			.navigationTitle("Daily Scrums")
			.toolbar {
				Button(action: { isPresentingNewScrumSheet = true }) {
					Image(systemName: "plus")
				}
				.accessibilityLabel("New Scrum")
			}
		}
		.sheet(isPresented: $isPresentingNewScrumSheet) {
			NewScrumSheet(scrums: $scrums, isPresentingSheet: $isPresentingNewScrumSheet)
		}
    }
}

#Preview {
	NavigationStack {
		ScurmsView(scrums: .constant(DailyScrum.sampleData))
	}
}
