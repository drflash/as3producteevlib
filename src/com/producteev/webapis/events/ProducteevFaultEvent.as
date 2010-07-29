package com.producteev.webapis.events
{
	import com.adobe.webapis.events.ServiceEvent;
	
	import flash.events.Event;
	
	public class ProducteevFaultEvent extends ServiceEvent
	{
		public static const FAULT:String = "producteevFault";
		
		public function ProducteevFaultEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}