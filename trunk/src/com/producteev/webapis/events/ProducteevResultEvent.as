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