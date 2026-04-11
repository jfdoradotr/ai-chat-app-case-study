//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingCompletedView: View {
  @Environment(AppState.self) private var appState

  @State private var isCompletingProfileSetup = false

  private let selectedColor: Color?

  init(selectedColor: Color?) {
    self.selectedColor = selectedColor
  }

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("Setup complete!")
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundStyle(selectedColor ?? .accent)
      Text("We've set up your profile and you're ready to start chatting.")
        .font(.title)
        .fontWeight(.medium)
        .foregroundStyle(.secondary)
    }
    .frame(maxHeight: .infinity)
    .safeAreaInset(edge: .bottom, content: {
      ctaButton
    })
    .padding(16)
  }

  private var ctaButton: some View {
    Button {
      onFinishButtonPressed()
    } label: {
      ZStack {
        if isCompletingProfileSetup {
          ProgressView()
            .tint(.white)
        } else {
          Text("Continue")
        }
      }
    }
    .buttonStyle(.primary)
  }

  private func onFinishButtonPressed() {
    isCompletingProfileSetup = true
    Task {
      try await Task.sleep(for: .seconds(3))
      isCompletingProfileSetup = false
      appState.updateViewState(showTabBarView: true)
    }
  }
}

#Preview {
  OnboardingCompletedView(selectedColor: .orange)
    .environment(AppState())
}
