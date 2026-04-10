//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

actor ImageCache {
  static let shared = ImageCache()

  private let fileManager = FileManager.default
  private let cacheDirectory: URL
  private var memoryCache: [String: Image] = [:]

  private init() {
    let caches = fileManager.urls(for: .cachesDirectory, in: .userDomainMask)[0]
    cacheDirectory = caches.appendingPathComponent("ImageCache", isDirectory: true)
    try? fileManager.createDirectory(at: cacheDirectory, withIntermediateDirectories: true)
  }

  func image(for url: URL) async -> Image? {
    let key = cacheKey(for: url)

    if let cached = memoryCache[key] {
      return cached
    }

    let filePath = cacheDirectory.appendingPathComponent(key)
    guard fileManager.fileExists(atPath: filePath.path), let data = try? Data(contentsOf: filePath), let uiImage = UIImage(data: data) else {
      return nil
    }

    let image = Image(uiImage: uiImage)
    memoryCache[key] = image
    return image
  }

  func store(_ data: Data, for url: URL) {
    let key = cacheKey(for: url)
    let filePath = cacheDirectory.appendingPathComponent(key)
    try? data.write(to: filePath)

    if let uiImage = UIImage(data: data) {
      memoryCache[key] = Image(uiImage: uiImage)
    }
  }

  private func cacheKey(for url: URL) -> String {
    url.absoluteString
      .data(using: .utf8)!
      .base64EncodedString()
      .replacingOccurrences(of: "/", with: "_")
  }
}
