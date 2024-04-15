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
	
    var body: some Scene {
        WindowGroup {
			ScurmsView(scrums: $store.scrums) {
				Task {
					do {
						try await store.save(store.scrums)
					} catch {
						fatalError(error.localizedDescription)
					}
				}
			}
				.task {
					do {
						try await store.load()
					} catch {
						fatalError(error.localizedDescription)
					}
				}
        }
    }
}
