// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedStructs {

    // Primary struct
    struct Project{
        string name;
        TaskStatus status;
        Task task;
    }

    enum TaskStatus {
        Uncompleted,
        Completed,
        Unasigned
    }


    struct Task {
        string description;
        bool IsAsigned;
        mapping (address => Asignee) addressToAsignee;
    }

    struct Asignee {
        string name;
        uint numbOfTask;
    
    }

    mapping (address => Project) projects;

    function createProject(
        string memory _projectName, 
        TaskStatus _status, 
        string memory _desc, 
        bool _true, 
        string memory asigname,
        uint _numTask ) public {
        Project storage newProject = projects[msg.sender];
        newProject.name = _projectName;
        newProject.status = _status;
        newProject.task.description = _desc;
        newProject.task.IsAsigned = _true;
        newProject.task.addressToAsignee[msg.sender].name = asigname;
        newProject.task.addressToAsignee[msg.sender].numbOfTask =_numTask;
    }

    function asigneeName() public view returns (string memory _name) {
        Project storage newProject = projects[msg.sender];
        _name = newProject.task.addressToAsignee[msg.sender].name;
        // _numTask = newProject.task.addressToAsignee[msg.sender].numbOfTask;
    }
 




    
    
    
   


    
    
}
