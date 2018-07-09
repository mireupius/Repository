package com.sol.mall.sale.bank;

public interface BankMapper {
	public abstract int getNotCalMoney(Account a);

	public abstract int doCaculate(Account a);

	public abstract int regAccount(Account a);

	public abstract int modifyAccount(Account a);

	public abstract Account getAccount(Account a);
}
