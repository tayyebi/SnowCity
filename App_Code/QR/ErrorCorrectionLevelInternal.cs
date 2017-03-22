using System;
namespace snow.qr.generator.decoder
{
	internal sealed class ErrorCorrectionLevelInternal
	{
		internal int Bits
		{
			get
			{
				return bits;
			}
			
		}
		internal System.String Name
		{
			get
			{
				return name;
			}
			
		}
		
		// No, we can't use an enum here. J2ME doesn't support it.
		
		/// <summary> L = ~7% correction</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'L '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly ErrorCorrectionLevelInternal L = new ErrorCorrectionLevelInternal(0, 0x01, "L");
		/// <summary> M = ~15% correction</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'M '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly ErrorCorrectionLevelInternal M = new ErrorCorrectionLevelInternal(1, 0x00, "M");
		/// <summary> Q = ~25% correction</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'Q '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly ErrorCorrectionLevelInternal Q = new ErrorCorrectionLevelInternal(2, 0x03, "Q");
		/// <summary> H = ~30% correction</summary>
		//UPGRADE_NOTE: Final was removed from the declaration of 'H '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		public static readonly ErrorCorrectionLevelInternal H = new ErrorCorrectionLevelInternal(3, 0x02, "H");
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'FOR_BITS '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private static readonly ErrorCorrectionLevelInternal[] FOR_BITS = new ErrorCorrectionLevelInternal[]{M, L, H, Q};
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'ordinal '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int ordinal_Renamed_Field;
		//UPGRADE_NOTE: Final was removed from the declaration of 'bits '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int bits;
		//UPGRADE_NOTE: Final was removed from the declaration of 'name '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.String name;
		
		private ErrorCorrectionLevelInternal(int ordinal, int bits, System.String name)
		{
			this.ordinal_Renamed_Field = ordinal;
			this.bits = bits;
			this.name = name;
		}
		
		internal int ordinal()
		{
			return ordinal_Renamed_Field;
		}
		
		public override System.String ToString()
		{
			return name;
		}
		
		/// <param name="bits">int containing the two bits encoding a QR Code's error correction level
		/// </param>
		/// <returns> {@link ErrorCorrectionLevelInternal} representing the encoded error correction level
		/// </returns>
		internal static ErrorCorrectionLevelInternal forBits(int bits)
		{
			if (bits < 0 || bits >= FOR_BITS.Length)
			{
				throw new System.ArgumentException();
			}
			return FOR_BITS[bits];
		}
	}
}