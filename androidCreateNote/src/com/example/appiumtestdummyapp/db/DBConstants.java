package com.example.appiumtestdummyapp.db;

public interface DBConstants {

	public static final String _ID = "_id";
	public static final String ITEM = "item";

	String TABLE_TODO = "ToDoTable";

	String CREATE_TABLE_TODO_QUERY = "create table " + TABLE_TODO
			+ " ( " + ITEM + " text, " + _ID
			+ " integer primary key autoincrement)";

}
