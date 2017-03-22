using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class SocialNetworkingText
{
    public SocialNetworkingText()
    {
    }
    static public string SplitText(string input)
    {
        string data = input.ToString();
        string[] words = data.Split(' ');
        input = data = string.Empty;
        foreach (string word in words)
        {
            data += word + ",";
        }
        return data.ToString();
    }
}