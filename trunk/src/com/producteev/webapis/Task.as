package com.producteev.webapis
{
	public class Task
	{
		public var id_responsible:int;
		public var w:int;
		public var nb_new_note:int;
		public var deleted:Boolean;
		public var x:int;
		public var time_status:Date;
		public var title:String;
		public var public_:int;
		public var d:int;
		public var nb_note:int;
		
		/**
		 * 0 = "None", 
		 * 1 = "5 minutes before" 
		 * 2 = "15 minutes before" 
		 * 3 = "30 minutes before"
		 * 4 = "1 hour before"
		 * 5 = "2 hours before"
		 * 6 = "1 day before"
		 * 7 = "2 days before"
		 * 8 = "on date of event"
		 */
		public var reminder:int;
		
		public var id_creator:int;
		public var viewed:int;
		public var time_public:Date;
		public var deadline:Date;
		
		/**
		 * 1 = UNDONE
		 * 2 = DONE
		 */
		public var status:int;
		
		public var from:int;
		public var id_task:int;
		public var id_dashboard:int;
		public var task_activities:int;
		public var r:int;
		public var star:int;
		public var time_created:Date;
		public var time_lastchange:Date;
		public var progression:int;
		public var uid_lastchange:int;
		
		private var _labels:Array /* of Label */ = new Array();
		
		public function addLabel(value:Label):void
		{
			_labels.push(value);
		}
		
		public function get labels():Array /* of Label */
		{
			return _labels.slice();
		}
		
		private var _notes:Array /* of Note */ = new Array();
		
		public function addNote(value:Note):void
		{
			_notes.push(value);
		}
		
		public function get notes():Array /* of Note */
		{
			return _notes.slice();
		}
		
	}
}