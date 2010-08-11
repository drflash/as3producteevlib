package com.producteev.webapis
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.hamcrest.core.isA;
	
	public class ProducteevActivitiesTest
	{
		public var service:ProducteevService;
		
		[Before(async)]
		public function login():void
		{
			var async:Function = Async.asyncHandler(this, loginHandler, 500);
			
			service = new ProducteevService(Credentials.API_KEY, Credentials.API_SECRET);
			service.users.addEventListener(ProducteevResultEvent.USERS_LOGIN, async);
			service.users.login(Credentials.userName, Credentials.password);
		}
		
		public function loginHandler(e:ProducteevResultEvent, o:Object):void
		{
			var authResult:AuthResult = AuthResult(e.data.users);
			service.token = authResult.token;
		}
		
		[Ignore]
		[Test(async)]
		public function testShowActivities():void
		{
			var async:Function = Async.asyncHandler(this, testShowActivitiesHandler, 500,null,  timeOutHandler);
			
			service.activities.addEventListener(ProducteevResultEvent.ACTIVITIES_SHOW_ACTIVITIES, async)
			service.activities.show_activities(Credentials.defaultDashboardId);
		}
		
		public function testShowActivitiesHandler(event:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", event.success);
			assertThat(event.data.activities, isA(Array));
		}
		
		[Test(async)]
		public function testShowNotifications():void
		{
			var async:Function = Async.asyncHandler(this, testShowNotificationsHandler, 500,null,  timeOutHandler);
			
			service.activities.addEventListener(ProducteevResultEvent.ACTIVITIES_SHOW_NOTIFICATIONS, async)
			service.activities.show_notifications(Credentials.defaultDashboardId);
		}
		
		public function testShowNotificationsHandler(event:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", event.success);
			assertThat(event.data.activities, isA(Array));
		}
		
		[Ignore]
		[Test(async)]
		public function testSetNotificationsReadWrongDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.activities.addEventListener(ProducteevResultEvent.ACTIVITIES_NOTIFICATIONS_SET_READ, async)
			service.activities.notifications_set_read(-1);
		}
		
		private function assertErrorHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", e.success);
			assertNotNull("event.data.error", e.data.error);
		}
		
		private function timeOutHandler(o:Object):void
		{
			Assert.fail("timeout handler");
		}
		
		
	}
}