//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Or Israeli on 13/04/2024.
//

import SwiftUI

struct NewScrumSheet: View {
	@Binding var scrums: [DailyScrum]
	@Binding var isPresentingSheet: Bool
	@State private var newScrum = DailyScrum.emptyScrum
	
    var body: some View {
		NavigationStack {
			DetailEditView(scrum: $newScrum)
				.toolbar {
					ToolbarItem(placement: .cancellationAction) {
						Button("Dismiss") { isPresentingSheet = false }
					}
					ToolbarItem(placement: .confirmationAction) {
						Button("Add") {
							scrums.append(newScrum)
							isPresentingSheet = false
						}
					}
				}
		}
    }
}

#Preview {
	NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingSheet: .constant(true))
}
