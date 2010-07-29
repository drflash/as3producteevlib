package com.producteev.webapis.methodgroups
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.producteev.webapis.AuthResult;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;

	public class ResponseParser
	{
		public function process(response:String,
								responseConstant:String,
								parseFunction:Function,
								propertyName:String):Object
		{
			
			
			var res:Object = processResponse(response, parseFunction, propertyName);
			return res;
		}
		
		private function processResponse(response:String, parseFunction:Function, propertyName:String):Object
		{
			var result:Object = new Object();
			result.data = new Object();
			
			// Use an XMLDocument to convert a string to XML
			var doc:XMLDocument = new XMLDocument();
			doc.ignoreWhite = true;
			doc.parseXML(response);
			
			// Get the root rsp node from the document
			var rsp:XMLNode = doc.firstChild;
			
			result.data[propertyName] = parseFunction(XML(rsp));
			
			return result;
		}
		
		public function parseLogin(response:XML):AuthResult
		{
			var auth:AuthResult = new AuthResult();
			auth.email = response.@email.toString();
			auth.token = response.@token.toString();
			
			return auth;
		}
		
		public function parseSignup(response:XML):Object
		{
			return null;
		}
	}
}