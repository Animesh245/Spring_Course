package com.project;

public class AccountService
{
    @Audit(role = "ROLE_ADMIN")
    public void withdraw(int amount)
    {
        System.out.println("Withdraw amount is : "+ amount);
    }

    @Audit(role = "ROLE_USER")
    public void deposit(int amount)
    {
        System.out.println("Deposited amount is : "+ amount);
    }
}
