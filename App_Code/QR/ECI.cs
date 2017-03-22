using System;
namespace snow.qr.generator.common
{
	internal abstract class ECI
	{
		virtual internal int Value
		{
			get
			{
				return value_Renamed;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'value '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int value_Renamed;
		
		internal ECI(int value_Renamed)
		{
			this.value_Renamed = value_Renamed;
		}
		
		/// <param name="value">ECI value
		/// </param>
		/// <returns> {@link ECI} representing ECI of given value, or null if it is legal but unsupported
		/// </returns>
		/// <throws>  IllegalArgumentException if ECI value is invalid </throws>
		internal static ECI getECIByValue(int value_Renamed)
		{
			if (value_Renamed < 0 || value_Renamed > 999999)
			{
				throw new System.ArgumentException("Bad ECI value: " + value_Renamed);
			}
			if (value_Renamed < 900)
			{
				// Character set ECIs use 000000 - 000899
				return CharacterSetECI.getCharacterSetECIByValue(value_Renamed);
			}
			return null;
		}
	}
}