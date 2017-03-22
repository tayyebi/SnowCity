using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

public class SocialNetworkingHashCode
{
	public SocialNetworkingHashCode()
	{
	}
    
    static public string converttohash(string inputvalue)
    {
        string output;
        string sSourceData;
        byte[] tmpSource;
        byte[] tmpHash;
        sSourceData = inputvalue;
        tmpSource = ASCIIEncoding.ASCII.GetBytes(sSourceData);
        tmpHash = new MD5CryptoServiceProvider().ComputeHash(tmpSource);
        output = ByteArrayToString(tmpHash);
        return output;
    }
    static string ByteArrayToString(byte[] arrInput)
    {
        int i;
        StringBuilder sOutput = new StringBuilder(arrInput.Length);
        for (i = 0; i < arrInput.Length; i++)
        {
            sOutput.Append(arrInput[i].ToString("X2"));
        }
        return sOutput.ToString();
    }
    static public bool comparehashvalues(string textvalue, string hashvalue)
    {
        bool output = false;
        string tmpNewHash = converttohash(textvalue);
        string tmpHash = hashvalue;
        if (tmpHash.Length == tmpNewHash.Length)
        {
            int i = 0;
            while ((i < tmpNewHash.Length) && (tmpNewHash[i] == tmpHash[i]))
            {
                i += 1;
            }
            if (i == tmpNewHash.Length)
                output = true;
        }
        return output;
    }
}