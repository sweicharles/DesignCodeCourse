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
                    CourseItem() // aways put the geometry effect before the frame, the isSource prop define which one is original, so the effect and make another one as target
                        .matchedGeometryEffect(id: "Card", in: namespace, isSource: !show)
                        .frame(width: 335, height: 250)
                    
                    CourseItem()
                        .frame(width: 335, height: 250)
                }
                .frame(maxWidth:.infinity)
            }
            if show {
                ScrollView {
                    CourseItem()
                        .matchedGeometryEffect(id: "Card", in: namespace)
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
                    // Apply transaction animaiton on opacity style with spring style
                    // .asymmetric can let us decide what kinda a transition when get in and get out
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
 
