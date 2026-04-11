//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct CarouselView: View {
  @State private var selection: AvatarModel?

  var items: [AvatarModel] = .preview

  var body: some View {
    VStack(spacing: 12) {
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
            .id(item)
          }
        }
      }
      .frame(height: 200)
      .scrollIndicators(.hidden)
      .scrollTargetLayout()
      .scrollTargetBehavior(.paging)
      .scrollPosition(id: $selection)
      .onChange(of: items.count, { _, _ in
        updateSelectionIfNeeded()
      })
      .onAppear {
        updateSelectionIfNeeded()
      }

      HStack(spacing: 8) {
        ForEach(items, id: \.self) { item in
          Circle()
            .fill(item == selection ? .accent : .secondary)
            .frame(width: 8, height: 8)
        }
      }
      .animation(.linear, value: selection)
    }
  }

  private func updateSelectionIfNeeded() {
    if selection == nil || selection == items.last {
      selection = items.first
    }
  }
}

#Preview {
  CarouselView()
    .padding()
}
