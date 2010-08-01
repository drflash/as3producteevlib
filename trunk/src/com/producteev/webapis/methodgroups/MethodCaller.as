package com.producteev.webapis.methodgroups
{
	import com.adobe.crypto.MD5;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.producteevservice_internal;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class MethodCaller
	{
		
		/**
		 * Reusable method that the "method group" classes can call to invoke a
		 * method on the API.
		 *
		 * @param The service containing the API credentials
		 * @param methodName The name of the method to invoke
		 * @param callBack The function to be notified when the RPC is complete
		 * @param params An array of NameValuePair or primitive elements to pass
		 *			as parameters to the remote method
		 */
		public function call(service:ProducteevService, 
							 methodName:String,
							 callback:Function,
							 parameters:Array):void
		{
			var parameters:Array = addKeyAndTokenToParameters(parameters, service.apiKey, service.token);
			addMD5SignatureToParameters(parameters, service.apiSecret);
			callMethod(service, methodName, constructQuery(parameters), callback);
		}
		
		private function addKeyAndTokenToParameters(parameters:Array, apiKey:String, token:String):Array
		{
			if (!parameters)
				parameters = new Array();
			
			parameters.push(new NameValuePair("api_key", apiKey));
			
			if (token)
				parameters.push(new NameValuePair("token", token));
			
			return parameters;
			
		}
			
		private function addMD5SignatureToParameters(parameters:Array, apiSecret:String):void
		{
			parameters.sortOn("name");
			
			var sig:String = "";
			for (var i:int; i < parameters.length; i++)
			{
				sig += NameValuePair(parameters[i]).name + NameValuePair(parameters[i]).value;
			}
			sig += apiSecret;
			
			parameters.push(new NameValuePair("api_sig", MD5.hash(sig)));
		}
		
		private function constructQuery(parameters:Array):String
		{
			var ret:String = "?";
			
			for (var i:int = 0; i < parameters.length; i++)
			{
				ret += NameValuePair(parameters[i]).name + "=" + NameValuePair(parameters[i]).value;
				if (i < (parameters.length-1))
					ret += "&";
			}
			
			return ret;
		}
		
		private function callMethod(service:ProducteevService, methodName:String, query:String, callBack:Function):void
		{
			var loader:URLLoader = service.producteevservice_internal::urlLoader;
			loader.addEventListener(Event.COMPLETE, callBack);
			
			if (methodName == "users/login")
				loader.addEventListener(IOErrorEvent.IO_ERROR, callBack)
			else
				loader.addEventListener(IOErrorEvent.IO_ERROR, service.dispatchError);
			
			loader.load(new URLRequest(ProducteevService.END_POINT+methodName+".xml"+query));
		}
							 
	}
}