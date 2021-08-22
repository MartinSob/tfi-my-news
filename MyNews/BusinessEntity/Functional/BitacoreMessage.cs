using System;

namespace BusinessEntity
{
	public class BitacoreMessage
	{
		public int id;
		public string title;
		public MessageType type;
		public string description;
		public DateTime date;
		public User user;
	}

	public enum MessageType
	{
		Info,
		Error,
		Warning,
		Control
	}
}
