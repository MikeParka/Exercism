using System;

public static class LogAnalysis
{
    // Define the 'SubstringAfter()' extension method on the `string` type
    public static string SubstringAfter(this string input, string delimiter)
    {
        int delimiterIndex = input.IndexOf(delimiter);
        return delimiterIndex != -1 ? input.Substring(delimiterIndex + delimiter.Length).Trim() : input;
    }

    // Define the 'SubstringBetween()' extension method on the `string` type
    public static string SubstringBetween(this string input, string start, string end)
    {
        int startIndex = input.IndexOf(start) + start.Length;
        int endIndex = input.IndexOf(end, startIndex);
        return (startIndex != -1 && endIndex != -1) ? input.Substring(startIndex, endIndex - startIndex).Trim() : input;
    }

    // Define the 'Message()' extension method on the `string` type
    public static string Message(this string input)
    {
        return input.SubstringAfter(": ");
    }

    // Define the 'LogLevel()' extension method on the `string` type
    public static string LogLevel(this string input)
    {
        return input.SubstringBetween(" [", "]:");
    }
}

class Program
{
    static void Main()
    {
        // Example usage
        var log = "[INFO]: File Deleted.";

        // SubstringAfter example
        var resultAfter = log.SubstringAfter(": ");
        Console.WriteLine("SubstringAfter result: " + resultAfter);

        // Message example
        var message = log.Message();
        Console.WriteLine("Message result: " + message);

        // LogLevel example
        var logLevel = log.LogLevel();
        Console.WriteLine("LogLevel result: " + logLevel);
    }
}
