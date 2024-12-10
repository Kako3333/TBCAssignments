//
//  ContentView.swift
//  Assignment29
//
//  Created by Gio Kakaladze on 08.12.24.
//

import SwiftUI

struct WorkingExperience {
    let companyName: String
    let role: String
    let duration: String
}

struct ContentView: View {
    let bio: [String] = ["iOS Developer", "Swift Enthusiast", "Tech Lover"]
    
    @State private var experiences: [WorkingExperience] = [
        WorkingExperience(companyName: "HDR Solutions Inc.", role: "iOS Developer", duration: "2021 - Present"),
        WorkingExperience(companyName: "TBC", role: "Tech Support", duration: "2021 - 2024")
    ]
    
    @State private var companyName: String = ""
    @State private var role: String = ""
    @State private var duration: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    Circle()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                    Image("pfp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 102, height: 102)
                        .clipShape(Circle())
                        .padding()
                }
                Text("John Doe")
                    .textModifier(color: .black, weight: .semibold, size: 24)
                HStack(spacing: 2) {
                    ForEach(0..<bio.count, id: \.self) { index in
                        Text(bio[index])
                            .textModifier(color: Color(hex: "#6E6464"), weight: .semibold, size: 15)
                            .opacity(0.5)
                        
                        if index < bio.count - 1 {
                            Text("|")
                                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 15)
                                .opacity(0.5)
                        }
                    }
                }
                .padding(.top, 1)
                
                Text("Work Experience")
                    .textModifier(color: .black, weight: .semibold, size: 22)
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 16)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(experiences, id: \.companyName) { experience in
                            WorkingExperienceView(experience: experience)
                        }
                    }
                    .frame(maxHeight: CGFloat(experiences.count * 150))
                }
                .frame(height: 150)
                
                ZStack {
                    VStack(spacing: 10) {
                        Text("Add New Working Experience:")
                            .textModifier(color: .black, weight: .semibold, size: 17)
                            .padding(.trailing, 60)
                            .padding(.top, 40)
                        
                        VStack(alignment: .leading) {
                            Text("COMPANY")
                                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 12)
                            TextField("Enter Company Name", text: $companyName)
                                .frame(height: 30)
                                .frame(width: 280)
                                .textModifier(color: Color(hex: "#DBDBDB"), weight: .regular, size: 12)
                                .padding(.leading, 12)
                                .background(Color.white)
                                .cornerRadius(4)
                        }
                        VStack(alignment: .leading) {
                            Text("ROLE")
                                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 12)
                            TextField("Enter Role", text: $role)
                                .frame(height: 30)
                                .frame(width: 280)
                                .textModifier(color: Color(hex: "#DBDBDB"), weight: .regular, size: 12)
                                .padding(.leading, 12)
                                .background(Color.white)
                                .cornerRadius(4)
                        }
                        VStack(alignment: .leading) {
                            Text("DURATION")
                                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 12)
                            TextField("Enter Duration", text: $duration)
                                .frame(height: 30)
                                .frame(width: 280)
                                .textModifier(color: Color(hex: "#DBDBDB"), weight: .regular, size: 12)
                                .padding(.leading, 12)
                                .background(Color.white)
                                .cornerRadius(4)
                                .padding(.bottom, 10)
                        }
                        
                        Button(action: {
                            let newExperience = WorkingExperience(companyName: companyName, role: role, duration: duration)
                            experiences.append(newExperience)
                            companyName = ""
                            role = ""
                            duration = ""
                        }) {
                            Text("Add Experience")
                                .foregroundColor(.white)
                                .frame(width: 280, height: 40)
                                .background(Color(hex: "#3B775B"))
                                .cornerRadius(8)
                                .shadow(radius: 5)
                                .padding(.bottom, 40)
                        }
                    }
                    .frame(width: 351, height: 300)
                    .background(Color(hex: "#DCDCDC"))
                    .cornerRadius(24)
                    .padding(.top, 5)
                }
            }
            .padding()
        }
    }
}

struct WorkingExperienceView: View {
    let experience: WorkingExperience
    
    var body: some View {
        VStack(spacing: 8) {
            Text(experience.companyName)
                .textModifier(color: .black, weight: .semibold, size: 17)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.leading, 5)
            Text(experience.role)
                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 15)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(experience.duration)
                .textModifier(color: Color(hex: "#6E6464"), weight: .regular, size: 15)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(width: 351, height: 140)
        .background(Color(hex: "#DCDCDC"))
        .cornerRadius(24)
    }
}
#Preview {
    ContentView()
}
