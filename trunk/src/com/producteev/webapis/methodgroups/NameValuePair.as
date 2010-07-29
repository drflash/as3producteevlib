package com.producteev.webapis.methodgroups
{
	public class NameValuePair
	{
		private var _name:String;
		private var _value:String;
		
		public function NameValuePair(name:String, value:*)
		{
			_name = name;
			_value = value;
		}

		public function get name():String
		{
			return _name;
		}

		public function get value():*
		{
			return _value;
		}

		public function set value(value:*):void
		{
			_value = value;
		}


	}
}