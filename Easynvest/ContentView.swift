//
//  ContentView.swift
//  Easynvest
//
//  Created by Raphael Cerqueira on 02/06/21.
//

import SwiftUI

struct Page {
    var title: String
    var subtitle: String
}

struct ContentView: View {
    var screenWidth = UIScreen.main.bounds.width
    
    @State var xOffset: CGFloat = 0
    @State var currentPage = 0
    var totalPages = 3
    
    let pages = [
        Page(title: "Que bom que\nvocê está aqui", subtitle: "A Easynvest é um novo jeito de fazer seu dinheiro render mais."),
        Page(title: "Taxa zero em\nRenda Fixa", subtitle: "A maior corretora em Tesouro Direto, com taxa zero também em LCI, LCA, CDB, LC e COE."),
        Page(title: "Sem terno,\nsem gravata", subtitle: "Abra sua conta.\nGrátis para sempre.")
    ]
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                VStack {
                    Spacer()
                    
                    HStack {
                        ForEach(0 ..< pages.count) { i in
                            PageView(item: pages[i])
                                .frame(width: screenWidth)
                        }
                    }
                    
                    Spacer()
                    
                    ZStack(alignment: .bottom) {
                        YellowShape()
                            .fill(Color(#colorLiteral(red: 0.9949166179, green: 0.7323442101, blue: 0.0003615581954, alpha: 1)))
                            .frame(height: 340)
                        
                        PinkShape()
                            .fill(Color(#colorLiteral(red: 0.8582428694, green: 0.1550887227, blue: 0.5170849562, alpha: 1)))
                            .frame(height: 240)
                        
                        PurpleShape()
                            .fill(Color("purple"))
                            .frame(height: 188)
                    }
                }
                .frame(width: screenWidth * 3)
                .ignoresSafeArea(.all, edges: .bottom)
                .offset(x: xOffset)
                .background(Color(#colorLiteral(red: 0.9638815522, green: 0.9654683471, blue: 0.9256851673, alpha: 1)).ignoresSafeArea())
            }
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        xOffset = value.translation.width - (screenWidth * CGFloat(currentPage))
                    })
                    .onEnded({ value in
                        if -value.translation.width > screenWidth / 2 && currentPage < totalPages - 1 {
                            currentPage += 1
                        } else {
                            if value.translation.width > screenWidth / 2 && currentPage > 0 {
                                currentPage -= 1
                            }
                        }
                        
                        withAnimation {
                            xOffset = -screenWidth * CGFloat(currentPage)
                        }
                    })
        )
            
            VStack {
                Spacer()
                
                HStack {
                    ForEach(0 ..< 3) { i in
                        Circle()
                            .fill(i == currentPage ? Color("purple") : Color.gray)
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top, 60)
                
                Spacer()
                
                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        Text("Abrir conta")
                            .foregroundColor(Color("blue"))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .background(Capsule().strokeBorder(Color("blue"), lineWidth: 1))
                    })
                    
                    Button(action: {}, label: {
                        Text("Entrar")
                            .foregroundColor(Color("purple"))
                            .font(.title3)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .frame(height: 70)
                            .background(Capsule().fill(Color("blue")))
                    })
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PageView: View {
    var item: Page
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 40) {
                Text(item.title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("purple"))
                
                Text(item.subtitle)
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color("purple"))
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
