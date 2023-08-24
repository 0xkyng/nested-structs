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

    // Function to add a new task to a project
    function createProject(uint256 projectId, uint256 taskId, string memory description, address assigneeAddress, string memory assigneeName) public {
        Project storage project = projects[projectId];
        Task storage task = project.tasks[taskId];
        task.description = description;
        task.status = TaskStatus.Pending;
        task.assignee = Assignee(assigneeAddress, assigneeName);
    }

    // Function to update the status of a task in a project
    function updateTaskStatus(uint256 projectId, uint256 taskId, TaskStatus status) public {
        projects[projectId].tasks[taskId].status = status;
    }

     
    // Function to retrieve information about a task in a project
    function getTaskInfo(uint256 projectId, uint256 taskId) public view returns (string memory description, TaskStatus status, address assigneeAddress, string memory assigneeName) {
        Task storage task = projects[projectId].tasks[taskId];
        return (task.description, task.status, task.assignee.assigneeAddress, task.assignee.name);
    }
    
    
}
