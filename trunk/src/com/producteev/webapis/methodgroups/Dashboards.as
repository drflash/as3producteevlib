package com.producteev.webapis.methodgroups
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	
	/**
	 * Broadcast as a result of the show list method being called
	 *
	 * The event contains the following properties
	 *	success	- Boolean indicating if the call was successful or not
	 *	data - When success is true, contains an "dashboard" Array of dashboards
	 *		   When success is false, contains an "error" ProducteevError instance
	 *
	 * @see com.producteev.webapis.ProducteevError
	 */
	[Event(name="dashboardsShowList", type="com.producteev.webapis.events.ProducteevResultEvent")]
	
	/**
	 * Contains the methods for the Dashboard method group in the Producteev API.
	 */
	public class Dashboards extends AbstractMethod
	{
		private static const PRE:String = "dashboards/";
		
		private static const SHOW_LIST:String = "show_list";
		
		
		public function Dashboards(service:ProducteevService, 
								   methodCaller:MethodCaller, 
								   resultParser:ResponseParser)
		{
			super(service, methodCaller, resultParser);
		}
		
		/**
		 * get every dashboard  
		 *
		 * @param since (optional) if not null, the function only returns 
		 * 				dashboards modified or created since this  
		 * 
		 * @see http://code.google.com/p/producteev-api/wiki/methodsDescriptions#dashboard/show_list
		 */
		public function showList(since:Date=null):void
		{
			var param:Array;
			
			if (since)
			{
				param = new Array();
				param.push(new NameValuePair("since", since));
			}
				
			call(PRE+SHOW_LIST, showListHandler, param);
		}
		
		private function showListHandler(event:Event):void
		{
			processAndDispatch(URLLoader(event.target).data,
				ProducteevResultEvent.DASHBOARDS_SHOW_LIST,
				_resultParser.parseShowList,
				"dashboards");
		}
	}
}