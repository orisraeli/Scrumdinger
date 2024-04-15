//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Or Israeli on 15/04/2024.
//

import SwiftUI

struct ErrorView: View {
	@Environment(\.dismiss) private var dismiss
	
	let errorWrapper: ErrorWrapper
	
	var body: some View {
		NavigationStack {
			VStack {
				Text("An error has occured!")
					.font(.title)
					.padding(.bottom)
				Text(errorWrapper.error.localizedDescription)
					.font(.headline)
				Text(errorWrapper.guidance)
					.font(.caption)
					.padding(.top)
				Spacer()
			}
			.padding()
			.background(.ultraThinMaterial)
			.clipShape(RoundedRectangle(cornerRadius: 16))
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button("Dismiss") { dismiss() }
				}
			}
		}
	}
}

#Preview {
	enum SampleError: Error {
		case errorRequired
	}
	
	var wrapper: ErrorWrapper {
		ErrorWrapper(error: SampleError.errorRequired, guidance: "You can safely ignore this error.")
	}
	
	return ErrorView(errorWrapper: wrapper)
}
