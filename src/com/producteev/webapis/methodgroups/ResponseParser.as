package com.producteev.webapis.methodgroups
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.adobe.utils.DateUtil;
	import com.producteev.webapis.AuthResult;
	import com.producteev.webapis.Dashboard;
	import com.producteev.webapis.ProducteevError;
	import com.producteev.webapis.User;
	
	import flash.xml.XMLDocument;
	import flash.xml.XMLNode;
	
	import mx.messaging.Producer;

	/**
	 * Parse an XML returned by Producteev after a method call.
	 */ 
	public class ResponseParser
	{
		/**
		 * Parse an XML and returns the parsed result to the method group caller
		 * 
		 * @param The XML response we got from the loader call
		 * @parseFunction The function to parse the response XML with 
		 * @propertName The property in event.data that the results should be placed
		 */
		public function process(response:String,
								parseFunction:Function,
								propertyName:String):Object
		{
			
			
			var res:Object = processResponse(response, parseFunction, propertyName);
			return res;
		}
		
		/**
		 * Reusable method that the "method group" classes can call
		 * to process the results of the Producteev method.
		 *
		 * @param The XML response we got from the loader call
		 * @param parseFunction The function to parse the response XML with
		 * @param propertyName The property in event.data that the results should be placed
		 */
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
			
			
			if (rsp.firstChild && rsp.firstChild.nodeName == "error" ) 
				return processError(result, XML(rsp.firstChild));
			else
				return processResult(result, parseFunction, propertyName, XML(rsp));
		}
		
		private function processError(result:Object, rsp:XML):Object
		{
			result.success = false;
			
			var error:ProducteevError = new ProducteevError();
			error.message = rsp.@message;
			result.data.error = error;
			
			return result;
		}
		
		private function processResult(result:Object, parseFunction:Function, propertyName:String, rsp:XML):Object
		{
			result.data[propertyName] = parseFunction(XML(rsp));
			result.success = true;
			return result;
		}
		
		/**
		 * Converts an auth result XML object into an AuthResult instance
		 */
		public function parseLogin(response:XML):AuthResult
		{
			var auth:AuthResult = new AuthResult();
			auth.email = response.@email.toString();
			auth.token = response.@token.toString();
			
			return auth;
		}
		
		public function parseSignup(response:XML):Object
		{
			return null
		}
		
		/**
		 * Converts an user result XML object into an User instance
		 */
		public function parseView(response:XML):User
		{
			var user:User = new User();
			user.time_signup = DateUtil.parseRFC822(response.@time_signup);
			user.avatar = response.@avatar;
			user.company = response.@company;
			user.default_dashboard = response.@default_dashboard;
			user.deleted = response.@deleted;
			user.email = response.@email;
			user.facebook_id = response.@facebook_id;
			user.firstName = response.@firstName;
			user.id_user = response.@id_user;
			user.lang = response.@lang;
			user.lastName = response.@lastName;
			user.sort_by = response.@sort_by;
			user.timezone = response.@timezone;
			
			for each (var u:XML in response.colleagues.user ) 
			{
				var colleague:User = new User();
				colleague.time_signup = DateUtil.parseRFC822(u.@time_signup);
				colleague.avatar = u.@avatar;
				colleague.company = u.@company;
				colleague.default_dashboard = u.@default_dashboard;
				colleague.deleted = u.@deleted;
				colleague.email = u.@email;
				colleague.facebook_id = u.@facebook_id;
				colleague.firstName = u.@firstName;
				colleague.id_user = u.@id_user;
				colleague.lang = u.@lang;
				colleague.lastName = u.@lastName;
				colleague.sort_by = u.@sort_by;
				colleague.timezone = u.@timezone;
				
				user.addColleague(colleague);
			}
			
			return user;
		}
		
		/**
		 * Converts an user result XML object into an array of User
		 */
		public function parseColleagues(response:XML):Array /* of User */ 
		{
			var colleagues:Array = new Array();
			
			for each (var u:XML in response.user ) 
			{
				var colleague:User = new User();
				colleague.time_signup = DateUtil.parseRFC822(u.@time_signup);
				colleague.avatar = u.@avatar;
				colleague.company = u.@company;
				colleague.default_dashboard = u.@default_dashboard;
				colleague.deleted = u.@deleted;
				colleague.email = u.@email;
				colleague.facebook_id = u.@facebook_id;
				colleague.firstName = u.@firstName;
				colleague.id_user = u.@id_user;
				colleague.lang = u.@lang;
				colleague.lastName = u.@lastName;
				colleague.sort_by = u.@sort_by;
				colleague.timezone = u.@timezone;
				
				colleagues.push(colleague);
			}
			
			return colleagues;
		}
		
		/**
		 * Converts an user result XML object into an array of Dashboards
		 */
		public function parseShowList(response:XML):Array /* of Dashboards */
		{
			var dashboards:Array = new Array();
			
			for each (var d:XML in response.dashboard) 
			{
				var dashboard:Dashboard = new Dashboard();
				dashboard.deleted = parseInt(d.@deleted);
				dashboard.id_creator = parseInt(d.@id_creator);
				dashboard.id_dashboard = parseInt(d.@id_dashboard);
				dashboard.smart_labels = parseInt(d.@smart_labels);
				dashboard.status = parseInt(d.@status);
				dashboard.time_lastchange = DateUtil.parseRFC822(d.@time_lastchange);
				dashboard.title = d.@title;
				dashboard.write_ok = d.@write_ok;
				
				dashboards.push(dashboard);
			}
			
			return dashboards;
		}
	}
}