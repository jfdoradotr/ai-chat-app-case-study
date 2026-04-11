//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct CarouselView: View {
  var items: [AvatarModel] = .preview

  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: 0) {
        ForEach(items, id: \.self) { item in
          HeroCellView(
            title: item.name,
            subtitle: item.characterDescription,
            imageUrl: item.profileImageUrl
          )
          .scrollTransition(.interactive.threshold(.visible(0.95)), transition: { content, phase in
            content
              .scaleEffect(phase.isIdentity ? 1 : 0.9)
          })
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
    .padding()
}
