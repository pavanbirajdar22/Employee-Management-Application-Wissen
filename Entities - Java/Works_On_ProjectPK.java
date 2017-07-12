package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Works_On_Project database table.
 * 
 */
@Embeddable
public class Works_On_ProjectPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private int eid;

	@Column(insertable=false, updatable=false)
	private int pid;

	public Works_On_ProjectPK() {
	}
	public int getEid() {
		return this.eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public int getPid() {
		return this.pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof Works_On_ProjectPK)) {
			return false;
		}
		Works_On_ProjectPK castOther = (Works_On_ProjectPK)other;
		return 
			(this.eid == castOther.eid)
			&& (this.pid == castOther.pid);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.eid;
		hash = hash * prime + this.pid;
		
		return hash;
	}
}