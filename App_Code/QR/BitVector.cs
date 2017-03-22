using System;
namespace snow.qr.generator.encoder
{
	
	internal sealed class BitVector
	{
		internal sbyte[] Array
		{
			// Callers should not assume that array.length is the exact number of bytes needed to hold
			// sizeInBits - it will typically be larger for efficiency.
			
			get
			{
				return array;
			}
			
		}
		
		private int sizeInBits;
		private sbyte[] array;
		
		// For efficiency, start out with some room to work.
		private const int DEFAULT_SIZE_IN_BYTES = 32;
		
		internal BitVector()
		{
			sizeInBits = 0;
			array = new sbyte[DEFAULT_SIZE_IN_BYTES];
		}
		
		// Return the bit value at "index".
		internal int at(int index)
		{
			if (index < 0 || index >= sizeInBits)
			{
				throw new System.ArgumentException("Bad index: " + index);
			}
			int value_Renamed = array[index >> 3] & 0xff;
			return (value_Renamed >> (7 - (index & 0x7))) & 1;
		}
		
		// Return the number of bits in the bit vector.
		internal int size()
		{
			return sizeInBits;
		}
		
		// Return the number of bytes in the bit vector.
		internal int sizeInBytes()
		{
			return (sizeInBits + 7) >> 3;
		}
		
		// Append one bit to the bit vector.
		internal void  appendBit(int bit)
		{
			if (!(bit == 0 || bit == 1))
			{
				throw new System.ArgumentException("Bad bit");
			}
			int numBitsInLastByte = sizeInBits & 0x7;
			// We'll expand array if we don't have bits in the last byte.
			if (numBitsInLastByte == 0)
			{
				appendByte(0);
				sizeInBits -= 8;
			}
			// Modify the last byte.
			array[sizeInBits >> 3] |= (sbyte) ((bit << (7 - numBitsInLastByte)));
			++sizeInBits;
		}
		
		// Append "numBits" bits in "value" to the bit vector.
		// REQUIRES: 0<= numBits <= 32.
		//
		// Examples:
		// - appendBits(0x00, 1) adds 0.
		// - appendBits(0x00, 4) adds 0000.
		// - appendBits(0xff, 8) adds 11111111.
		internal void  appendBits(int value_Renamed, int numBits)
		{
			if (numBits < 0 || numBits > 32)
			{
				throw new System.ArgumentException("Num bits must be between 0 and 32");
			}
			int numBitsLeft = numBits;
			while (numBitsLeft > 0)
			{
				// Optimization for byte-oriented appending.
				if ((sizeInBits & 0x7) == 0 && numBitsLeft >= 8)
				{
					int newByte = (value_Renamed >> (numBitsLeft - 8)) & 0xff;
					appendByte(newByte);
					numBitsLeft -= 8;
				}
				else
				{
					int bit = (value_Renamed >> (numBitsLeft - 1)) & 1;
					appendBit(bit);
					--numBitsLeft;
				}
			}
		}
		
		// Append "bits".
		internal void  appendBitVector(BitVector bits)
		{
			int size = bits.size();
			for (int i = 0; i < size; ++i)
			{
				appendBit(bits.at(i));
			}
		}
		
		// Modify the bit vector by XOR'ing with "other"
		internal void  xor(BitVector other)
		{
			if (sizeInBits != other.size())
			{
				throw new System.ArgumentException("BitVector sizes don't match");
			}
			int sizeInBytes = (sizeInBits + 7) >> 3;
			for (int i = 0; i < sizeInBytes; ++i)
			{
				// The last byte could be incomplete (i.e. not have 8 bits in
				// it) but there is no problem since 0 XOR 0 == 0.
				array[i] ^= other.array[i];
			}
		}
		
		// Return String like "01110111" for debugging.
		public override System.String ToString()
		{
			System.Text.StringBuilder result = new System.Text.StringBuilder(sizeInBits);
			for (int i = 0; i < sizeInBits; ++i)
			{
				if (at(i) == 0)
				{
					result.Append('0');
				}
				else if (at(i) == 1)
				{
					result.Append('1');
				}
				else
				{
					throw new System.ArgumentException("Byte isn't 0 or 1");
				}
			}
			return result.ToString();
		}
		
		// Add a new byte to the end, possibly reallocating and doubling the size of the array if we've
		// run out of room.
		private void  appendByte(int value_Renamed)
		{
			if ((sizeInBits >> 3) == array.Length)
			{
				sbyte[] newArray = new sbyte[(array.Length << 1)];
				// Redivivus.in Java to c# Porting update
				// 30/01/2010 
				// added namespace system
				System.Array.Copy(array, 0, newArray, 0, array.Length);
				array = newArray;
			}
			array[sizeInBits >> 3] = (sbyte) value_Renamed;
			sizeInBits += 8;
		}
	}
}