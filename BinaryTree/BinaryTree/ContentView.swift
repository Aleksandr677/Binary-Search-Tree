//
//  ContentView.swift
//  BinaryTree
//
//  Created by Христиченко Александр on 2023-02-23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var tree = BinaryTree()
    @State private var key: Int? = nil
    @State private var textString: String = ""
    
    //MARK: - BODY
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    if tree.root != nil {
                        treeStructure
                    } else {
                        emptyView
                    }
                } //VStack
                
                //Search desired key
                searchTextField
                
                //Add node
                addNode
                
                //Delete node
                deleteNode
                
                //Find node
                findNode
                
                //Reset tree
                resetTree
                Spacer()
            } //VStack
        } //Scroll
        .padding(.horizontal)
    }
    
    //private functions
    private func setUpTree(key: Int) {
        tree.insert(key: key)
    }
}

//MARK: - PREIVEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: - EXTENTION
extension ContentView {
    private var treeStructure: some View {
        VStack(spacing: 10) {
            //Root
            Text(String(tree.root?.key ?? 0))
                .padding(6)
                .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                .foregroundColor(key == tree.root?.key ? .green : .black)
            HStack(spacing: 20) {
                VStack {
                    //Root left
                    Text(String(tree.root?.left?.key ?? 0))
                        .padding(6)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                        .foregroundColor(key == tree.root?.left?.key ? .green : .black)
                    
                    HStack(spacing: 20) {
                        //Root left left
                        Text(String(tree.root?.left?.left?.key ?? 0))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                            .foregroundColor(key == tree.root?.left?.left?.key ? .green : .black)
                        //Root left right
                        Text(String(tree.root?.left?.right?.key ?? 0))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                            .foregroundColor(key == tree.root?.left?.right?.key ? .green : .black)
                    } //HStack
                } //VStack
                VStack {
                    //Root right
                    Text(String(tree.root?.right?.key ?? 0))
                        .padding(6)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                        .foregroundColor(key == tree.root?.right?.key ? .green : .black)
                    HStack(spacing: 20) {
                        //Root right left
                        Text(String(tree.root?.right?.left?.key ?? 0))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                            .foregroundColor(key == tree.root?.right?.left?.key ? .green : .black)
                        //Root right right
                        Text(String(tree.root?.right?.right?.key ?? 0))
                            .padding(6)
                            .background(RoundedRectangle(cornerRadius: 15).stroke(style: StrokeStyle(lineWidth: 2)))
                            .foregroundColor(key == tree.root?.right?.right?.key ? .green : .black)
                    } //HStack
                } //VStack
            } //HStack
        } //VStack
        .frame(height: 300)
    }
    
    private var emptyView: some View {
        VStack(spacing: 10) {
            Image(systemName: "exclamationmark.bubble")
            Text("There is no any nodes in here.")
        }
        .font(.title2)
        .frame(height: 300)
    }
    
    private var searchTextField: some View {
        TextField("Type your node's key...", text: $textString)
            .padding()
            .background(
                Color.gray
                    .opacity(0.3)
                    .cornerRadius(15)
            )
            .keyboardType(.decimalPad)
    }
    
    private var addNode: some View {
        Button(action: {
            key = Int(textString) ?? 0
            if let key = key {
                tree.insert(key: key)
                textString = ""
            }
        }, label: {
            Text("Add node")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
        .disabled(textString.isEmpty ? true : false)
        .opacity(textString.isEmpty ? 0.5 : 1.0)
        .padding(8)
        .background(
            Color.accentColor
                .cornerRadius(10)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }
    
    private var deleteNode: some View {
        Button(action: {
            key = Int(textString) ?? 0
            if let key = key {
                tree.delete(key: key)
                textString = ""
            }
        }, label: {
            Text("Delete node")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
        .disabled(textString.isEmpty ? true : false)
        .opacity(textString.isEmpty ? 0.5 : 1.0)
        .padding(8)
        .background(
            Color.accentColor
                .cornerRadius(10)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }
    
    private var findNode: some View {
        Button(action: {
            if !textString.isEmpty {
                key = tree.find(key: Int(textString) ?? 0) ?? 0
            }
        }, label: {
            Text("Find node")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
        .disabled(textString.isEmpty ? true : false)
        .opacity(textString.isEmpty ? 0.5 : 1.0)
        .padding(8)
        .background(
            Color.accentColor
                .cornerRadius(10)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }
    
    private var resetTree: some View {
        Button(action: {
            tree = BinaryTree()
        }, label: {
            Text("Reset Tree")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
        })
        .disabled(tree.root == nil ? true : false)
        .opacity(tree.root == nil ? 0.5 : 1.0)
        .padding(8)
        .background(
            Color.accentColor
                .cornerRadius(10)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }
}
