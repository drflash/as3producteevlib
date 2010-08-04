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
		public static const DASHBOARDS_CREATE:String = "dashboardsCreate";
		public static const DASHBOARDS_DELETE:String = "dashboardsDelete";
		public static const DASHBOARDS_VIEW:String = "dashboardsView";
		public static const DASHBOARDS_ACCESS:String = "dashboardsAccess";
		public static const DASHBOARDS_LEAVE:String = "dashboardsLeave";
		public static const DASHBOARDS_SET_TITLE:String = "dashboardsSetTitle";
		public static const DASHBOARDS_SET_SMART_LABELS:String = "dashboardsSetSmartLabels";
		public static const DASHBOARDS_TASKS:String = "dashboardsTasks";
		public static const DASHBOARDS_CONFIRM:String = "dashboardsConfirm";
		public static const DASHBOARDS_REFUSE:String = "dashboardsRefuse";
		public static const DASHBOARDS_INVITE_USER_BY_ID:String = "dashboardsInviteUserById";
		public static const DASHBOARDS_INVITE_USER_BY_EMAIL:String = "dashboardsInviteUserByEmail";
		
		
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