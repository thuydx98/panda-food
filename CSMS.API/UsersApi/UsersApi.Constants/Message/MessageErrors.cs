﻿using System;
using System.Collections.Generic;
using System.Text;

namespace UsersApi.Constants.Message
{
    public class MessageErrors
    {
        public static readonly string InternalServerError = "Internal Server Error";
        public static readonly string NotFound = "Data not found";
        public static readonly string PermissionDenied = "Permission denied";
        public static readonly string NoContent = "No Content";
        public static readonly string SomeDataEmptyOrInvalid = "Some data is empty or invalid";
        public static readonly string NotAcceptable = "Data not acceptable";
        public static readonly string DataConflict = "Data is conflict";
        public static readonly string Forbidden = "Data is forbidden";
        public static readonly string DataIsExists = "{0} has already exists.";
    }
}
