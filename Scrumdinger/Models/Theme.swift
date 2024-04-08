//
//  Theme.swift
//  Scrumdinger
//
//  Created by Or Israeli on 05/04/2024.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
	case SDbubblegum
	case SDbuttercup
	case SDindigo
	case SDlavender
	case SDmagenta
	case SDnavy
	case SDorange
	case SDoxblood
	case SDperiwinkle
	case SDpoppy
	case SDpurple
	case SDseafoam
	case SDsky
	case SDtan
	case SDteal
	case SDyellow
	
	var accentColor: Color {
		switch self {
			case .SDbubblegum, .SDbuttercup, .SDlavender, .SDorange, .SDperiwinkle, .SDpoppy, .SDseafoam, .SDsky, .SDtan, .SDteal, .SDyellow:
				return .black
			case .SDindigo, .SDmagenta, .SDnavy, .SDoxblood, .SDpurple:
				return .white
		}
	}
	
	var mainColor: Color {
		Color(rawValue)
	}
	
	var name: String {
		rawValue.trimmingPrefix("SD").capitalized
	}
	
	var id: String {
		name
	}
}
