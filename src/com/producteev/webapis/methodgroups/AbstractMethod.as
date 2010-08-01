package com.producteev.webapis.methodgroups
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.EventDispatcher;

	/**
	 * Base class for all method group
	 */
	public class AbstractMethod extends EventDispatcher
	{
		/** 
		 * A reference to the ProducteevService that contains the api key
		 * and logic for processing API calls/responses
		 */
		protected var _service:ProducteevService;
		
		/** 
		 * A reference to the method caller 
		 */
		protected var _methodCaller:MethodCaller;
		
		/** 
		 * Parsing is delegated to the response parser 
		 */
		protected var _resultParser:ResponseParser;
		
		public function AbstractMethod(service:ProducteevService, methodCaller:MethodCaller, resultParser:ResponseParser)
		{
			_service = service;
			_methodCaller = methodCaller;
			_resultParser = resultParser;
		}
		
		/** 
		 * Constructs the query and make the server call
		 */
		protected function call(methodName:String,
								callback:Function,
								parameters:Array):void
		{
			_methodCaller.call(_service, methodName, callback, parameters);
		}
		
		/**
		 * Parse the result and dispatch an event containing the result
		 */
		protected function processAndDispatch(response:String,
											  responseConstant:String,
											  parseFunction:Function,
											  propertyName:String):void
		{
			var event:ProducteevResultEvent = new ProducteevResultEvent(responseConstant);
			var result:Object = _resultParser.process(response, parseFunction, propertyName);
			
			event.success = result.success;
			event.data = result.data;

			dispatchEvent(event);
		}
	}
}