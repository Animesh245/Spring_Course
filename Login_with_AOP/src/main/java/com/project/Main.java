package com.project;

public class Main
{
    public static void main(String[] args)
    {

        AccountService service = new AccountService();

        service.withdraw(100);
        service.deposit(2000);
    }
}
