//
//  TabBarView.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = TabbedItems.spin

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                WheelSpinView()
                    .tag(TabbedItems.spin)

                WheelHoldView()
                    .tag(TabbedItems.hold)

                RotateView()
                    .tag(TabbedItems.rotate)

                TrashView()
                    .tag(TabbedItems.trash)
            }
          
            HStack {
                ForEach(TabbedItems.allCases, id: \.self) { item in
                    Button {
                        selectedTab = item
                    } label: {
                        CustomTabItem(
                            imageName: item.iconName,
                            title: item.title,
                            isActive: (selectedTab == item)
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.horizontal, 26)
        }
    }
}

extension TabBarView {
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View {
        HStack() {
            VStack {
                Image(imageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(isActive ? backGroundColor : tabBarIconColor)
                    .frame(width: 30, height: 30)
                
                Text(title)
                    .font(.system(size: 14))
                    .foregroundColor(isActive ? backGroundColor : tabBarIconColor)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabBarView()
}
