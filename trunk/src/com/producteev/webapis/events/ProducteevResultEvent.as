package com.producteev.webapis.events
{
	import com.adobe.webapis.events.ServiceEvent;

	public class ProducteevResultEvent extends ServiceEvent
	{
		public static const USERS_LOGIN:String = "usersLogin";
		public static const USERS_SIGNUP:String = "usersSignup";
		
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