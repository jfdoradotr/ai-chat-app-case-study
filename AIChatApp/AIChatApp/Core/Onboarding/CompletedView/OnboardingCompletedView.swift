//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingCompletedView: View {
  var body: some View {
    VStack {
      Text("Onboarding Completed!")
        .frame(maxHeight: .infinity)

      Button("Finish") {
        // TODO: Finish onboarding and enter app
      }
      .buttonStyle(.primary)
    }
    .padding(16)
  }
}

#Preview {
  OnboardingCompletedView()
}
