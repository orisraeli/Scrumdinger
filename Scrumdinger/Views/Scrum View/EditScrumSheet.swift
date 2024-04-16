//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Or Israeli on 13/04/2024.
//

import SwiftUI

struct EditScrumSheet: View {
	@Binding var scrum: DailyScrum
	@Binding var isPresentingSheet: Bool

	var body: some View {
		NavigationStack {
			DetailEditView(scrum: $scrum)
				.navigationTitle(scrum.title)
				.toolbar {
					ToolbarItem(placement: .cancellationAction) {
						Button("Cancel") { isPresentingSheet = false }
					}
					ToolbarItem(placement: .confirmationAction) {
						Button("Done") {
							isPresentingSheet = false
						}
					}
				}
		}
    }
}

#Preview {
	EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), isPresentingSheet: .constant(true))
}
