using System;
namespace snow.qr.generator.common
{
	public sealed class ByteMatrix
	{
		internal int Height
		{
			get
			{
				return height;
			}
			
		}
		internal int Width
		{
			get
			{
				return width;
			}
			
		}
		internal sbyte[][] Array
		{
			get
			{
				return bytes;
			}
			
		}
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'bytes '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private sbyte[][] bytes;
		//UPGRADE_NOTE: Final was removed from the declaration of 'width '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int width;
		//UPGRADE_NOTE: Final was removed from the declaration of 'height '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private int height;
		
		internal ByteMatrix(int width, int height)
		{
			bytes = new sbyte[height][];
			for (int i = 0; i < height; i++)
			{
				bytes[i] = new sbyte[width];
			}
			this.width = width;
			this.height = height;
		}
		
		public sbyte get_Renamed(int x, int y)
		{
			return bytes[y][x];
		}
		
		internal void  set_Renamed(int x, int y, sbyte value_Renamed)
		{
			bytes[y][x] = value_Renamed;
		}
		
		internal void  set_Renamed(int x, int y, int value_Renamed)
		{
			bytes[y][x] = (sbyte) value_Renamed;
		}
		
		internal void  clear(sbyte value_Renamed)
		{
			for (int y = 0; y < height; ++y)
			{
				for (int x = 0; x < width; ++x)
				{
					bytes[y][x] = value_Renamed;
				}
			}
		}
		
		public override System.String ToString()
		{
			System.Text.StringBuilder result = new System.Text.StringBuilder(2 * width * height + 2);
			for (int y = 0; y < height; ++y)
			{
				for (int x = 0; x < width; ++x)
				{
					switch (bytes[y][x])
					{
						
						case 0: 
							result.Append(" 0");
							break;
						
						case 1: 
							result.Append(" 1");
							break;
						
						default: 
							result.Append("  ");
							break;
						
					}
				}
				result.Append('\n');
			}
			return result.ToString();
		}
	}
}