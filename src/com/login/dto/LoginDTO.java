package com.login.dto;

//기본생성자, 인자4개받는 생성자, setter & getter
public class LoginDTO {
	/*
	 * @param userid: user id sequence number
	 *
	 * @param id : user's id
	 *
	 * @param pw : user's password
	 *
	 * @param name : user's name
	 *
	 * @param nickname : user's nickname (privacy issue)
	 *
	 * @param age : user's age
	 *
	 * @param phone : user's phone number
	 *
	 * @param addr : user's address.
	 */
	private int userid;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private int age;
	private String phone;
	private String addr;

	// - Constructor
	public LoginDTO() {
		super();
	}

	public LoginDTO(int userid, String id, String pw, String name,
			String nickname, int age, String phone, String addr) {
		super();
		this.userid = userid;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.age = age;
		this.phone = phone;
		this.addr = addr;
	}

	// - Setter & Getter
	public int getuserid() {
		return userid;
	}
	public void setuserid(int userid) {
		this.userid = userid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Override
	public String toString() {
		return "LoginDTO [userid=" + userid + ", id=" + id + ", pw=" + pw
				+ ", name=" + name + ", nickname=" + nickname + ", age=" + age
				+ ", phone=" + phone + ", addr=" + addr + "]";
	}

}
