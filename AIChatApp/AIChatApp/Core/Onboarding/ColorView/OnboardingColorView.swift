//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingColorView: View {
  var body: some View {
    ScrollView {
      LazyVGrid(
        columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
        alignment: .center,
        spacing: 16,
        pinnedViews: [.sectionHeaders],
        content: {
          Section {
            ForEach(0..<20) { index in
              Circle()
            }
          } header: {
            Text("Select a profile color")
              .font(.headline)
          }
        }
      )
    }
  }
}

#Preview {
  OnboardingColorView()
}
