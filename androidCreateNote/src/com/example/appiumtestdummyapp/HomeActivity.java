package com.example.appiumtestdummyapp;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;
import android.widget.TextView;

import com.example.appiumtestdummyapp.Model.ToDo;
import com.example.appiumtestdummyapp.db.DBAdapter;
import com.example.appiumtestdummyapp.db.DBConstants;

public class HomeActivity extends Activity implements OnItemClickListener {
	ListView list;
	ArrayList<ToDo> items = new ArrayList<ToDo>();;
	CustomItemAdapter adapter;
	Button newBtn;
	private static final int REQ_CODE = 1;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_home);
		list = (ListView) findViewById(R.id.list);
		newBtn = (Button) findViewById(R.id.btnNewNote);
		items = getItems();
		adapter = new CustomItemAdapter(this, R.layout.list_item, items);
		list.setAdapter(adapter);
		list.setOnItemClickListener(this);
		
		newBtn.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View arg0) {
				// TODO Auto-generated method stub
				Intent i = new Intent(HomeActivity.this, AddNewItemActivity.class);
				startActivityForResult(i, REQ_CODE);
			}
		});
	}
	
	private void setListAdapter(){
		if(items != null){
			items.clear();
		}
		items = getItems();
		adapter = new CustomItemAdapter(this, R.layout.list_item, items);
		list.setAdapter(adapter);
	}
	
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		if(requestCode == REQ_CODE){
			if(resultCode == RESULT_OK){
				Log.i("HomeActiivty", "OnActivityResult");
				setListAdapter();
			}
		}
	}

	private ArrayList<ToDo> getItems() {
		String query = "select * from " + DBConstants.TABLE_TODO;
		DBAdapter adapter = new DBAdapter(this);
		adapter.open();
		Cursor c = adapter.executeRawQuery(query, null);
		while (c.moveToNext()) {
			items.add(new ToDo(c.getString(c.getColumnIndex(DBConstants.ITEM))));
		}
		adapter.close();

		return items;
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.home, menu);
		return true;
	}

	private class CustomItemAdapter extends ArrayAdapter {

		LayoutInflater inflater;
		int resId;

		public CustomItemAdapter(Context context, int resource, List objects) {
			super(context, resource, objects);
			inflater = LayoutInflater.from(context);
			resId = resource;

			// TODO Auto-generated constructor stub
		}

		@Override
		public View getView(int position, View convertView, ViewGroup parent) {
			ViewHolder holder = new ViewHolder();
			if (convertView == null) {
				convertView = inflater.inflate(resId, null);
				holder.itemText = (TextView) convertView
						.findViewById(R.id.tvItem);
				convertView.setTag(holder);
			} else {
				holder = (ViewHolder) convertView.getTag();
			}
			holder.itemText.setText(items.get(position).getItem());
			return convertView;
		}

		private class ViewHolder {
			TextView itemText;
		}

	}

	@Override
	public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {

	}

}
