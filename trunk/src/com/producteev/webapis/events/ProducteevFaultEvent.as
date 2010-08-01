package com.producteev.webapis.events
{
	import com.adobe.webapis.events.ServiceEvent;
	
	import flash.events.Event;
	
	/**
	 * Event class dispatched when a method call returns an IOError 
	 */
	public class ProducteevFaultEvent extends ServiceEvent
	{
		public static const FAULT:String = "producteevFault";
		
		public function ProducteevFaultEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}