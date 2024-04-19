//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Nani on 4/13/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
