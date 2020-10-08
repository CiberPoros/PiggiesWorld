using System;

namespace PiggiesWorld.Common.Exceptions
{
    [Serializable]
    public class DALException : Exception
    {
        public DALType Type { get; }

        public DALException(DALType type) 
        {
            Type = type;
        }

        public DALException(DALType type, string message) : base(message)
        {
            Type = type;
        }

        public DALException(DALType type, string message, Exception inner) : base(message, inner)
        {
            Type = type;
        }

        protected DALException(
          System.Runtime.Serialization.SerializationInfo info,
          System.Runtime.Serialization.StreamingContext context) : base(info, context) { }
    }
}
