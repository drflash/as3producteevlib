package com.producteev.webapis
{
	public class ProducteevError
	{
		private var _message:String;
		
		public function ProducteevError()
		{
		}

		public function get message():String
		{
			return _message;
		}

		public function set message(value:String):void
		{
			_message = value;
		}

	}
}