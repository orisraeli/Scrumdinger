//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Or Israeli on 16/04/2024.
//

import SwiftUI

struct SpeakerArc: Shape {
	let speakerIndex: Int
	let totalSpeakers: Int
	
	private var degreesPerSpeaker: Double {
		360 / Double(totalSpeakers)
	}
	
	private var startAngle: Angle {
		Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1)
	}
	
	private var endAngle: Angle {
		Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1)
	}
	
	func path(in rect: CGRect) -> Path {
		let diameter = min(rect.size.width, rect.size.height) - 24
		let radius = diameter / 2
		let center = CGPoint(x: rect.midX, y: rect.midY)
		
		var path = Path()
		path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
		
		return path
	}
}
