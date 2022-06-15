package com.example.project.entities;

import java.util.Date;

public class NhanVien {
    private Integer id;
    private String ten;
    private Integer gioitinh;
    private Date ngaysinh;
    private Date ngayvaolam;
    private Date ngaycapnhat;
    private String sdt;
    private String email;
    private String diachi;
    private Integer idphanquyen;
    private Float luongcoban;
    private String username;
    private String password;
    private String ghichu;
    private String trangthai;

    public NhanVien() {
    }

    public NhanVien(Integer id, String ten, Integer gioitinh, Date ngaysinh, Date ngayvaolam, Date ngaycapnhat, String sdt, String email, String diachi, Integer idphanquyen, Float luongcoban, String username, String password, String ghichu, String trangthai) {
        this.id = id;
        this.ten = ten;
        this.gioitinh = gioitinh;
        this.ngaysinh = ngaysinh;
        this.ngayvaolam = ngayvaolam;
        this.ngaycapnhat = ngaycapnhat;
        this.sdt = sdt;
        this.email = email;
        this.diachi = diachi;
        this.idphanquyen = idphanquyen;
        this.luongcoban = luongcoban;
        this.username = username;
        this.password = password;
        this.ghichu = ghichu;
        this.trangthai = trangthai;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public Integer getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(Integer gioitinh) {
        this.gioitinh = gioitinh;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public Date getNgayvaolam() {
        return ngayvaolam;
    }

    public void setNgayvaolam(Date ngayvaolam) {
        this.ngayvaolam = ngayvaolam;
    }

    public Date getNgaycapnhat() {
        return ngaycapnhat;
    }

    public void setNgaycapnhat(Date ngaycapnhat) {
        this.ngaycapnhat = ngaycapnhat;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public Integer getIdphanquyen() {
        return idphanquyen;
    }

    public void setIdphanquyen(Integer idphanquyen) {
        this.idphanquyen = idphanquyen;
    }

    public Float getLuongcoban() {
        return luongcoban;
    }

    public void setLuongcoban(Float luongcoban) {
        this.luongcoban = luongcoban;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }

    public String getTrangthai() {
        return trangthai;
    }

    public void setTrangthai(String trangthai) {
        this.trangthai = trangthai;
    }
}
