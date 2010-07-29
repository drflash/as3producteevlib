package com.producteev.webapis
{
	public class AuthResult
	{
		private var _email:String;
		private var _token:String
		
		public function AuthResult()
		{
		}

		public function get email():String
		{
			return _email;
		}

		public function set email(value:String):void
		{
			_email = value;
		}

		public function get token():String
		{
			return _token;
		}

		public function set token(value:String):void
		{
			_token = value;
		}


	}
}