// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// 0xBF77293F2166B6Dd5292325Dd76D0d0fC14996F0
contract peerTwopeerShop{
    address public owner;
    //  mapping имя: payments -- для хранения данных о покупателях
    mapping (address => uint) public payments;

    // инстанцирование класса при разворачивании ск в сети блокчейн
    // конструктор: разворачивается единожды -- при разворачивании ск в сети блокчейн
    constructor(){
        // sender: return: адрес отправителя первого сигнала/ сообщения msg
        owner = msg.sender;
    }
    
    // оплата за покупку -- функция вызывается на этапе чекаута
    // модификатор payable -- функция для приема денежных средств
    // зачисление средств на счет ск
    function payForItem() public payable {
        // обращение к транзации через msg
        payments[msg.sender] = msg.value;
        }

    function withdrawAll {
        // для получение средств со счета ск создается временный адрес _to
        // owner маркируется как payable и помещается в вдрес _to

        address payable _to = payable (owner);
        // сведения об адресе ск запрашиваются через ключ.слово this
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }
}
