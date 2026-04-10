//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
  @Environment(AppState.self) private var appState
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    List {
      Button("Logout", action: onSignOutPressed)
    }
    .navigationTitle("Settings")
  }

  private func onSignOutPressed() {
    dismiss()

    Task {
      try? await Task.sleep(for: .seconds(0.3))
      await MainActor.run {
        appState.updateViewState(showTabBarView: false)
      }
    }
  }
}

#Preview {
  NavigationStack {
    SettingsView()
      .environment(AppState())
  }
}
