package com.producteev.webapis.events
{
	import com.adobe.webapis.events.ServiceEvent;

	/**
	 * Event class that contains information about events broadcast in response
	 * to data events from the Producteev API.
	 */
	public class ProducteevResultEvent extends ServiceEvent
	{
		/************************************
		/*     USERS METHOD GROUP CALLS     */
		/************************************/
		public static const USERS_LOGIN:String = "usersLogin";
		public static const USERS_SIGNUP:String = "usersSignup";
		public static const USERS_VIEW:String = "usersView";
		public static const USERS_COLLEAGUES:String = "usersColleagues";
		public static const USERS_SET_DEFAULT_DASHBOARD:String = "usersSetDefaultDashboard";
		
		/*****************************************
		 /*     DASHBOARDS METHOD GROUP CALLS     */
		/*****************************************/
		public static const DASHBOARDS_SHOW_LIST:String = "dashboardsShowList";
		
		/**
		 * True if the event is the result of a successful call,
		 * False if the call failed
		 */
		public var success:Boolean;
		
		
		public function ProducteevResultEvent(type:String, bubbles:Boolean=false,
											   cancelable:Boolean = false
											   )
		{
			super(type, bubbles, cancelable);
		}
		
	}
}