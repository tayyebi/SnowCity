using System;
namespace snow.qr.generator.common.reedsolomon
{
	[Serializable]
	internal sealed class ReedSolomonException:System.Exception
	{
		
		internal ReedSolomonException(System.String message):base(message)
		{
		}
	}
}