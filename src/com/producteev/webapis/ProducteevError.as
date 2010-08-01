package com.producteev.webapis
{
	/**
	 * Contains the error message returned by the Producteev API
	 * on method calls.
	 */
	public class ProducteevError
	{
		private var _message:String;
		
		/**
		 * The error message returned from Producteev 
		 */
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