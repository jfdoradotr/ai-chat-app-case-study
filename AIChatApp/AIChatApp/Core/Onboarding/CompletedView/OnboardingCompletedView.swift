//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingCompletedView: View {
  @Environment(AppState.self) private var appState

  private let selectedColor: Color

  init(selectedColor: Color) {
    self.selectedColor = selectedColor
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Setup complete!")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundStyle(selectedColor)
      Text("We've set up your profile and you're ready to start chatting.")
        .font(.title)
        .fontWeight(.medium)
        .foregroundStyle(.secondary)
    }
    .frame(maxHeight: .infinity)
    .safeAreaInset(edge: .bottom, content: {
      Button("Finish", action: onFinishButtonPressed)
        .buttonStyle(.primary)
    })
    .padding(16)
  }

  private func onFinishButtonPressed() {
    // TODO: Other logic to complete onboarding
    appState.updateViewState(showTabBarView: true)
  }
}

#Preview {
  OnboardingCompletedView(selectedColor: .orange)
    .environment(AppState())
}
