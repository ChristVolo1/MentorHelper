package com.invent.app.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ServiceType {
	
	other("Other"),
	lawnCare("Lawn Care"),
	groceries("Grocery Shopping"),
	techSupport("Tech Support/Tutorials/Setup"),
	errands("Errands"),
	housekeeping("Housekeeping"),
	generalLabor("General Labor"),
	tutoring("Tutoring in Subject"),
	mentoring("Mentoring in Skill/Finances/etc."),
	monetaryAmt("Monetary Amount");
	
	private String id;

    private ServiceType(String id){
        this.id = id;
    }

    public String getId()
    {
        return id;
    }

	
}
