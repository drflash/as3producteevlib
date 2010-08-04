package com.producteev.webapis
{
	public class Dashboard
	{
		public var time_lastchange:Date;
		public var id_dashboard:int;
		public var id_creator:int;
		public var status:int;
		public var title:String;
		public var smart_labels:int;
		public var write_ok:int;
		public var deleted:int;
		
		private var _accesslist:Array /* of User */ = new Array();
		
		public function addUserToAccessList(value:User):void
		{
			_accesslist.push(value);
		}
		
		public function get accessList():Array
		{
			return _accesslist.slice();
		}
	}
}