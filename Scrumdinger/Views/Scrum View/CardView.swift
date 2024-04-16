//
//  CardView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 05/04/2024.
//

import SwiftUI

struct CardView: View {
	let scrum: DailyScrum
	
    var body: some View {
		VStack(alignment: .leading) {
			Text(scrum.title)
				.font(.headline)
				.accessibilityAddTraits(.isHeader)
			Spacer()
			HStack {
				Label("\(scrum.attendees.count)", systemImage: "person.3")
					.accessibilityLabel("\(scrum.attendees.count) attendees")
				Spacer()
				Label("\(scrum.lengthInMinutes)", systemImage: "clock")
					.labelStyle(.trailingIcon)
					.accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
			}
			.font(.caption)
		}
		.padding()
		.foregroundStyle(scrum.theme.accentColor)
    }
}

#Preview {
	CardView(scrum: DailyScrum.sampleData[0])
		.previewLayout(.fixed(width: 400, height: 60))
		.background(DailyScrum.sampleData[0].theme.mainColor)
}
