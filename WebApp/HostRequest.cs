//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApp
{
    using System;
    using System.Collections.Generic;
    
    public partial class HostRequest
    {
        public int id { get; set; }
        public Nullable<bool> approved { get; set; }
        public int matchID { get; set; }
        public int stadiumManagerID { get; set; }
        public int clubRepresentativeID { get; set; }
    
        public virtual ClubRepresentative ClubRepresentative { get; set; }
        public virtual Match Match { get; set; }
        public virtual StadiumManager StadiumManager { get; set; }
    }
}