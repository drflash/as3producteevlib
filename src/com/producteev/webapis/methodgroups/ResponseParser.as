package com.producteev.webapis.methodgroups
{
	import com.adobe.serialization.json.JSONDecoder;
	import com.adobe.utils.DateUtil;
	import com.producteev.webapis.Activity;
	import com.producteev.webapis.AuthResult;
	import com.producteev.webapis.Dashboard;
	import com.producteev.webapis.Label;
	import com.producteev.webapis.Note;
	import com.producteev.webapis.ProducteevError;
	import com.producteev.webapis.Task;
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
		
		/**
		 * Converts an user result XML object into an User instance
		 */
		public function parseUser(response:XML):User
		{
			var user:User = new User();
			user.time_signup = parseDate(response.@time_signup);
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
				colleague.time_signup = parseDate(u.@time_signup);
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
				colleague.time_signup = parseDate(u.@time_signup);
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
				dashboard.time_lastchange = parseDate(d.@time_lastchange);
				dashboard.title = d.@title;
				dashboard.write_ok = d.@write_ok;
				
				dashboards.push(dashboard);
			}
			
			return dashboards;
		}
		
		/**
		 * Converts an dashboard result XML object into an instance of Dashboard
		 */
		public function parseDashboard(response:XML):Dashboard
		{
			var dashboard:Dashboard = new Dashboard();
			dashboard.deleted = parseInt(response.@deleted);
			dashboard.id_creator = parseInt(response.@id_creator);
			dashboard.id_dashboard = parseInt(response.@id_dashboard);
			dashboard.smart_labels = parseInt(response.@smart_labels);
			dashboard.status = parseInt(response.@status);
			dashboard.time_lastchange = parseDate(response.@time_lastchange);
			dashboard.title = response.@title;
			dashboard.write_ok = response.@write_ok;
			
			for each(var u:XML in response.dashboard.accesslist)
			{
				dashboard.addUserToAccessList(parseUser(u));
			}
				
			return dashboard;
		}
		
		/**
		 * Converts an user result XML object into 
		 */
		public function parseDelete(response:XML):Boolean
		{
			if (response.@result == "TRUE")
				return true;
			else
				return false;
		}
		
		/**
		 * Converts a list of XML tasks object into an Array of Tasks instance 
		 */
		public function parseTasks(response:XML):Array /* of Tasks */
		{
			var tasks:Array = new Array();
			
			for each(var t:XML in response.task)
			{
				tasks.push(parseTask(t));
			}
			
			return tasks;		
		}
		
		public function parseTask(response:XML):Task
		{
			var task:Task = new Task();
			task.d = parseInt(response.@d);
			task.from = parseInt(response.@from);
			task.id_creator = parseInt(response.@id_creator);
			task.id_dashboard = parseInt(response.@id_dashboard);
			task.id_responsible = parseInt(response.@id_responsible);
			task.id_task = parseInt(response.@id_task);
			task.nb_new_note = parseInt(response.@nb_new_note);
			task.nb_note = parseInt(response.@nb_note);
			task.progression = parseInt(response.@progression);
			task.public_ = parseInt(response.@public);
			task.r = parseInt(response.@r);
			task.status = parseInt(response.@status);
			task.task_activities = parseInt(response.@task_activities);
			task.uid_lastchange = parseInt(response.@uid_lastchange);
			task.viewed = parseInt(response.@viewed);
			task.w = parseInt(response.@w);
			task.x = parseInt(response.@x);
			task.deadline = parseDate(response.@deadline);
			task.deleted = Boolean(parseInt(response.@deleted));
			task.reminder = parseInt(response.@reminder);
			task.star = parseInt(response.@star);
			task.time_created = parseDate(response.@time_created);
			task.time_lastchange = parseDate(response.@time_lastchange);
			task.time_public = parseDate(response.@time_public);
			task.time_status = parseDate(response.@time_status);
			task.title = response.@title;
			
			for each(var l:XML in response.labels.label)
			{
				task.addLabel(parseLabel(l));
			}
			
			for each(var n:XML in response.notes.note)
			{
				task.addNote(parseNote(n));
			}
			
			return task;
		}
		
		/**
		 * Converts a list of XML labels object into an Array of Label instance 
		 */
		public function parseLabels(response:XML):Array /* of Label */
		{
			var labels:Array = new Array();
			
			for each(var l:XML in response.label)
			{
				labels.push(parseLabel(l));
			}
			
			return labels;		
		}
		
		/**
		 * Converts a label XML into Label instance 
		 */
		public function parseLabel(response:XML):Label
		{
			var label:Label = new Label();
			label.color = response.@color;
			label.deleted = Boolean(parseInt(response.@deleted));
			label.from = parseInt(response.@from);
			label.id_creator = parseInt(response.@id_creator);
			label.id_dashboard = parseInt(response.@id_dashboard);
			label.id_label = parseInt(response.@id_label);
			label.order = parseInt(response.@order);
			label.order_position = parseInt(response.@order_position);
			label.time_create = parseDate(response.@time_create);
			label.time_lastchange = parseDate(response.@time_lastchange);
			label.title = response.@title;
			label.type = parseInt(response.@type);
			label.x = parseInt(response.@x);
			label.y = parseInt(response.@y);
			
			return label;
		}
		
		/**
		 * Converts a list of XML notes object into an Array of Note instance 
		 */
		public function parseNotes(response:XML):Array /* of Note */
		{
			var notes:Array = new Array();
			
			for each(var n:XML in response.note)
			{
				notes.push(parseNote(n));
			}
			
			return notes;		
		}
		
		/**
		 * Converts a note XML into Note instance 
		 */
		public function parseNote(response:XML):Note
		{
			var n:Note = new Note();
			n.deleted = Boolean(parseInt(response.@deleted));
			n.file_name = response.@file_name;
			n.file_url = response.@file_url;
			n.id_creator = parseInt(response.@id_creator);
			n.id_note = parseInt(response.@id_note);
			n.id_task_exec = parseInt(response.@id_task_exec);
			n.message = response.@message;
			n.time_create = parseDate(response.@time_create);
			n.time_lastchange = parseDate(response.@time_lastchange);
			
			return n;
		}
		
		/**
		 * Converts a list of XML activities object into an Array of Activity instance 
		 */
		public function parseActivities(response:XML):Array /* of Activity */
		{
			var activities:Array = new Array();
			
			for each(var a:XML in response.activity)
			{
				activities.push(parseActivity(a));
			}
			
			return activities;		
		}
		
		/**
		 * Converts an activity XML into Activity instance 
		 */
		public function parseActivity(response:XML):Activity
		{
			var a:Activity = new Activity();
			a.id_activity = parseInt(response.@id_activity);
			a.id_creator = parseInt(response.@id_creator);
			a.id_task = parseInt(response.@id_task);
			a.message = response.@id_activity;
			a.time_create = parseDate(response.@time_create);
			
			return a;
		}
		
		private function parseDate(date:String):Date
		{
			if (date && date != "")
				return DateUtil.parseRFC822(date);
			else
				return null;
		}
	}
}