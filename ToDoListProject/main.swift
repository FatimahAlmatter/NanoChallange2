//
//  main.swift
//  ToDoListProject
//
//  Created by Fatimah Almatter on 29/12/2021.
//

import Foundation

// create a new list to store tasks
var userChoice : String?
var taskList : [Task] = []

struct Task {
    var taskName : String
    var taskDate : String
}



repeat{
    print("-------- MENU --------")
    print("1. View all Tasks")
    print("2. Add New Task")
    print("3. Delete a Task")
    print("0. Exit the program")
    print("----------------------")
    print("Enter your choice: ")
    
    userChoice = readLine()
    
    switch userChoice {
    case "1" :
        viewAllTasks()
    case "2" :
        addTask()
    case "3" :
        DeleteTask()
    case "0" :
        exit(0)
    default:
        print("** Please enter a valid value **")
    }
    
} while userChoice != "1" || userChoice != "2" || userChoice != "3" || userChoice != "0"



func viewAllTasks(){
    if taskList.isEmpty {
        print("** Your list is empty **")
    } else {
        print("--------- To-Do List ---------")
        for (index, task) in taskList.enumerated() {
            print(String(index+1) + ":" + task.taskName + "," + task.taskDate)
        }
    }
}


func addTask(){
    print("-------- Add New Task --------")
    print("Enter task name:")
    if let taskName = readLine(){
        print("Enter task date:")
        if let taskDate = readLine(){
            let task = Task(taskName: taskName, taskDate: taskDate)
            taskList.append(task)
            print("\n** New task is added to the list **\n")
        }
    }
}


func DeleteTask(){
    viewAllTasks()
    print("-----------------------------")
    print("which task do you want to DELETE ?")
    if let choice = readLine() {
        if let userValue = Int(choice) {
            taskList.remove(at: userValue - 1)
        }
        print("\n** Task successfully deleted **\n")
    }
}
