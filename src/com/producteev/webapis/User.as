package com.producteev.webapis
{

	public class User
	{
		public var time_signup:Date;
		public var lang:String;
		public var avatar:String;
		public var email:String;
		public var sort_by:int;
		public var deleted:int;
		public var company:String;
		public var facebook_id:Number;
		public var firstName:String;
		public var lastName:String;
		public var id_user:Number;
		public var timezone:String;
		public var default_dashboard:int;
		
		private var _colleagues:Array /* of User */  = new Array();
		
		public function addColleague(value:User):void
		{
			_colleagues.push(value);
		}
		
		public function get colleagues():Array
		{
			return _colleagues.slice();
		}
	}
}