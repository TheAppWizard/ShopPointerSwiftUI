//
//  ContentView.swift
//  ShopPointerSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 04/03/22.

//  MARK: The App Wizard
//  Instagram :
//  MARK: @theappwizard2408


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            FinalView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




















struct FinalView: View {
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
            Image("bg")
                .resizable()
                .frame(width: 550, height: 850)
                .offset(x: 40, y: -220)
                
            ShopOptions()
            Pointer()
            
            
        }
    }
}

struct Pointer: View {
    @State private var tapone = false
    @State private var taptwo = false
    
    @State private var taponeAnim = false
    @State private var taptwoAnim = false
  
    var body: some View {
        ZStack{
            
            ZStack{
                
                
        Circle()
            .foregroundColor(.blue.opacity(0.3))
            .frame(width: 30, height: 30)
            .scaleEffect(taponeAnim ? 1 : 3)
                
            .onAppear() {
                withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                        {
                    taponeAnim.toggle()
                            }
                    }
                   
            Circle()
                .foregroundColor(.blue.opacity(0.3))
                .frame(width: 30, height: 30)
               
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .gesture(
                    TapGesture()
                        .onEnded({
                            self.tapone.toggle()
                        })
                
                
                )
                
                if tapone {
                    ToolTip(text: "Apple Keyboard",price: "700$")
                        .offset(x: 0, y: -90)
                }
                
                
               
             }
            .offset(x: -90, y: -160)
            
            
            ZStack{
                
                Circle()
                    .foregroundColor(.blue.opacity(0.3))
                    .frame(width: 30, height: 30)
                    .scaleEffect(taptwoAnim ? 1 : 3)
                        
                    .onAppear() {
                        withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                                {
                                    taptwoAnim.toggle()
                                    }
                            }
                
            Circle()
                .foregroundColor(.blue.opacity(0.3))
                .frame(width: 30, height: 30)
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .gesture(
                    TapGesture()
                        .onEnded({
                            self.taptwo.toggle()
                        })
                
                )
                
                if taptwo {
                    ToolTip(text: "Apple Mouse",price: "450$")
                        .offset(x: 0, y: -90)
                }
             }
            .offset(x: 90, y: 100)
        }
    }
}



struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}


struct ToolTip: View {
    
    @State var text = ""
    @State var price = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(width: 220, height: 80)
                .shadow(color: .black, radius: 3, x: 3, y: 3)
//                .overlay {
//                    RoundedRectangle(cornerRadius: 15).stroke(.blue, lineWidth: 2)
//                }
            
            Triangle()
                .fill(.white)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(180))
                .offset(x: 0, y: 40)
            
            
            
            Text(text)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(.black.opacity(0.7))
                .offset(x: 0, y: -13)
            
            Text(price)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .offset(x: 0, y: 15)
            
        }
        
    }
}








struct ShopOptions: View {
    
    
    @State private var heartTap = false
    
    let para = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tincidunt et metus mattis auctor."
  
    var body: some View {
        ZStack{
            
            
         
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 430, height: 350)
                .offset(x: 0, y: 320)
                .foregroundColor(.black)
            
            Text("BUY NOW")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 98, y: 400)
            
            Image(systemName: "chevron.right")
                  .resizable()
                  .frame(width: 18, height: 30)
                  .foregroundColor(.white)
                  .offset(x: 170, y: 400)
            
            
            VStack{
                
                HStack{
                
                    
                    Text("Keyboard and Mouse")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .offset(x: 0 , y: 320)
                    
                    
                
                    Spacer().frame(width: 100)
                    
                    ZStack{
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 30, height: 28)
                        .foregroundColor(.white)
                        .gesture(
                            TapGesture()
                                .onEnded({
                                    self.heartTap.toggle()
                                })
                        
                        )
                        
                        
                        if heartTap {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 30, height: 28)
                                .foregroundColor(.red)
                        }
                        
                    }
                        .offset(x: 0, y: 320)
                
                
                
                }
               

                Text(para)
                    .font(.title2)
                    .fontWeight(.light)
                    .foregroundColor(.white.opacity(0.8))
                    .padding()
                    .frame(width: 420, height: 200)
                    .offset(x: 0, y: 280)
                
    


            }.padding(20)
            
          
        }
    }
}
