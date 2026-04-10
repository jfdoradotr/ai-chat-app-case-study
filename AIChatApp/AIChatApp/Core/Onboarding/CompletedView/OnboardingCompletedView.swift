//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingCompletedView: View {
  var body: some View {
    VStack {
      Text("Onboarding Completed!")
        .frame(maxHeight: .infinity)

      Button {
        // TODO: Finish onboarding and enter app!
      } label: {
        Text("Finish")
          .font(.headline)
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity)
          .frame(height: 55)
          .background(.accent)
          .clipShape(.rect(cornerRadius: 16))
      }
    }
    .padding(16)
  }
}

#Preview {
  OnboardingCompletedView()
}
