using System;
namespace snow.qr.generator.common.reedsolomon
{
	internal sealed class ReedSolomonEncoder
	{
		
		//UPGRADE_NOTE: Final was removed from the declaration of 'field '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private GF256 field;
		//UPGRADE_NOTE: Final was removed from the declaration of 'cachedGenerators '. "ms-help://MS.VSCC.v80/dv_commoner/local/redirect.htm?index='!DefaultContextWindowIndex'&keyword='jlca1003'"
		private System.Collections.ArrayList cachedGenerators;
		
		internal ReedSolomonEncoder(GF256 field)
		{
			if (!GF256.QR_CODE_FIELD.Equals(field))
			{
				throw new System.ArgumentException("Only QR Code is supported at this time");
			}
			this.field = field;
			this.cachedGenerators = System.Collections.ArrayList.Synchronized(new System.Collections.ArrayList(10));
			cachedGenerators.Add(new GF256Poly(field, new int[]{1}));
		}
		
		private GF256Poly buildGenerator(int degree)
		{
			if (degree >= cachedGenerators.Count)
			{
				GF256Poly lastGenerator = (GF256Poly) cachedGenerators[cachedGenerators.Count - 1];
				for (int d = cachedGenerators.Count; d <= degree; d++)
				{
					GF256Poly nextGenerator = lastGenerator.multiply(new GF256Poly(field, new int[]{1, field.exp(d - 1)}));
					cachedGenerators.Add(nextGenerator);
					lastGenerator = nextGenerator;
				}
			}
			return (GF256Poly) cachedGenerators[degree];
		}
		
		internal void  encode(int[] toEncode, int ecBytes)
		{
			if (ecBytes == 0)
			{
				throw new System.ArgumentException("No error correction bytes");
			}
			int dataBytes = toEncode.Length - ecBytes;
			if (dataBytes <= 0)
			{
				throw new System.ArgumentException("No data bytes provided");
			}
			GF256Poly generator = buildGenerator(ecBytes);
			int[] infoCoefficients = new int[dataBytes];
			Array.Copy(toEncode, 0, infoCoefficients, 0, dataBytes);
			GF256Poly info = new GF256Poly(field, infoCoefficients);
			info = info.multiplyByMonomial(ecBytes, 1);
			GF256Poly remainder = info.divide(generator)[1];
			int[] coefficients = remainder.Coefficients;
			int numZeroCoefficients = ecBytes - coefficients.Length;
			for (int i = 0; i < numZeroCoefficients; i++)
			{
				toEncode[dataBytes + i] = 0;
			}
			Array.Copy(coefficients, 0, toEncode, dataBytes + numZeroCoefficients, coefficients.Length);
		}
	}
}