//
//  ContentView.swift
//  Assignment1
//
//  Created by Gio Kakaladze on 06.12.24.
//
import SwiftUI

struct Person {
    let name: String
    let profession: String
    let skills: [String]
}

let setText = ""

struct ContentView: View {
    
    @State private var isOnline: Bool = false
    
    private var setText: String {
        isOnline ? "Set Offline" : "Set Online"
    }
    
    private var statusText: String {
        isOnline ? "Online" : "Offline"
    }
    
    private var statusColor: Color {
        isOnline ? Color(hex: "#008000") : Color(hex: "#FF0000")
    }

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(hex: "#0000FF").opacity(0.75),
                    Color(hex: "#800080").opacity(0.75)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
                    Image("pfp")
                        .scaledToFit()
                        .frame(width: 102, height: 102)
                        .clipShape(Circle())
                        .padding()
                    ZStack() {
                        Text(statusText)
                            .font(.system(size: 10, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .frame(width: 49, height: 20)
                    .background(statusColor)
                    .cornerRadius(12)
                    .padding(.leading, 10)
                    .position(x: 180, y: 120)
                }
                .padding(.top, 20)
                let johnDoe = Person(name: "John Doe", profession: "iOS Developer", skills: ["SwiftUI", "iOS Development", "Problem Solving", "UI/UX Design"])
                Text(johnDoe.name)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(johnDoe.profession)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.white)
                    .opacity(0.8)
                HStack(spacing: 30) {
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black.opacity(0.25))
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
                        Image("phone2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black.opacity(0.25))
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
                        Image("mail2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    ZStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.black.opacity(0.25))
                            .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 5)
                        Image("web2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 15)
                Text("Skills")
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 15)
                    .padding(.trailing, 200)
                
                
                VStack(alignment: .leading) {
                    ForEach(johnDoe.skills, id: \.self) { skill in
                        HStack {
                            Text("•")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .opacity(0.8)
                            Text(skill)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .foregroundColor(.white)
                                .opacity(0.9)
                        }
                        .padding(1)
                    }
                }
                .padding(.top, 10)
                .padding(.trailing, 120)
                ZStack {
                    HStack {
                        Text(setText)
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                        Toggle("", isOn: $isOnline)
                            .toggleStyle(SwitchToggleStyle())
                            .labelsHidden()
                            .frame(width: 60, height: 24)
                    }
                }
                .frame(width: 163, height: 44)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)
                .padding(.bottom, 20)
                .padding(.top, 20)
            }
        }
        .frame(width: 300, height: 500)
        .cornerRadius(20)
    }
}

#Preview {
    ContentView()
}
