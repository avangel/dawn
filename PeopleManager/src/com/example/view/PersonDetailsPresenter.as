package com.example.view
{
	import com.example.handlers.IPersonRecievedHandler;
	import com.example.model.Person;

	public class PersonDetailsPresenter implements IPersonRecievedHandler
	{
		private var _details:PersonDetails;
		
		public function PersonDetailsPresenter()
		{
		}
		
		[Inject]
		public function set personDetails( value:PersonDetails ):void
		{
			_details = value;
		}
		
		public function onPersonRevieved( person:Person ):void
		{
			_details.person = person;
		}
	}
}