package com.producteev.webapis
{
	import com.adobe.protocols.dict.Database;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import mx.automation.codec.AssetPropertyCodec;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.hamcrest.core.isA;

	public class ProducteevDashboardsTest
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
		
		[Test(async)]
		public function testShowList():void
		{
			var async:Function = Async.asyncHandler(this, showListHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_SHOW_LIST, async)
			service.dashboards.show_list();
		}
		
		private function showListHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Array));
		}
		
		[Ignore("We'll not create a new dashboard each time unit tests are executed")]
		[Test(async)]
		public function testCreate():void
		{
			var async:Function = Async.asyncHandler(this, createHandler, 500,null,  timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_CREATE, async)
			service.dashboards.create('test');
		}
		
		private function createHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Dashboard));
			
			var d:Dashboard = e.data.dashboards;
			assertEquals(d.title, "test");
		}
		
		/*[Test(async, order=2)]
		public function testDeleteWonrgIdDashboard():void
		{
			var async:Function = Async.asyncHandler(this, deleteHandler, 500, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_DELETE, async)
			service.dashboards.delete_(1);
		}
		
		private function deleteHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertFalse("event.success == false", e.success);
			assertNotNull("event.data.error", e.data.error);
		}*/
		
		[Test(async)]
		public function testView():void
		{
			var async:Function = Async.asyncHandler(this, viewHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_VIEW, async)
			service.dashboards.view(Credentials.defaultDashboardId);
		}
		
		private function viewHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Dashboard));
		}
		
		[Test(async)]
		public function testViewNonOwnedDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_VIEW, async)
			service.dashboards.view(1);
		}
		
		[Test(async)]
		public function testAccess():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_ACCESS, async)
			service.dashboards.access(Credentials.defaultDashboardId);
		}
		
		private function testAccessHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true",e.success);
			assertThat(e.data.dashboards, isA(Array));
		}
		
		[Ignore]
		[Test(async)]
		public function testLeaveDefaultDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_VIEW, async)
			service.dashboards.leave(Credentials.defaultDashboardId);
		}
		
		[Test(async)]
		public function testSetTitleDefaultDashboard():void
		{
			var randomTitle:String = "title"+int(Math.random()*35000);
			var async:Function = Async.asyncHandler(this, setTitleDashboardHandler, 500, randomTitle, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_SET_TITLE, async)
			service.dashboards.set_title(Credentials.defaultDashboardId, randomTitle);
		}
		
		private function setTitleDashboardHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Dashboard));
			assertEquals(e.data.dashboards.title, o);
		}
		
		[Test(async)]
		public function testSetTitleNonAccessibleDashboard():void
		{
			var randomTitle:String = "title"+int(Math.random()*35000);
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, randomTitle, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_SET_TITLE, async)
			service.dashboards.set_title(1, randomTitle);
		}
		
		[Ignore]
		[Test(async)]
		public function testSetSmartLabelDashboard():void
		{
			var randomValue:int = Math.round(Math.random());
			var async:Function = Async.asyncHandler(this, testSetSmartLabelDashboardHandler, 500, randomValue, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_SET_SMART_LABELS, async)
			service.dashboards.set_smart_labels(Credentials.defaultDashboardId, true);
		}
		
		private function testSetSmartLabelDashboardHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Dashboard));
			assertEquals(e.data.dashboards.smart_labels, 1);
		}
		
		[Ignore]
		[Test(async)]
		public function testConfirmNonExistingDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_CONFIRM, async)
			service.dashboards.confirm(1);
		}
		
		[Ignore]
		[Test(async)]
		public function testRefuseNonExistingDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_REFUSE, async)
			service.dashboards.refuse(1);
		}
		
		[Test(async)]
		public function testInviteUserByIdNonExistingUser():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_ID, async)
			service.dashboards.invite_user_by_id(Credentials.defaultDashboardId, -1);
		}
		
		[Ignore]
		[Test(async)]
		public function testInviteUserByIdNonAccessibleDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_ID, async)
			service.dashboards.invite_user_by_id(1, 1);
		}
		
		[Test(async)]
		public function testInviteUserByEmailBadFormattedEmail():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_EMAIL, async)
			service.dashboards.invite_user_by_email(Credentials.defaultDashboardId, "badformattedemail");
		}
		
		[Test(async)]
		public function testInviteUserByEmail():void
		{
			var async:Function = Async.asyncHandler(this, testInviteUserByEmailHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_INVITE_USER_BY_EMAIL, async)
			service.dashboards.invite_user_by_email(Credentials.defaultDashboardId, "test@test.com");
		}
		
		private function testInviteUserByEmailHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Dashboard));
		}
		
		[Test(async)]
		public function testTasks():void
		{
			var async:Function = Async.asyncHandler(this, testTasksHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_TASKS, async)
			service.dashboards.tasks(Credentials.defaultDashboardId);
		}
		
		[Test(async)]
		public function testTasksWithDateNotHappeningYet():void
		{
			var async:Function = Async.asyncHandler(this, testTasksWithDateNotHappeningYetHandler, 500, null, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_TASKS, async)
			service.dashboards.tasks(Credentials.defaultDashboardId, new Date());
		}
		
		private function testTasksWithDateNotHappeningYetHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Array));
			assertEquals(e.data.dashboards.length, 0);
		}
		
		private function testTasksHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Array));
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