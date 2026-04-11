//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingColorView: View {
  private let profileColors: [Color] = [.red, .green, .orange, .blue, .mint, .purple, .cyan, .teal, .indigo]

  var body: some View {
    ScrollView {
      LazyVGrid(
        columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3),
        alignment: .center,
        spacing: 16,
        pinnedViews: [.sectionHeaders],
        content: {
          Section {
            ForEach(profileColors, id: \.self) { color in
              Circle()
                .fill(color)
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
