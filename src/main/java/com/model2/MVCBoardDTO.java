package com.model2;

import java.util.Date;

public class MVCBoardDTO {
    private String idx;
    private String name;
    private String title;
    private String content;
    private String ofile;
    private String sfile;
    private String pass;
    private int downcount;
    private Date postdate;
    private int visitcount;

    public MVCBoardDTO() {
    }
    public String getIdx() {
        return idx;
    }

    public void setIdx(String idx) {
        this.idx = idx;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOfile() {
        return ofile;
    }

    public void setOfile(String ofile) {
        this.ofile = ofile;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getDowncount() {
        return downcount;
    }

    public void setDowncount(int downcount) {
        this.downcount = downcount;
    }

    public Date getPostdate() {
        return postdate;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSfile() {
        return sfile;
    }

    public void setSfile(String sfile) {
        this.sfile = sfile;
    }

    public int getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }
}


