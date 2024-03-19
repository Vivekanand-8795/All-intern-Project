using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AuthenticationFlow.Models
{
    public class ErrorLog
    {
        public int Id { get; set; }
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
        public DateTime Timestamp { get; set; }
    }
}