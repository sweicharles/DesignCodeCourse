//
//  CoursesView.swift
//  DesignCodeCourse
//
//  Created by charles swei on 15/7/21.
//

import SwiftUI

struct CoursesView: View {
    // Set a default show value for State
    @State var show = false
    @Namespace var namespace
    
    
    var body: some View{
        ZStack {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(courses) { item in
                        CourseItem(course: item)
                            .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                            .frame(width: 335, height: 250)
                    }
                }
                .frame(maxWidth:.infinity)
            }
            if show {
                ScrollView {
                    CourseItem(course: courses[3])
                        .matchedGeometryEffect(id: courses[0].id, in: namespace)
                        .frame(height: 300)
                    VStack(spacing: 5){
                        ForEach(0 ..< 20) { item in
                            CourseRow()
                        }
                    }
                    .padding()
                }
                .background(Color("Background 1"))
                .transition(
                    .asymmetric(
                        insertion: AnyTransition
                            .opacity
                            .animation(
                                Animation.spring()
                                    .delay(0.3)),
                        removal: AnyTransition
                            .opacity
                            .animation(.spring())
                    )
                )
                .edgesIgnoringSafeArea(.all)
            }
            
        }
        .onTapGesture {
            withAnimation(.spring()){
                show.toggle()
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
 
