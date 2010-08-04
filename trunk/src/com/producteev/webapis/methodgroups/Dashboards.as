package com.producteev.webapis.methodgroups
{
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
	 * Contains the methods for the Dashboard method group in the Producteev API.
	 */
	public class Dashboards extends AbstractMethod
	{
		private static const PRE:String = "dashboards/";
		
		private static const SHOW_LIST:String = "show_list";
		private static const CREATE:String = "create";
		private static const DELETE:String = "delete";
		private static const VIEW:String = "view";
		private static const ACCESS:String = "access";
		private static const LEAVE:String = "leave";
		private static const SET_TITLE:String = "set_title";
		private static const SET_SMART_LABELS:String = "set_smart_labels";
		private static const CONFIRM:String = "confirm";
		private static const REFUSE:String = "refuse";
		
		
		public function Dashboards(service:ProducteevService, 
								   methodCaller:MethodCaller, 
								   resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
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
				param.push(new NameValuePair("since", since));
			}
				
			call(PRE+SHOW_LIST, showListHandler, param);
		}
		
		private function showListHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SHOW_LIST,
				_resultParser.parseShowList,
				"dashboards");
		}
		
		/**
		 * create a dashboard  
		 *
		 * @param title title of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/create
		 */
		public function create(title:String):void
		{
			call(PRE+CREATE, createHandler, [new NameValuePair("title", title)]);
		}
		
		private function createHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_CREATE,
				_resultParser.parseDashboard,
				"dashboards");
		}
		
		/**
		 * delete a dashboard  
		 *
		 * @param id_dashboard id of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/delete
		 */
		public function delete_(id_dashboard:int):void
		{
			call(PRE+DELETE, deleteHandler, [new NameValuePair("id_dashboard", id_dashboard)]);
		}
		
		private function deleteHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_DELETE,
				_resultParser.parseDashboardDelete,
				"dashboards");
		}
		
		/**
		 * get a dashboard  
		 *
		 * @param id_dashboard id of the dashboard
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboards/view
		 */
		public function view(id_dashboard:int):void
		{
			call(PRE+VIEW, viewHandler, [new NameValuePair("id_dashboard", id_dashboard)]);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_VIEW,
				_resultParser.parseDashboard,
				"dashboards");
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
			
			call(PRE+LEAVE, leaveHandler, param);
		}
		
		private function leaveHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_LEAVE,
				_resultParser.parseDashboard,
				"dashboards");
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
			call(PRE+SET_TITLE, setTitleHandler, [new NameValuePair("id_dashboard", id_dashboard),
												  new NameValuePair("title", title)
													]);
		}
		
		private function setTitleHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SET_TITLE,
				_resultParser.parseDashboard,
				"dashboards");
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
			call(PRE+SET_SMART_LABELS, setSmartLabelsHandler, 
				[new NameValuePair("id_dashboard", id_dashboard),
				 new NameValuePair("value", int(value))
				]);
		}
		
		private function setSmartLabelsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SET_SMART_LABELS,
				_resultParser.parseDashboard,
				"dashboards");
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
			call(PRE+CONFIRM, confirmHandler, 
				[new NameValuePair("id_dashboard", id_dashboard)
				]);
		}
		
		private function confirmHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_CONFIRM,
				_resultParser.parseDashboard,
				"dashboards");
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
			call(PRE+REFUSE, refuseHandler, 
				[new NameValuePair("id_dashboard", id_dashboard)
				]);
		}
		
		private function refuseHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_REFUSE,
				_resultParser.parseDashboard,
				"dashboards");
		}
		
		
		
		
	}
}