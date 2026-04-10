//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @State private var showSettingsView: Bool = false

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .navigationTitle("Profile")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          settingsButton
        }
      }
      .sheet(isPresented: $showSettingsView) {
        Text("Settings")
      }
  }

  private var settingsButton: some View {
    Button(action: onSettingsButtonPressed) {
      Label("Settings", systemImage: "gear")
    }
  }

  private func onSettingsButtonPressed() {
    showSettingsView = true
  }
}

#Preview {
  NavigationStack {
    ProfileView()
  }
}
