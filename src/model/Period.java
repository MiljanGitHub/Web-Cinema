package model;

import java.time.LocalDateTime;

public class Period extends Moviefiable{
	
	private int id;
	private LocalDateTime start;
	private LocalDateTime end;
	
	
	
	public Period(int id, boolean active, LocalDateTime start, LocalDateTime end) {
		super(id, active);
		
		this.start = start;
		this.end = end;
	};
	
	public Period() {this(-1, false, null, null);}
	
	
	//Kad se bude pravila nova projekcija
	public Period(int id, boolean active,  LocalDateTime start, int movieDuration) {
		this.id = id;
		this.active = active;
		this.start = start;		
		this.end = LocalDateTime.of
				(start.getYear(), start.getMonth(), start.getDayOfMonth(), 
				start.getHour(), start.getMinute()).plusMinutes(movieDuration);		
	}
	
	public boolean overlaps(Period other) {
		if ( this.getStart().isBefore(other.getStart()) && this.getEnd().isBefore(other.getStart())) {
			return false;
		} else if (this.getStart().isAfter(other.getEnd()) && this.getEnd().isAfter(other.getEnd())) {
			return false;
		} else return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getStart() {
		return start;
	}

	public void setStart(LocalDateTime start) {
		this.start = start;
	}

	public LocalDateTime getEnd() {
		return end;
	}

	public void setEnd(LocalDateTime end) {
		this.end = end;
	}
	
	
	
}
