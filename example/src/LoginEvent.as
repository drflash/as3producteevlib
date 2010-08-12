package
{
	import com.producteev.webapis.User;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public var user:User;
		
		public function LoginEvent(user:User)
		{
			this.user = user;
			super(LOGIN);
		}
	}
}