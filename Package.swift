// swift-tools-version:5.3

// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
    name: "GoogleMapsUtils",
    products: [
        .library(name: "GoogleMapsUtils", targets: ["GoogleMapsUtils"])
    ],
    targets: [
        .binaryTarget(
            name: "GoogleMapsUtils",
            url: "https://github.com/ArshAulakh59/google-maps-ios-utils/releases/download/v3.8.4/GoogleMapsUtils.xcframework.zip",
            checksum: "808bb7c9dfa5804629f40294aa9ba5ca172bad09edf1e3851dc3b18e0fa9816a"
        )
    ]
)
