package com.producteev.webapis.methodgroups
{
	import com.adobe.utils.DateUtil;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	/**
	 * Broadcast as a result of the show list method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "dashboard" Array of dashboards
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsShowList", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the create method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsCreate", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
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
	[Event(name="dashboardsDelete", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the access method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" array of User instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsAccess", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the leave method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance with the deleted flag to 1
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsLeave", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_smart_labels method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsSetSmartLabels", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the set_title method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsSetTitle", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the tasks method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" array of tasks instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsTasks", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the confirm method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsConfirm", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the refuse method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsRefuse", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the invite_user_by_id method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsInviteUserById", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the invite_user_by_email method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "dashboards" Dashboard instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsInviteUserByEmail", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Contains the methods for the Dashboard method group in the Producteev API.
	 */
	public class Dashboards extends AbstractMethod
	{
		
		private static const SHOW_LIST:String = "show_list";
		private static const CREATE:String = "create";
		private static const DELETE:String = "delete";
		private static const VIEW:String = "view";
		private static const ACCESS:String = "access";
		private static const LEAVE:String = "leave";
		private static const SET_TITLE:String = "set_title";
		private static const SET_SMART_LABELS:String = "set_smart_labels";
		private static const TASKS:String = "tasks";
		private static const CONFIRM:String = "confirm";
		private static const REFUSE:String = "refuse";
		private static const INVITE_USER_BY_ID:String = "invite_user_by_id";
		private static const INVITE_USER_BY_EMAIL:String = "invite_user_by_email";
		
		
		public function Dashboards(service:ProducteevService, 
								   methodCaller:MethodCaller, 
								   resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
			pre = "dashboards/";
			objectResultName = "dashboards";
		}
		
		/**
		 * get every dashboard  
		 *
		 * @param since (optional) if not null, the function only returns 
		 * 				dashboards modified or created since this  
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/show_list
		 */
		public function showList(since:Date=null):void
		{
			var param:Array;
			
			if (since)
			{
				param = new Array();
				param.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			}
				
			call(SHOW_LIST, showListHandler, param);
		}
		
		private function showListHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SHOW_LIST,
				_resultParser.parseShowList);
		}
		
		/**
		 * create a dashboard  
		 *
		 * @param title title of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/create
		 */
		public function create(title:String):void
		{
			call(CREATE, createHandler, [new NameValuePair("title", title)]);
		}
		
		private function createHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_CREATE,
				_resultParser.parseDashboard);
		}
		
		/**
		 * delete a dashboard  
		 *
		 * @param id_dashboard id of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/delete
		 */
		public function delete_(id_dashboard:int):void
		{
			call(DELETE, deleteHandler, [new NameValuePair("id_dashboard", id_dashboard)]);
		}
		
		private function deleteHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_DELETE,
				_resultParser.parseDelete);
		}
		
		/**
		 * get a dashboard  
		 *
		 * @param id_dashboard id of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/view
		 */
		public function view(id_dashboard:int):void
		{
			call(VIEW, viewHandler, [new NameValuePair("id_dashboard", id_dashboard)]);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_VIEW,
				_resultParser.parseDashboard);
		}
		
		/**
		 * return the list of users who can access a specific dashboard   
		 *
		 * @param id_dashboard id of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/access
		 */
		public function access(id_dashboard:int):void
		{
			call(ACCESS, accessHandler, [new NameValuePair("id_dashboard", id_dashboard)]);
		}
		
		private function accessHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_ACCESS,
				_resultParser.parseColleagues);
		}
		
		/**
		 * leave a dashboard  
		 *
		 * @param id_dashboard id of the dashboard
		 * @param id_user (optional) id of user who will leave the dashboard. (only work if you are the dashboard admin)
		 * @param id_user_delegate (optional) if current user is admin of the dashboard, he has to designate a new admin 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/leave
		 */
		public function leave(id_dashboard:int, id_user:int= -1, id_user_delegate:int=-1):void
		{
			var param:Array = new Array();
			param.push(new NameValuePair("id_dashboard", id_dashboard));
			
			if (id_user > -1)
				param.push(new NameValuePair("id_user", id_user));
			if (id_user_delegate > -1)
				param.push(new NameValuePair("id_user_delegate", id_user_delegate));
			
			call(LEAVE, leaveHandler, param);
		}
		
		private function leaveHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_LEAVE,
				_resultParser.parseDashboard);
		}
		
		/**
		 * change title of a dashboard   
		 *
		 * @param id_dashboard id of the dashboard
		 * @param title new title
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/title
		 */
		public function set_title(id_dashboard:int, title:String):void
		{
			call(SET_TITLE, setTitleHandler, [new NameValuePair("id_dashboard", id_dashboard),
												  new NameValuePair("title", title)
													]);
		}
		
		private function setTitleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SET_TITLE,
				_resultParser.parseDashboard);
		}
		
		/**
		 * get every tasks of a dashboard    
		 *
		 * @param id_dashboard id of the dashboard
		 * @param since(optional) if not null, the function only returns tasks modified or created since this date 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/tasks
		 */
		public function tasks(id_dashboard:int, since:Date=null):void
		{
			var param:Array = new Array();
			param.push(new NameValuePair("id_dashboard", id_dashboard));
			
			if (since)
				param.push(new NameValuePair("since", DateUtil.toRFC822(since)));
			
			call(TASKS, tasksHandler, param);
		}
		
		private function tasksHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_TASKS,
				_resultParser.parseTasks);
		}
		
		/**
		 * set/unset smart labels    
		 *
		 * @param id_dashboard id of the dashboard
		 * @param value (false => DEACTIVATED, true => ACTIVATED (ie: manuel order)) 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/set_smart_labels
		 */
		public function set_smart_labels(id_dashboard:int, value:Boolean):void
		{
			call(SET_SMART_LABELS, setSmartLabelsHandler, 
				[new NameValuePair("id_dashboard", id_dashboard),
				 new NameValuePair("value", int(value))
				]);
		}
		
		private function setSmartLabelsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SET_SMART_LABELS,
				_resultParser.parseDashboard);
		}
		
		/**
		 * confirm invitation for a dashboard     
		 *
		 * @param id_dashboard id of the dashboard
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/confirm
		 */
		public function confirm(id_dashboard:int):void
		{
			call(CONFIRM, confirmHandler, 
				[new NameValuePair("id_dashboard", id_dashboard)
				]);
		}
		
		private function confirmHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_CONFIRM,
				_resultParser.parseDashboard);
		}
		
		/**
		 * refuse invitation for a dashboard     
		 *
		 * @param id_dashboard id of the dashboard
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/refuse
		 */
		public function refuse(id_dashboard:int):void
		{
			call(REFUSE, refuseHandler, 
				[new NameValuePair("id_dashboard", id_dashboard)
				]);
		}
		
		private function refuseHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_REFUSE,
				_resultParser.parseDashboard);
		}
		
		/**
		 * invite an user to a dashboard      
		 *
		 * @param id_dashboard id of the dashboard
		 * @param id_user_to : id of the user to invite
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/invite_user_by_id
		 */
		public function invite_user_by_id(id_dashboard:int, id_user_to:int):void
		{
			call(INVITE_USER_BY_ID, inviteUserByIdHandler, 
				[
					new NameValuePair("id_dashboard", id_dashboard),
					new NameValuePair("id_user_to", id_user_to)
				]);
		}
		
		private function inviteUserByIdHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_ID,
				_resultParser.parseDashboard);
		}
		
		/**
		 * invite an user to a dashboard using his/her email       
		 *
		 * @param id_dashboard id of the dashboard
		 * @param email email of the user to invite
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/invite_user_by_email
		 */
		public function invite_user_by_email(id_dashboard:int, email:String):void
		{
			call(INVITE_USER_BY_EMAIL, inviteUserByEmailHandler, 
				[
					new NameValuePair("id_dashboard", id_dashboard),
					new NameValuePair("email", email)
				]);
		}
		
		private function inviteUserByEmailHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_EMAIL,
				_resultParser.parseDashboard);
		}
		
		
		
		
	}
}