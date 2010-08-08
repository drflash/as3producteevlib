package com.producteev.webapis
{
	import com.adobe.utils.DateUtil;
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import flexunit.framework.Assert;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.async.Async;
	import org.hamcrest.collection.array;
	import org.hamcrest.core.isA;

	public class ProducteevTasksTest
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
		public function testCreate():void
		{
			var async:Function = Async.asyncHandler(this, createHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_CREATE, async)
			service.tasks.create('test', Credentials.defaultDashboardId);
		}
		
		private function createHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.tasks, isA(Task));
			
			var t:Task = e.data.tasks;
			assertEquals(t.title, "test");
		}
		
		[Ignore]
		[Test(async)]
		public function testCreateDeadlineWithWrongReminder():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_CREATE, async)
			service.tasks.create('testWrongReminder', Credentials.defaultDashboardId, -1, null, 20);
		}
		
		[Ignore]
		[Test(async)]
		public function testCreateDeadlineWithWrongStatus():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_CREATE, async)
			service.tasks.create('testWrongStatus', Credentials.defaultDashboardId, -1, null, -1, 3);
		}
		
		[Ignore]
		[Test(async)]
		public function testCreateDeadlineWithWrongStar():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_CREATE, async)
			service.tasks.create('testWrongStar', Credentials.defaultDashboardId, -1, null, -1, -1, 7);
		}
		
		[Test(async)]
		public function testViewNonExistingTask():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_VIEW, async)
			service.tasks.view(-1);
		}
		
		[Ignore]
		[Test(async)]
		public function testShowList():void
		{
			var async:Function = Async.asyncHandler(this, showListHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_SHOW_LIST, async)
			service.tasks.show_list();
		}
		
		private function showListHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.tasks, isA(Array));
		}
		
		[Test(async)]
		public function testSetTitleNonExistingTask():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.tasks.addEventListener(ProducteevResultEvent.TASKS_SET_TITLE, async)
			service.tasks.set_title(-1, "test");
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