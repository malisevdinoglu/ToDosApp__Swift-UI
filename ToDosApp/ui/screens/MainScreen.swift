//
//  MainScreen.swift
//  ToDosApp
//
//  Created by Kasım on 4.09.2025.
//

import SwiftUI

//left - start - leading
//right - end - trailing
//maxWidth: .infinity,maxHeight: .infinity -> match parent - match constraint (Bulunduğu alan kadar yayıl)

struct MainScreen: View {
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(AppColors.mainColor)
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(AppColors.white),
            .font: UIFont(name: "oswald", size: 22)!
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(AppColors.white),
            .font: UIFont(name: "oswald", size: 32)!
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        print("init metodu çalıştı")
        //Sayfa açıldığında bir kere çalışır.
    }
    
    @State private var toDosList = [ToDos]()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            Group {
                if toDosList.isEmpty {
                    Text("No ToDos Yet !").foregroundStyle(AppColors.textColor)
                }else{
                    List{
                        ForEach(toDosList){ toDo in
                            NavigationLink(destination: UpdateScreen(toDo : toDo)){
                                ToDoListItem(toDo: toDo)
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("ToDos")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: SaveScreen()){
                        Image(systemName: "plus").foregroundColor(AppColors.white)
                    }
                }
            }
            .onAppear {
                var list = [ToDos]()
                let toDo1 = ToDos(id: 1, name: "Buy a plane ticket", image: "roket")
                let toDo2 = ToDos(id: 2, name: "Join the meeting", image: "damla")
                let toDo3 = ToDos(id: 3, name: "Go to gym", image: "simsek")
                list.append(toDo1)
                list.append(toDo2)
                list.append(toDo3)
                toDosList = list
            }
        }
        .tint(AppColors.white)
        .searchable(text: $searchText,prompt: "Search")
        .onChange(of: searchText){ _,result in
            print("ToDos Search : \(result)")
        }
    }
    
    func delete(at offsets: IndexSet){
        let toDo = toDosList[offsets.first!]
        toDosList.remove(at: offsets.first!)
        print("ToDo Delete : \(toDo.id!)")
    }
}

#Preview {
    MainScreen()
}

