package com.example.appiumtestdummyapp;

import com.example.appiumtestdummyapp.db.DBAdapter;
import com.example.appiumtestdummyapp.db.DBConstants;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class AddNewItemActivity extends Activity {
	EditText etItem;
	Button addItem;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_add_new_item);
		etItem = (EditText) findViewById(R.id.etItem);
		addItem = (Button) findViewById(R.id.btnAdd);
		addItem.setOnClickListener(new View.OnClickListener() {

			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				String itemText = etItem.getText().toString();
				if ("".equals(itemText)) {
					Toast.makeText(AddNewItemActivity.this,
							"Please enter some valid text", Toast.LENGTH_LONG)
							.show();
				} else {
					DBAdapter adapter = new DBAdapter(AddNewItemActivity.this);
					adapter.open();

					long i = adapter.insertIntoToDoTable(itemText);
					Log.i("Value inserted", i+"");
					adapter.close();
					setResult(RESULT_OK);
					finish();
				}
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.add_new_item, menu);
		return true;
	}

}
