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
	 * Broadcast as a result of the show_list method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "labels" array of Label instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="labelsShowList", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
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
	[Event(name="labelsView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the delete method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "labels" boolean containing the result of the deletion
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="labelsDelete", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the tasks method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "labels" array of Task instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="labelsTasks", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_title method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "labels" Label instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="labelsSetTitle", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	
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
		
		/**
		 * get a label     
		 *
		 * @param id_label
		 *  
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/view
		 */
		public function view(id_label:int):void
		{
			call(VIEW, viewHandler, [new NameValuePair("id_label", id_label)]);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_VIEW,
				_resultParser.parseLabel);
		}
		
		/**
		 * delete a label    
		 *
		 * @param id_label id of the label
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/delete
		 */
		public function remove(id_label:int):void
		{
			call(DELETE, deleteHandler, [new NameValuePair("id_label", id_label)]);
		}
		
		private function deleteHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_DELETE,
				_resultParser.parseDelete);
		}
		
		/**
		 * get every task for a given label     
		 *
		 * @param id_label id of the label
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/tasks
		 */
		public function tasks(id_label:int):void
		{
			call(TASKS, tasksHandler, [new NameValuePair("id_label", id_label)]);
		}
		
		private function tasksHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_TASKS,
				_resultParser.parseTasks);
		}
		
		/**
		 * change the title of the label      
		 *
		 * @param title
		 * @param id_label id of the label
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#labels/set_title
		 */
		public function set_title(title:String, id_label:int):void
		{
			call(SET_TITLE, setTitleHandler, [
												new NameValuePair("id_label", id_label),
												new NameValuePair("title", title)
											]);
		}
		
		private function setTitleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.LABELS_SET_TITLE,
				_resultParser.parseLabel);
		}
	}
}