package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the Serves_Client database table.
 * 
 */
@Embeddable
public class Serves_ClientPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable=false, updatable=false)
	private int cid;

	@Column(insertable=false, updatable=false)
	private int eid;

	public Serves_ClientPK() {
	}
	public int getCid() {
		return this.cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getEid() {
		return this.eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof Serves_ClientPK)) {
			return false;
		}
		Serves_ClientPK castOther = (Serves_ClientPK)other;
		return 
			(this.cid == castOther.cid)
			&& (this.eid == castOther.eid);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cid;
		hash = hash * prime + this.eid;
		
		return hash;
	}
}