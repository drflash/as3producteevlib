package com.producteev.webapis.methodgroups
{
	import com.adobe.utils.DateUtil;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	/**
	 * Broadcast as a result of the create method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "labels" Label instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="labelsCreate", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	
	/**
	 * Contains the methods for the Labels method group in the Producteev API.
	 */
	public class Labels extends AbstractMethod
	{
		private static const CREATE:String = "create";
		private static const VIEW:String = "view";
		private static const SHOW_LIST:String = "show_list";
		private static const SET_TITLE:String = "set_title";
		private static const DELETE:String = "delete";
		private static const TASKS:String = "tasks";
		
		public function Labels(service:ProducteevService, methodCaller:MethodCaller, resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
			pre = "labels/";
			objectResultName = "labels";
		}
		
		/**
		 * create a label
		 *
		 * @param title title of the task
		 * @param id_dashboard (optional) 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/create
		 */
		public function create(title:String, id_dashboard:int):void
		{
			call(CREATE, createHandler, [
											new NameValuePair("title", title),
										 	new NameValuePair("id_dashboard", id_dashboard)
										]);
		}
		
		private function createHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_CREATE,
				_resultParser.parseLabel);
		}
		
		/**
		 * get every labels for a given workspace    
		 *
		 * @param id_dashboard 
		 * @param (optional) if not null, the function only returns tasks modified or created since this date  
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/show_list
		 */
		public function show_list(id_dashboard:int, since:Date=null):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("id_dashboard", id_dashboard));

			if (since != null)
				params.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			
			call(SHOW_LIST, showListHandler, params);
		}
		
		private function showListHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_SHOW_LIST,
				_resultParser.parseLabels);
		}
	}
}