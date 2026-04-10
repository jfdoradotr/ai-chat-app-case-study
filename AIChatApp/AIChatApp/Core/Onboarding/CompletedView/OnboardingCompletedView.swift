//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingCompletedView: View {
  @Environment(AppState.self) private var appState

  var body: some View {
    VStack {
      Text("Onboarding Completed!")
        .frame(maxHeight: .infinity)

      Button("Finish", action: onFinishButtonPressed)
        .buttonStyle(.primary)
    }
    .padding(16)
  }

  private func onFinishButtonPressed() {
    // TODO: Other logic to complete onboarding
    appState.updateViewState(showTabBarView: true)
  }
}

#Preview {
  OnboardingCompletedView()
    .environment(AppState())
}
