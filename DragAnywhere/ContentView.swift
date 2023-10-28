//
//  ContentView.swift
//  DragAnywhere
//
//  Created by Adam Chen JingFan on 2023/10/27.
//

import SwiftUI
import AlertToast

struct ContentView: View {
    @State private var toggleAlive = getWindowDragGesture()
    
    @State private var showToast = false
    
    var body: some View {
        VStack {
            if toggleAlive {
                Spacer()
            }
            if !showToast {
                Text(toggleAlive ? "Drag Anywhere Enabled" : "Flip the switch to begin")
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                Toggle("", isOn: $toggleAlive)
                    .toggleStyle(.switch)
                    .shadow(color: .accentColor, radius: toggleAlive ? 8 : 0)
                    .scaleEffect(CGSize(width: 2.0, height: 2.0))
                    .padding(20)
                    .padding(.leading, -10)
                    .padding(.bottom, 20)
                if toggleAlive {
                    Text("Hold [Control] + [Command] to start dragging your windows around with mouse.")
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                    Spacer()
                    HStack(spacing: 0) {
                        Text("handy lil' switch by ")
                            .font(.caption)
                            .fontWeight(.light)
                        Link("Wind_Explorer", destination: URL(string: "https://github.com/wind-explorer")!)
                            .font(.caption)
                            .fontWeight(.light)
                        Text("❤️‍🔥")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                }
            }
        }
        .padding(20)
        .frame(width: 400, height: 300)
        .onChange(of: toggleAlive) { _, newState in
            showToast.toggle()
            modifyWindowDragGesture(newState)
        }
        .toast(isPresenting: $showToast, duration: 3){
            AlertToast(type: .regular,
                       title: "Log out and log in to take effect",
                       style: .style( titleFont:.system(size: 30))
            )
        }
    }
}

#Preview {
    ContentView()
}
