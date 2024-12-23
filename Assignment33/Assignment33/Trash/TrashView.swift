//
//  TrashView.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
//
import SwiftUI

struct TrashView: View {
    @StateObject var viewModel = TrashViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backGroundColor.edgesIgnoringSafeArea(.all)
                
                Image("fileIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width * 0.4, height: geometry.size.width * 0.4)
                    .opacity(viewModel.isCollided ? 0 : 1)
                    .position(x: viewModel.xPos1, y: viewModel.yPos1)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                viewModel.updatePosition(fileX: value.location.x, fileY: value.location.y)
                            })
                    )
                
                Image("trashFill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .position(x: viewModel.xPos2, y: viewModel.yPos2)
                    .onAppear {
                        viewModel.onAppear(geometry: geometry)
                    }
            }
            .padding(.bottom)
        }
    }
}

#Preview {
    TrashView()
}
