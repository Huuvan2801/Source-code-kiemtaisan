﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace kiemketaisan.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class Data : DbContext
    {
        public Data()
            : base("name=Data")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<PhongBan> PhongBans { get; set; }
        public virtual DbSet<ThongTin> ThongTins { get; set; }
        public virtual DbSet<TaiSan> TaiSans { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }
    }
}
