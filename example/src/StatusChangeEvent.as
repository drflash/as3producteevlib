package
{
	import com.producteev.webapis.Task;
	
	import flash.events.Event;
	
	public class StatusChangeEvent extends Event
	{
		public static const CHANGE:String = "statusChange";
		
		public var status:int;
		
		public function StatusChangeEvent(status:Boolean)
		{
			this.status = int(status) + 1; 
			super(CHANGE, bubbles, cancelable);
		}
	}
}