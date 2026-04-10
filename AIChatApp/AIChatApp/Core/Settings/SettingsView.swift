//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  @Environment(AppState.self) private var appState

  var body: some View {
    List {
      Button("Logout", action: onSignOutPressed)
    }
    .navigationTitle("Settings")
  }

  private func onSignOutPressed() {
    appState.updateViewState(showTabBarView: false)
  }
}

#Preview {
  NavigationStack {
    SettingsView()
      .environment(AppState())
  }
}
