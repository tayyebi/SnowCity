using System;
namespace snow.qr.generator
{
	internal sealed class EncodeHintType
	{
		
		/// <summary> Specifies what degree of error correction to use, for example in QR Codes (type Integer).</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'ERROR_CORRECTION '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		internal static readonly EncodeHintType ERROR_CORRECTION = new EncodeHintType();
		
		/// <summary> Specifies what character encoding to use where applicable (type String)</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'CHARACTER_SET '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		internal static readonly EncodeHintType CHARACTER_SET = new EncodeHintType();
		
		private EncodeHintType()
		{
		}
	}
}