package com.producteev.webapis.client
{
	import com.adobe.net.DynamicURLLoader;
	import com.adobe.webapis.URLLoaderBase;
	import com.producteev.webapis.events.ProducteevFaultEvent;
	import com.producteev.webapis.methodgroups.Dashboards;
	import com.producteev.webapis.methodgroups.MethodCaller;
	import com.producteev.webapis.methodgroups.ResponseParser;
	import com.producteev.webapis.methodgroups.Tasks;
	import com.producteev.webapis.methodgroups.Users;
	import com.producteev.webapis.producteevservice_internal;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;

	/**
	 * The Producteev class abstracts the Producteev API 
	 */
	public class ProducteevService extends URLLoaderBase
	{
		public static const END_POINT:String = "https://api.producteev.com/";
		
		private var _apiKey:String;
		
		private var _apiSecret:String;
		
		private var _token:String;
		
		private var _users:Users;
		
		private var _dashboards:Dashboards;
		
		private var _tasks:Tasks;
		
		public function ProducteevService(apiKey:String, apiSecret:String)
		{
			_apiKey = apiKey;
			_apiSecret = apiSecret;
			
			var methodCaller:MethodCaller = new MethodCaller();
			var responseParser:ResponseParser = new ResponseParser();
			
			_users = new Users(this, methodCaller, responseParser);
			_dashboards = new Dashboards(this, methodCaller, responseParser);
			_tasks = new Tasks(this, methodCaller, responseParser);
		}
		
		
		/**
		 * API key that should be used to access the Producteev service.
		 */
		public function get apiKey():String
		{
			return _apiKey;
		}

		public function set apiKey(value:String):void
		{
			_apiKey = value;
		}

		/**
		 * API secret that should be used to access the Producteev service.
		 */
		public function get apiSecret():String
		{
			return _apiSecret;
		}

		public function set apiSecret(value:String):void
		{
			_apiSecret = value;
		}
		
		producteevservice_internal function get urlLoader():URLLoader
		{
			var loader:URLLoader = new URLLoader();
			return loader;	
		}

		/**
		 * token received after a successfull login
		 * note that the token is not automatically setted after a login
		 * the developer should set it
		 */
		public function get token():String
		{
			return _token;
		}

		public function set token(value:String):void
		{
			_token = value;
		}

		/**
		 * Provide read-only access to the Users method group in the Producteev API
		 */
		public function get users():Users
		{
			return _users;
		}
		
		/**
		 * Provide read-only access to the Dashboards method group in the Producteev API
		 */
		public function get dashboards():Dashboards
		{
			return _dashboards;
		}
		
		/**
		 * Provide read-only access to the Tasks method group in the Producteev API
		 */
		public function get tasks():Tasks
		{
			return _tasks;
		}
		
		/**
		 * Dispatch an error if a method calls trigger an IOErrorEvent
		 **/
		public function dispatchError(event:IOErrorEvent):void
		{
			var e:ProducteevFaultEvent = new ProducteevFaultEvent(ProducteevFaultEvent.FAULT);
			e.data = event.text;
			dispatchEvent(e);
		}




	}
}