package com.producteev.webapis
{
	/**
	 * A class containing a token returned after a successful login
	 **/
	public class AuthResult
	{
		private var _email:String;
		private var _token:String
		
		/**
		 * email of the user
		 **/
		public function get email():String
		{
			return _email;
		}

		public function set email(value:String):void
		{
			_email = value;
		}

		/**
		 * The token for the logged in user
		 **/
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