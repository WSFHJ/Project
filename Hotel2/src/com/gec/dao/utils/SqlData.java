package com.gec.dao.utils;

import java.sql.SQLException;

public class SqlData {
	public String fields;
	public String values;
	public String condition;
	
	public boolean createId;
	
	String[] fieldArr;
	String[] valueArr;
	
	public int length = 0;
	
	public SqlData( String fields, String values, boolean createId ) 
			throws SQLException {
		fields = fields.replace(" ", "");
		//iTrace.print( "fields = "+ fields );
		
		values = values.replace(" ", "");
		//iTrace.print( "values = ["+ values +"]" );
		
		this.fields = fields;
		this.values = values;
		this.createId = createId;
		
		fieldArr = fields.split( "," );
		valueArr = values.split( "," );
		
		this.length = fieldArr.length;
		
		if( fieldArr.length != valueArr.length )
			throw new SQLException();
	}
	
	public String getField( int index ){
		index -= 1;
		if( index < 0 || index >= fieldArr.length )
			return "";
		return fieldArr[ index ];
	}
	
	public String getValue( int index ){
		index -= 1;
		if( index < 0 || index >= valueArr.length )
			return "";
		return valueArr[ index ];
	}
	
}
