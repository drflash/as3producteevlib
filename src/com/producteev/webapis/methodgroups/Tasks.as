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
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksCreate", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" array of Tasks instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the show_list method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" array of Tasks instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksShowList", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_title method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetTitle", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_status method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetStatus", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_star method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetStar", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_responsible method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetResponsible", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the unset_responsible method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksUnsetResponsible", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_reminder method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetReminder", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_deadline method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetDeadline", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Contains the methods for the Tasks method group in the Producteev API.
	 */
	public class Tasks extends AbstractMethod
	{
		private static const PRE:String = "tasks/";
		
		private static const CREATE:String = "create";
		private static const VIEW:String = "view";
		private static const SHOW_LIST:String = "show_list";
		private static const SET_TITLE:String = "set_title";
		private static const SET_STATUS:String = "set_status";
		private static const SET_STAR:String = "set_star";
		private static const SET_RESPONSIBLE:String = "set_responsible";
		private static const UNSET_RESPONSIBLE:String = "unset_responsible";
		private static const SET_DEADLINE:String = "set_deadline";
		private static const SET_REMINDER:String = "set_reminder";
		private static const DELETE:String = "delete";
		private static const ACCESS:String = "access";
		private static const LABELS:String = "labels";
		private static const SET_LABEL:String = "set_label";
		private static const UNSET_LABEL:String = "unset_label";
		private static const SET_WORKSPACE:String = "set_workspace";
		private static const NOTE_VIEW:String = "note_view";
		private static const NOTES_GET:String = "notes_get";
		private static const NOTE_CREATE:String = "note_create";
		private static const NOTE_DELETED:String = "note_deleted";
		private static const ACTIVITY_VIEW:String = "activity_view";
		private static const SHOW_LIST_ACTIVITIES:String = "show_list_activities";
		
		public function Tasks(service:ProducteevService,
							  methodCaller:MethodCaller,
							  resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
			pre = "tasks/";
			objectResultName = "tasks";
		}
		
		/**
		 * create a taks  
		 *
		 * @param title title of the task
		 * @param id_responsible(optional) 
		 * @param id_dashboard (optional) 
		 * @param deadline (optional)
		 * @param reminder (optional)
		 * @param status (optional)
		 * @param star (optional)
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/create
		 */
		public function create(title:String, id_dashboard:int = -1,
							   	id_responsible:int = -1,
								deadline:Date=null,
								reminder:int = -1, status:int = -1,
								star:int = -1):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("title", title));
			
			if (id_responsible > -1)
				params.push(new NameValuePair("id_responsible", id_responsible));
			if (id_dashboard > -1)
				params.push(new NameValuePair("id_dashboard", id_dashboard));
			if (deadline != null)
				params.push(new NameValuePair("deadline", DateUtil.toRFC822(deadline)));
			if (reminder > -1)
				params.push(new NameValuePair("reminder", reminder));
			if (status > -1)
				params.push(new NameValuePair("status", status));
			if (star > -1)
				params.push(new NameValuePair("star", star));
				
			call(CREATE, createHandler, params);
		}
		
		private function createHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_CREATE,
				_resultParser.parseTask);
		}
		
		/**
		 * get a task   
		 *
		 * @param id_task id of the task
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/view
		 */
		public function view(id_task:int):void
		{
			call(VIEW, viewHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_VIEW,
				_resultParser.parseTask);
		}
		
		/**
		 * get every task for a given workspace    
		 *
		 * @param id_dashboard (optional) if null return every task for current user
		 * @param (optional) if not null, the function only returns tasks modified or created since this date  
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/show_list
		 */
		public function show_list(id_dashboard:int=-1, since:Date=null):void
		{
			var params:Array = new Array();
			
			if (id_dashboard > -1)
				params.push(new NameValuePair("id_dashboard", id_dashboard));
			if (id_dashboard > -1)
				params.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			
			call(VIEW, showListHandler, params);
		}
		
		private function showListHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SHOW_LIST,
				_resultParser.parseTasks);
		}
		
		/**
		 * change title of a task   
		 *
		 * @param id_task id of the task
		 * @param title new title
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_title
		 */
		public function set_title(id_task:int, title:String):void
		{
			call(SET_TITLE, setTitleHandler, [new NameValuePair("id_task", id_task),
				new NameValuePair("title", title)
			]);
		}
		
		private function setTitleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_TITLE,
				_resultParser.parseTask);
		}
		
		/**
		 * set status of a task    
		 *
		 * @param id_task id of the task
		 * @param status (1 = UNDONE, 2 = DONE) 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_status
		 */
		public function set_status(id_task:int, status:int):void
		{
			call(SET_STATUS, setStatusHandler, [new NameValuePair("id_task", id_task),
				new NameValuePair("status", status)
			]);
		}
		
		private function setStatusHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_STATUS,
				_resultParser.parseTask);
		}
		
		/**
		 * set star status of a task    
		 *
		 * @param id_task id of the task
		 * @param star (0 to 5 stars)  
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_star
		 */
		public function set_star(id_task:int, star:int):void
		{
			call(SET_STAR, setStarHandler, [new NameValuePair("id_task", id_task),
				new NameValuePair("star", star)
			]);
		}
		
		private function setStarHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_STAR,
				_resultParser.parseTask);
		}
		
		/**
		 * change responsible of a task     
		 *
		 * @param id_task id of the task
		 * @param id_responsible  
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_responsible
		 */
		public function set_responsible(id_task:int, id_responsible:int):void
		{
			call(SET_RESPONSIBLE, setResponsibleHandler, [new NameValuePair("id_task", id_task),
				new NameValuePair("id_responsible", id_responsible)
			]);
		}
		
		private function setResponsibleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_RESPONSIBLE,
				_resultParser.parseTask);
		}
		
		/**
		 * void the responsible of a task     
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/unset_responsible
		 */
		public function unset_responsible(id_task:int):void
		{
			call(UNSET_RESPONSIBLE, unsetResponsibleHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function unsetResponsibleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_UNSET_RESPONSIBLE,
				_resultParser.parseTask);
		}
		
		/**
		 * set a deadline      
		 *
		 * @param id_task id of the task
		 * @param deadline  
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_deadline
		 */
		public function set_deadline(id_task:int, deadline:Date=null):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("id_task", id_task));
			
			if (deadline)
				params.push(new NameValuePair("deadline", DateUtil.toRFC822(deadline)));
			
			call(SET_DEADLINE, setDeadlineHandler, params);
		}
		
		private function setDeadlineHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_DEADLINE,
				_resultParser.parseTask);
		}
		
		/**
		 * set a reminder    
		 *
		 * @param id_task id of the task
		 * @param reminder (0 = "None", 1 = "5 minutes before", 2 = "15 minutes before", 3 = "30 minutes before", 
		 * 4 = "1 hour before", 5 = "2 hours before", 6 = "1 day before", 7 = "2 days before", 8 = "on date of event")   
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_reminder
		 */
		public function set_reminder(id_task:int, reminder:int):void
		{
			call(SET_REMINDER, setReminderHandler, [new NameValuePair("id_task", id_task),
				new NameValuePair("reminder", reminder)
			]);
		}
		
		private function setReminderHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_REMINDER,
				_resultParser.parseTask);
		}
		
		
	}
}