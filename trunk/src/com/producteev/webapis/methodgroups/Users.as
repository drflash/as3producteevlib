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
	
	/**
	 * Broadcast as a result of the login method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "users" AuthResult instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="usersLogin", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	
	/**
	 * Broadcast as a result of the view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "users" User instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="usersView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the colleagues method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "users" Array of users instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="usersColleagues", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set default dashboard method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "users" User instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="usersSetDefaultDashboard", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	
	/**
	 * Contains the methods for the User method group in the Producteev API.
	 */
	public class Users extends AbstractMethod
	{
		private static const PRE:String = "users/";
		
		private static const LOGIN:String = "login";
		private static const SIGNUP:String = "signup";
		private static const VIEW:String = "view";
		private static const COLLEAGUES:String = "colleagues";
		private static const SET_DEFAULT_DASHBOARD:String = "set_default_dashboard";
		
		public function Users(service:ProducteevService, methodCaller:MethodCaller, 
							  resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
		}
		
		/**
		 * Sign in an user using producteev credentials 
		 *
		 * @param email
		 * @param password
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#users/login
		 */
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
		
		/**
		 * Signup an new user  
		 *
		 * @param email
		 * @param firstName
		 * @param lastName
		 * @param password
		 * @param fbuid Facebook UID
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#users/signup
		 */
		public function signup(email:String, firstName:String, lastName:String, 
							   password:String, fbuid:Number=-1):void
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
		
		
		/**
		 * Get a user 
		 *
		 * @param id_colleague (optional) an user can only see information about another user who is on the same 
		 * @param password
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#users/view
		 */
		public function view(id_colleague:int = -1):void
		{
			if (id_colleague > -1)
				call(PRE+VIEW,
					viewHandler,
					[new NameValuePair("id_colleague", id_colleague)]
					);
			else
				call(PRE+VIEW,
					viewHandler,
					null);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.USERS_VIEW,
				_resultParser.parseView,
				"users");
		}
		
		/**
		 * get information about other user you are sharing a workspace with  
		 *
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#users/colleagues
		 */
		public function colleagues():void
		{
			call(PRE+COLLEAGUES,
				colleaguesHandler,
				null);
		}
		
		private function colleaguesHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.USERS_COLLEAGUES,
				_resultParser.parseColleagues,
				"users");
		}
		
		/**
		 * Set default dashboard 
		 *
		 * @param id_dashboard id of the dashboard 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#users/set_default_dashboard
		 */
		public function setDefaultDashboard(id_dashboard:int):void
		{
			call(PRE+SET_DEFAULT_DASHBOARD,
				setDefaultDashboardHandler,
				[
					new NameValuePair("id_dashboard", id_dashboard)
				]
				);
		}
		
		private function setDefaultDashboardHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.USERS_SET_DEFAULT_DASHBOARD,
				_resultParser.parseView,
				"users");
		}
	}
}