﻿// <auto-generated />
using System;
using API.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace API.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20221107051326_AddedLikeEntity")]
    partial class AddedLikeEntity
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder, 1L, 1);

            modelBuilder.Entity("API.Models.Like", b =>
                {
                    b.Property<int>("liker_id")
                        .HasColumnType("int");

                    b.Property<int>("likee_id")
                        .HasColumnType("int");

                    b.HasKey("liker_id", "likee_id");

                    b.HasIndex("likee_id");

                    b.ToTable("Like");
                });

            modelBuilder.Entity("API.Models.Photo", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("id"), 1L, 1);

                    b.Property<DateTime>("date_added")
                        .HasColumnType("datetime2");

                    b.Property<string>("description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("is_main")
                        .HasColumnType("bit");

                    b.Property<string>("public_id")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("url")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("userid")
                        .HasColumnType("int");

                    b.HasKey("id");

                    b.HasIndex("userid");

                    b.ToTable("Photos");
                });

            modelBuilder.Entity("API.Models.User", b =>
                {
                    b.Property<int>("id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("id"), 1L, 1);

                    b.Property<string>("city")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("country")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("created")
                        .HasColumnType("datetime2");

                    b.Property<DateTime>("date_of_birth")
                        .HasColumnType("datetime2");

                    b.Property<string>("gender")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("interests")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("introduction")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("known_as")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("last_active")
                        .HasColumnType("datetime2");

                    b.Property<string>("looking_for")
                        .HasColumnType("nvarchar(max)");

                    b.Property<byte[]>("password_hash")
                        .HasColumnType("varbinary(max)");

                    b.Property<byte[]>("password_salt")
                        .HasColumnType("varbinary(max)");

                    b.Property<string>("username")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("id");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("API.Models.Like", b =>
                {
                    b.HasOne("API.Models.User", "likee")
                        .WithMany("likers")
                        .HasForeignKey("likee_id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("API.Models.User", "likers")
                        .WithMany("likees")
                        .HasForeignKey("liker_id")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("likee");

                    b.Navigation("likers");
                });

            modelBuilder.Entity("API.Models.Photo", b =>
                {
                    b.HasOne("API.Models.User", "user")
                        .WithMany("photos")
                        .HasForeignKey("userid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("user");
                });

            modelBuilder.Entity("API.Models.User", b =>
                {
                    b.Navigation("likees");

                    b.Navigation("likers");

                    b.Navigation("photos");
                });
#pragma warning restore 612, 618
        }
    }
}
