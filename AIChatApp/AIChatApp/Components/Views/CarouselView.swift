//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct CarouselView: View {
  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack {
        ForEach(0..<5) { index in
          Rectangle()
            .fill(index % 2 == 0 ? Color.red : Color.blue)
            .containerRelativeFrame(.horizontal, alignment: .center)
        }
      }
    }
    .frame(height: 200)
    .scrollIndicators(.hidden)
    .scrollTargetLayout()
    .scrollTargetBehavior(.paging)
  }
}

#Preview {
  CarouselView()
}
