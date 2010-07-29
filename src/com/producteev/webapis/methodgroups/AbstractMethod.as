package com.producteev.webapis.methodgroups
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevFaultEvent;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.EventDispatcher;

	public class AbstractMethod extends EventDispatcher
	{
		protected var _service:ProducteevService;
		protected var _methodCaller:MethodCaller;
		protected var _resultParser:ResponseParser;
		
		public function AbstractMethod(service:ProducteevService, methodCaller:MethodCaller, resultParser:ResponseParser)
		{
			_service = service;
			_methodCaller = methodCaller;
			_resultParser = resultParser;
		}
		
		protected function call(methodName:String,
								callback:Function,
								parameters:Array):void
		{
			_methodCaller.call(_service, methodName, callback, parameters);
		}
		
		protected function processAndDispatch(response:String,
											  responseConstant:String,
											  parseFunction:Function,
											  propertyName:String):void
		{
			var event:ProducteevResultEvent = new ProducteevResultEvent(responseConstant);
			event.data = _resultParser.process(response, responseConstant, parseFunction,
											 	propertyName).data;

			dispatchEvent(event);
		}
	}
}