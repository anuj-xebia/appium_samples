package com.example.appiumtestdummyapp.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DBAdapter implements DBConstants {

	private static final String TAG = "DBAdapter";
	private static final String DATABASE_NAME = "AppiumTestApp";
	private static final int DATABASE_VERSION = 1;

	private final Context context;
	private DatabaseHelper DBHelper;
	public SQLiteDatabase db;

	public DBAdapter(Context ctx) {
		this.context = ctx;
		DBHelper = new DatabaseHelper(context);
	}

	private static class DatabaseHelper extends SQLiteOpenHelper {
		Context ctx;

		DatabaseHelper(Context context) {

			super(context, DATABASE_NAME, null, DATABASE_VERSION);
			ctx = context;

		}

		@Override
		public void onCreate(SQLiteDatabase db) {
			try {

				db.execSQL(DBConstants.CREATE_TABLE_TODO_QUERY);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		@Override
		public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
			 db.execSQL("DROP TABLE IF EXISTS "
			 + DBConstants.TABLE_TODO);
		}
	}

	public void deleteAllItemsFromTable(String tableName) {
		db.execSQL("delete  from " + tableName);
	}

	// ---opens the database---
	public DBAdapter open() throws SQLException {
		db = DBHelper.getWritableDatabase();
		return this;
	}

	// ---closes the database---
	public void close() {
		DBHelper.close();
	}
	
	public long insertIntoToDoTable(String itemName){
		ContentValues values = new ContentValues();
		values.put(ITEM, itemName);
		return db.insert(TABLE_TODO, null, values);
	}

	public Cursor executeRawQuery(String TableName, String columnName,
			String value) {
		return db.rawQuery("select * from " + TableName + " where "
				+ columnName + " = ?", new String[] { value });
	}

	public Cursor executeRawQuery(String query, String[] selectionArgs) {
		return db.rawQuery(query, selectionArgs);
	}

}
