// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedStructs {
    
    // Enumeration to represent the status of a task
    enum TaskStatus { 
        Pending, 
        InProgress, 
        Completed 
        }
    
    // Struct representing information about a task assignee
    struct Assignee {
        address assigneeAddress;
        string name;
    }
    
    // Struct representing information about a task
    struct Task {
        string description;
        TaskStatus status;
        Assignee assignee;
    }
    
    // Struct representing information about a project
    struct Project {
        string name;
        mapping(uint256 => Task) tasks; // Mapping of task IDs to Task structs
    }
    
    // Mapping of project IDs to Project structs
    mapping(uint256 => Project) projects;
    
    
}