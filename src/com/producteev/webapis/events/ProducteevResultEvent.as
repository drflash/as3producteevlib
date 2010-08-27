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
		public static const USERS_FBLOGIN:String = "usersFBLogin";
		public static const USERS_SET_FB_ID:String = "usersSetFBId";
		public static const USERS_UNSET_FB_ID:String = "usersUnsetFBId";
		public static const USERS_SET_TIMEZONE:String = "usersSetTimezone";
		
		
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
		public static const TASKS_UNSET_DEADLINE:String = "tasksUnsetDeadline";
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
		public static const TASKS_NOTE_DELETE:String = "tasksNotDelete";
		public static const TASKS_ACTIVITY_VIEW:String = "tasksActivityView";
		public static const TASKS_ACTIVITY_GET:String = "tasksActivitiesGet";
		
		/************************************
		 /*    LABELS METHOD GROUP CALLS     */
		/************************************/
		public static const LABELS_CREATE:String = "labelsCreate";
		public static const LABELS_VIEW:String = "labelsView";
		public static const LABELS_SHOW_LIST:String = "labelsShowList";
		public static const LABELS_DELETE:String = "labelsDelete";
		public static const LABELS_TASKS:String = "labelsTasks";
		public static const LABELS_SET_TITLE:String = "labelsSetTitle";
		
		/************************************
		/*  ACTIVITIES METHOD GROUP CALLS   */
		/************************************/
		public static const ACTIVITIES_VIEW:String = "activitiesView";
		public static const ACTIVITIES_SHOW_ACTIVITIES:String = "activitiesShowActivities";
		public static const ACTIVITIES_SHOW_NOTIFICATIONS:String = "activitiesShowNotifications";
		public static const ACTIVITIES_NOTIFICATIONS_SET_READ:String = "activitiesNotificationsSetRead";
		
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