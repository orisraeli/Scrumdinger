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
		List(scrums) { scrum in
			CardView(scrum: scrum)
				.listRowBackground(scrum.theme.mainColor)
		}
    }
}

#Preview {
	ScurmsView(scrums: DailyScrum.sampleData)
}
