package com.producteev.webapis.methodgroups
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.getClassByAlias;

	public class Users extends AbstractMethod
	{
		private static const PRE:String = "users/";
		private static const LOGIN:String = "login";
		private static const SIGNUP:String = "signup";
		
		public function Users(service:ProducteevService, methodCaller:MethodCaller, resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
		}
		
		public function login(email:String, password:String):void
		{
			call(PRE+LOGIN,
				 loginHandler, 
				[
					new NameValuePair("email", email),
					new NameValuePair("password", password)
				]
				);
								
		}
		
		private function loginHandler(event:Event):void
		{
			if (event is IOErrorEvent) //special treatment here because users/login returns a HTTP 401 error if credentials are wrong
			{
				var e:ProducteevResultEvent = new ProducteevResultEvent(ProducteevResultEvent.USERS_LOGIN);
				e.success = false;
				e.data = "Wrong credentials";
				
				dispatchEvent(e);
			}
			else
			{
				processAndDispatch(URLLoader(event.target).data,
					ProducteevResultEvent.USERS_LOGIN,
					_resultParser.parseLogin,
					"users"
				);
			}
			
		}
		
		public function signup(email:String, firstName:String, lastName:String, password:String, fbuid:Number=-1):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("email", email));
			params.push(new NameValuePair("firstName", firstName));
			params.push(new NameValuePair("lastName", firstName));
			params.push(new NameValuePair("password", password));
			
			if (fbuid > -1)
				params.push(new NameValuePair("fbuid", fbuid));
							
			call(PRE+SIGNUP,
				 signupHandler,
				 params);
				 
		}
		
		private function signupHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.USERS_SIGNUP,
				_resultParser.parseSignup,
				"users");
		}
	}
}