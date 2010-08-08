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
		
		/************************************
		 /*    TASKS METHOD GROUP CALLS     */
		/************************************/
		public static const TASKS_CREATE:String = "tasksCreate";
		public static const TASKS_VIEW:String = "tasksView";
		public static const TASKS_SHOW_LIST:String = "tasksShowList";
		public static const TASKS_SET_TITLE:String = "tasksSetTitle";
		public static const TASKS_SET_STATUS:String = "tasksSetStatus";
		public static const TASKS_SET_STAR:String = "tasksSetStar";
		public static const TASKS_SET_RESPONSIBLE:String = "tasksSetResponsible";
		public static const TASKS_UNSET_RESPONSIBLE:String = "tasksUnsetResponsible";
		public static const TASKS_SET_DEADLINE:String = "tasksSetDeadline";
		public static const TASKS_SET_REMINDER:String = "tasksSetReminder";
		public static const TASKS_DELETE:String = "tasksDelete";
		public static const TASKS_ACCESS:String = "tasksAccess";
		public static const TASKS_LABELS:String = "tasksLabels";
		public static const TASKS_SET_LABEL:String = "tasksSetLabel";
		public static const TASKS_UNSET_LABEL:String = "tasksUnsetLabel";
		public static const TASKS_SET_WORKSPACE:String = "tasksSetWorkspace";
		public static const TASKS_NOTE_VIEW:String = "tasksNoteView";
		public static const TASKS_NOTES_GET:String = "tasksNotesGet";
		public static const TASKS_NOTE_CREATE:String = "tasksNoteCreate";
		public static const TASKS_NOTE_DELETED:String = "tasksNotDeleted";
		public static const TASKS_ACTIVITY_VIEW:String = "tasksActivityView";
		public static const TASKS_SHOW_LIST_ACTIVITIES:String = "tasksShowListActivities";
		
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