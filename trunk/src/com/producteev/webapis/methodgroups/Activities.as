package com.producteev.webapis.methodgroups
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	/**
	 * Broadcast as a result of the view method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "activities" Activity instance
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="activitiesView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the show_activities method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "activities" array of Activity instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="activitiesShowActivitiesView", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Broadcast as a result of the show_notifications method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains a "activities" array of Activity instances
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="activitiesShowNotifications", type="com.producteev.webapis.events.ProducteevResultEvent")]

	/**
	 * Contains the methods for the Activities method group in the Producteev API.
	 */	
	public class Activities extends AbstractMethod
	{
		private static const VIEW:String = "view";
		private static const SHOW_ACTIVITIES:String = "show_activities";
		private static const SHOW_NOTIFICATIONS:String = "show_notifications";
		private static const NOTIFICATIONS_SET_READ:String = "notifications_set_read";
		
		public function Activities(service:ProducteevService, methodCaller:MethodCaller, resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
			pre = "activities/";
			objectResultName = "activities";
		}
		
		/**
		 * get an activity   
		 *
		 * @param id_activity
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#activities/view
		 */
		public function view(id_activity:int):void
		{
			call(VIEW, viewHandler, [new NameValuePair("id_activity", id_activity)]);
		}
		
		private function viewHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.ACTIVITIES_VIEW,
				_resultParser.parseActivity);
		}
		
		/**
		 * get every activities    
		 *
		 * @param id_dashboard (optional) if not null, this function only returns notifications for this specific dashboard
		 * @param last_id (optional) if not null, this function returns only notifications later than this id 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#activities/show_activities
		 */
		public function show_activities(id_dashboard:int = -1, last_id:int = -1):void
		{
			var params:Array = new Array();
			
			if (id_dashboard > -1)
				params.push(new NameValuePair("id_dashboard", id_dashboard));
			if (last_id > -1)
				params.push(new NameValuePair("last_id", last_id));
			
			call(SHOW_ACTIVITIES, showActivitiesHandler, params);
		}
		
		private function showActivitiesHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.ACTIVITIES_SHOW_ACTIVITIES,
				_resultParser.parseActivities);
		}
		
		/**
		 * get every notifications (notifications are activities that current user is concerned about)     
		 *
		 * @param id_dashboard (optional) if not null, this function only returns notifications for this specific dashboard
		 * @param last_id (optional) if not null, this function returns only notifications later than this id 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#activities/show_notifications
		 */
		public function show_notifications(id_dashboard:int = -1, last_id:int = -1):void
		{
			var params:Array = new Array();
			
			if (id_dashboard > -1)
				params.push(new NameValuePair("id_dashboard", id_dashboard));
			if (last_id > -1)
				params.push(new NameValuePair("last_id", last_id));
			
			call(SHOW_NOTIFICATIONS, showNotificationsHandler, params);
		}
		
		private function showNotificationsHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.ACTIVITIES_SHOW_NOTIFICATIONS,
				_resultParser.parseActivities);
		}
		
		/**
		 * set notifications status as read      
		 *
		 * @param id_dashboard 
		 * @param last_id (optional) if not null, this function returns only notifications later than this id 
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#activities/notifications_set_read
		 */
		public function notifications_set_read(id_dashboard:int, last_id:int = -1):void
		{
			var params:Array = new Array();
			params.push(new NameValuePair("id_dashboard", id_dashboard));

			if (last_id > -1)
				params.push(new NameValuePair("last_id", last_id));
			
			call(NOTIFICATIONS_SET_READ, notificationsSetReadHandler, params);
		}
		
		private function notificationsSetReadHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.ACTIVITIES_NOTIFICATIONS_SET_READ,
				_resultParser.parseActivities);
		}
	}
}