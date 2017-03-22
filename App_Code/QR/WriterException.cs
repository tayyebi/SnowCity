using System;
namespace snow.qr.generator
{
	[Serializable]
	internal sealed class WriterException:System.Exception
	{
		
		internal WriterException():base()
		{
		}
		
		internal WriterException(System.String message):base(message)
		{
		}
	}
}