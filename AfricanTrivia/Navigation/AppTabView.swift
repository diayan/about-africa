//
//  AppTabView.swift
//  AfricanTrivia
//
//  Created by diayan siat on 22/11/2025.
//

import SwiftUI

struct AppTabView: View {
    @State private var selectedTab: TabType = .today

    enum TabType {
        case today
        case practice
        case map
        case profile
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            TodayView()
                .tabItem {
                    Label("Today", systemImage: "sun.max.fill")
                }
                .tag(TabType.today)
            
            MapTabView()
                .tabItem {
                    Label("Explore", systemImage: "globe.europe.africa.fill")
                }
                .tag(TabType.map)

            PracticeView()
                .tabItem {
                    Label("Practice", systemImage: "gamecontroller.fill")
                }
                .tag(TabType.practice)


            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(TabType.profile)
        }
        .tint(.orange) // Africa theme accent color
        .modifier(LiquidGlassTabBarModifier())
    }
}

// MARK: - Liquid Glass Tab Bar Modifier

struct LiquidGlassTabBarModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 26, *) {
            content
                .tabBarMinimizeBehavior(.onScrollDown)
        } else {
            content
        }
    }
}

#Preview {
    AppTabView()
}
