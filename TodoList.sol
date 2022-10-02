// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TodoList {
    // Create a Todo struct for Todos.
    struct Todo {
        string text;
        bool isCompleted;
    }

    Todo[] public todos; // create an array of todos.

    // Create a new todo with the given _text.
    function create(string calldata _text) external {
        todos.push(Todo({text: _text, isCompleted: false}));
    }

    // Update the todo text for the given index with _text.
    function updateText(uint index, string calldata _text) external {
        Todo storage todo = todos[index];
        todo.text = _text;
    }

    // Get todo with the given index.
    function get(uint index) external view returns (string memory, bool) {
        Todo storage todo = todos[index]; // Reference the todo with the given index.
        return (todo.text, todo.isCompleted); // Return the todo.
    }

    // Toggle todo isCompleted with the given index.
    function toggleIsCompleted(uint index) external {
        todos[index].isCompleted = !todos[index].isCompleted; // Sets the opposite value of isCompleted if true, sets false vice versa.
    }
}
