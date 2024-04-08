//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Or Israeli on 04/04/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@State private var scrums = DailyScrum.sampleData
	
    var body: some Scene {
        WindowGroup {
			ScurmsView(scrums: $scrums)
        }
    }
}
