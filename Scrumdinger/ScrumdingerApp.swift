//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Or Israeli on 04/04/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
	@StateObject private var store = ScrumStore()
	@State private var errorWrapper: ErrorWrapper?
	
    var body: some Scene {
        WindowGroup {
			ScurmsView(scrums: $store.scrums) {
				Task {
					do {
						try await store.save(store.scrums)
					} catch {
						errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
					}
				}
			}
				.task {
					do {
						try await store.load()
					} catch {
						errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
					}
				}
				.sheet(item: $errorWrapper) {
					store.scrums = DailyScrum.sampleData
				} content: { wrapper in
					ErrorView(errorWrapper: wrapper)
				}
        }
    }
}
