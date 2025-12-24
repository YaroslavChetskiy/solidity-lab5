// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Task_01 {
   // Константа
   uint256 public constant MAX_USERS = 100;


   // Перечисление
   enum UserRole { Admin, User, Guest }


   // Структура
   struct User {
       address userAddress;
       UserRole role;
       uint8 balance;
   }


   // Маппинг для хранения пользователей (storage)
   mapping(address => User) private users;


   // Массив для хранения адресов пользователей (storage)
   address[] private userAddresses;


   // Функция для добавления пользователя (public)
   function addUser (address _userAddress, UserRole _role) public {
       require(userAddresses.length < MAX_USERS, "Max users limit reached.");
       require(users[_userAddress].userAddress == address(0), "User  already exists.");


       // Создание нового пользователя (storage)
       users[_userAddress] = User(_userAddress, _role, 0);
       userAddresses.push(_userAddress); // storage
   }


   // Функция для получения информации о пользователе (memory)
   function getUser (address _userAddress) public view returns (User  memory) {
       return users[_userAddress]; // возвращаем структуру из storage в memory
   }


   // Функция для обновления баланса пользователя (public)
   function updateBalance(address _userAddress, uint8 _newBalance) public {
       require(users[_userAddress].userAddress != address(0), "User  does not exist.");
       users[_userAddress].balance = _newBalance; // storage
   }


   // Функция для получения всех пользователей (memory)
   function getAllUsers() public view returns (address[] memory) {
       return userAddresses; // возвращаем массив из storage в memory
   }


   // Функция для получения информации о пользователе с использованием calldata (external)
   function getUserInfo(address _userAddress) external view returns (User  memory userInfo) {
       userInfo = users[_userAddress]; // возвращаем структуру из storage
       return userInfo;
   }


   // Функция, которая принимает массив адресов, сортирует его и возвращает
   function returnSortedAddresses(address[] calldata addresses) external pure returns (address[] memory) {
       address[] memory sortedAddresses = new address[](addresses.length);
      
       // Копируем адреса из calldata в memory
       for (uint256 i = 0; i < addresses.length; i++) {
           sortedAddresses[i] = addresses[i];
       }


       // Сортировка пузырьком
       for (uint256 i = 0; i < sortedAddresses.length; i++) {
           for (uint256 j = 0; j < sortedAddresses.length - 1; j++) {
               if (sortedAddresses[j] > sortedAddresses[j + 1]) {
                   // Меняем местами
                   address temp = sortedAddresses[j];
                   sortedAddresses[j] = sortedAddresses[j + 1];
                   sortedAddresses[j + 1] = temp;
               }
           }
       }


       return sortedAddresses; // возвращаем отсортированный массив адресов
   }


   // Внутренняя функция для проверки существования пользователя (internal)
   function userExists(address _userAddress) internal view returns (bool) {
       return users[_userAddress].userAddress != address(0);
   }


   // Приватная функция для очистки пользователя (private)
   function deleteUser (address _userAddress) private {
       require(userExists(_userAddress), "User  does not exist.");
       delete users[_userAddress]; // Удаление пользователя из storage
       // Удаление из массива адресов (можно реализовать по-разному)
       for (uint256 i = 0; i < userAddresses.length; i++) {
           if (userAddresses[i] == _userAddress) {
               userAddresses[i] = userAddresses[userAddresses.length - 1];
               userAddresses.pop();
               break;
           }
       }
   }


  // Вопрос №6
  uint8 public count;
  // Конструктор, который инициализирует значение
   constructor() {
       count = 255; // Начальное значение, максимальное для uint8
   }
  // Функция для увеличения значения count
  function increment() public {
     count += 1; // Увеличиваем значение на 1
  }
}