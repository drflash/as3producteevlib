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
	 * Broadcast as a result of the unset_deadline method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Task instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksUnsetDeadline", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the delete method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, 
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksDelete", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the access method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Array of Users instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksAccess", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the labels method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Array of Label instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksLabels", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_workspace method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Array of Task instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksSetWorkspace", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the note_view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Note instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksNoteView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the note_get method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Array of Note instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksNoteGet", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the note_create method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Note instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksNoteCreate", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the note_delete method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" 
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksNoteDelete", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the activity_view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" Activity instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksActivityView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the show_list_activities method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "tasks" array of Activity instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="tasksActivitiesGet", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Contains the methods for the Tasks method group in the Producteev API.
	 */
	public class Tasks extends AbstractMethod
	{
		
		private static const CREATE:String = "create";
		private static const VIEW:String = "view";
		private static const SHOW_LIST:String = "show_list";
		private static const SET_TITLE:String = "set_title";
		private static const SET_STATUS:String = "set_status";
		private static const SET_STAR:String = "set_star";
		private static const SET_RESPONSIBLE:String = "set_responsible";
		private static const UNSET_RESPONSIBLE:String = "unset_responsible";
		private static const SET_DEADLINE:String = "set_deadline";
		private static const UNSET_DEADLINE:String = "unset_deadline";
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
		private static const NOTE_DELETE:String = "note_delete";
		private static const ACTIVITY_VIEW:String = "activity_view";
		private static const ACTIVITY_GET:String = "activities_get";
		
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
			if (since != null)
				params.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			
			call(SHOW_LIST, showListHandler, params);
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
		 * set a deadline      
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/unset_deadline
		 */
		public function unset_deadline(id_task:int):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("id_task", id_task));
			
			call(UNSET_DEADLINE, unsetDeadlineHandler, params);
		}
		
		private function unsetDeadlineHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_UNSET_DEADLINE,
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
		
		/**
		 * delete a task    
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/delete
		 */
		public function remove(id_task:int):void
		{
			call(DELETE, deleteHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function deleteHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_DELETE,
				_resultParser.parseDelete);
		}
		
		/**
		 * get list of users that can access a task     
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/access
		 */
		public function access(id_task:int):void
		{
			call(ACCESS, accessHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function accessHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_ACCESS,
				_resultParser.parseColleagues);
		}
		
		/**
		 * get labels assigned to a task      
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/labels
		 */
		public function labels(id_task:int):void
		{
			call(LABELS, labelsHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function labelsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_LABELS,
				_resultParser.parseLabels);
		}
		
		/**
		 * set a workspace       
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/set_workspace
		 */
		public function set_workspace(id_task:int, id_dashboard:int):void
		{
			call(SET_WORKSPACE, setWorkspaceHandler, [new NameValuePair("id_task", id_task),
													  new NameValuePair("id_dashboard", id_dashboard)
													]);
		}
		
		private function setWorkspaceHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_SET_WORKSPACE,
				_resultParser.parseTask);
		}
		
		/**
		 * get a note         
		 *
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/note_view
		 */
		public function note_view(id_note:int):void
		{
			call(NOTE_VIEW, noteViewHandler, [new NameValuePair("id_note", id_note)]);
		}
		
		private function noteViewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_NOTE_VIEW,
				_resultParser.parseNote);
		}
		
		/**
		 * get every note of a task        
		 *
		 * @param id_task id of the task
		 * @param since (optional) if not null, the function only returns notes modified or created since this date 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/note_get
		 */
		public function note_get(id_task:int, since:Date=null):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("id_task", id_task));
			
			if (since)
				params.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			
			call(NOTES_GET, noteGetHandler, params);
		}
		
		private function noteGetHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_NOTES_GET,
				_resultParser.parseNotes);
		}
		
		/**
		 * create a note attached to a task         
		 *
		 * @param message title of the note
		 * @param id_task id of the task
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/note_create
		 */
		public function note_create(message:String, id_task:int):void
		{
			call(NOTE_CREATE, noteCreateHandler, [new NameValuePair("message", message),
												  new NameValuePair("id_task", id_task)]);
		}
		
		private function noteCreateHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_NOTE_CREATE,
				_resultParser.parseNote);
		}
		
		/**
		 * delete a note          
		 *
		 * @param id_note id of the note
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/note_delete
		 */
		public function note_delete(id_note:int):void
		{
			call(NOTE_DELETE, noteDeleteHandler, [new NameValuePair("id_note", id_note)]);
		}
		
		private function noteDeleteHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_NOTE_DELETE,
				_resultParser.parseDelete);
		}
		
		/**
		 * get task_activity           
		 *
		 * @param id_activity
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/activity_view
		 */
		public function activity_view(id_activity:int):void
		{
			call(ACTIVITY_VIEW, activityViewHandler, [new NameValuePair("id_activity", id_activity)]);
		}
		
		private function activityViewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_ACTIVITY_VIEW,
				_resultParser.parseActivity);
		}
		
		/**
		 * get task_activities for a given task        
		 *
		 * @param id_task 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#tasks/activity_get
		 */
		public function activities_get(id_task:int):void
		{
			call(ACTIVITY_GET, activitiesGetHandler, [new NameValuePair("id_task", id_task)]);
		}
		
		private function activitiesGetHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.TASKS_ACTIVITY_GET,
				_resultParser.parseActivities);
		}
		
		
		
		
	}
}