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

	public class ProducteevLabelsTest
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
			
			service.labels.addEventListener(ProducteevResultEvent.LABELS_CREATE, async)
			service.labels.create('testLabel', Credentials.defaultDashboardId);
		}
		
		private function createHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.labels, isA(Label));
			
			var l:Label = e.data.labels;
			assertEquals(l.title, "testLabel");
			
		}
		
		[Test(async)]
		public function testCreateWrongDashboard():void
		{
			var async:Function = Async.asyncHandler(this, assertErrorHandler, 500,null,  timeOutHandler);
			
			service.labels.addEventListener(ProducteevResultEvent.LABELS_CREATE, async)
			service.labels.create('testLabel', -1);
		}
		
		[Test(async)]
		public function testShowList():void
		{
			var async:Function = Async.asyncHandler(this, showListHandler, 500,null,  timeOutHandler);
			
			service.labels.addEventListener(ProducteevResultEvent.LABELS_SHOW_LIST, async)
			service.labels.show_list(Credentials.defaultDashboardId);
		}
		
		private function showListHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.labels, isA(Array));
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