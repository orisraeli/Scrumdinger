//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by Or Israeli on 15/04/2024.
//

import SwiftUI

@MainActor
class ScrumStore: ObservableObject {
	@Published var scrums: [DailyScrum] = []
	
	private static func fileURL() throws -> URL {
		try FileManager.default.url(for: .documentDirectory,
									in: .userDomainMask,
									appropriateFor: nil,
									create: false)
			.appending(component: "scrums.data")
	}
	
	func load() async throws {
		let task = Task<[DailyScrum], Error> {
			let path = try Self.fileURL()
			guard let data = try? Data(contentsOf: path) else {
				return []
			}
			
			let decoded = try JSONDecoder().decode([DailyScrum].self, from: data)
			return decoded
		}
		
		let scrums = try await task.value
		self.scrums = scrums
	}
	
	func save(_ scrums: [DailyScrum]) async throws {
		let task = Task {
			let encoded = try JSONEncoder().encode(scrums)
			let path = try Self.fileURL()
			try encoded.write(to: path)
		}
		
		_ = try await task.value
	}
}
