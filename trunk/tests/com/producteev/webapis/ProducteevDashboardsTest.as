package com.producteev.webapis
{
	import com.producteev.webapis.client.ProducteevService;
	import com.producteev.webapis.events.ProducteevResultEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
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
			var async:Function = Async.asyncHandler(this, showListHandler, 500, timeOutHandler);
			
			service.dashboards.addEventListener(ProducteevResultEvent.DASHBOARDS_SHOW_LIST, async)
			service.dashboards.showList();
		}
		
		private function showListHandler(e:ProducteevResultEvent, o:Object):void
		{
			assertTrue("event.success == true", e.success);
			assertThat(e.data.dashboards, isA(Array));
		}
		
		private function timeOutHandler(o:Object):void
		{
			Assert.fail("timeout handler");
		}
	}
}