package com.example.demo.domain;

public class employee {

	private String employee_no;
	private String employee_rank_code;
	private String employee_position_code;
	private String employee_name;
	private String employee_type_code;
	private String gender;
	private String birthday;
	private String postal_code;
	private String address_1;
	private String address_2;
	private String employee_memo;
	
	public String getemployee_no() {
		return employee_no;
	}
	public void setemployee_no(String employee_no) {
		this.employee_no = employee_no;
	}
	public String getemployee_rank_code() {
		return employee_rank_code;
	}
	public void setemployee_rank_code(String employee_rank_code) {
		this.employee_rank_code = employee_rank_code;
	}
	public String getemployee_position_code() {
		return employee_position_code;
	}
	public void setemployee_position_code(String employee_position_code) {
		this.employee_position_code = employee_position_code;
	}
	public String getemployee_name() {
		return employee_name;
	}
	public void setemployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getemployee_type_code() {
		return employee_type_code;
	}
	public void setemployee_type_code(String employee_type_code) {
		this.employee_type_code = employee_type_code;
	}
	public String getgender() {
		return gender;
	}
	public void setgender(String gender) {
		this.gender = gender;
	}
	public String getbirthday() {
		return birthday;
	}
	public void setbirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getpostal_code() {
		return postal_code;
	}
	public void setpostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getaddress_1() {
		return address_1;
	}
	public void setaddress_1(String address_1) {
		this.address_1 = address_1;
	}
	public String getaddress_2() {
		return address_2;
	}
	public void setaddress_2(String address_2) {
		this.address_2 = address_2;
	}
	public String getemployee_memo() {
		return employee_memo;
	}
	public void setemployee_memo(String employee_memo) {
		this.employee_memo = employee_memo;
	}
	
	//Paging ADD
		private int totalcount;//전체 게시물 개수
	    private int countlist;
	    private int pagenum;//첫페이지를 표시하기 위함, 페이지 번호를 나타낸다
	    private int contentnum;//한페이지에 몇개 보일지
	    private int startpage=1;//beginpage 디폴트 1
	    private int endpage=5;//endpage 디폴트 5
	    private boolean prev=false;//이전 페이지 화살표
	    private boolean next;//다음 페이지 화살표
	    private int currentblock=1;
	    private int lastblock;

		public boolean isprev() {
	        return prev;
	    }
	 
	    public void setprev(boolean prev) {
	        this.prev = prev;
	    }
	 
	    public boolean isnext() {
	        return next;
	    }
	 
	    public void setnext(boolean next) {
	        this.next = next;
	    }
	 
	    public int getstartpage() {
	        return startpage;
	    }
	 
	    public void setstartpage(int currentblock) {
	        this.startpage = (currentblock*5)-4;
	        //한 페이지에 5개씩 보여지므로
	        //현재 페이지 블록의 번호 * 블록당 페이지의 개수(5) - 4를 하면 시작 페이지 번호를 정할 수 있다
	    }
	 
	    public int getendpage() {
	        return endpage;
	    }
	 
	    public void setendpage(int getlastblock,int getcurrentblock) {
	        if (getlastblock==getcurrentblock) {
	            this.endpage = calcpage(gettotalcount(), getcontentnum());
	        }
	        else {
	            this.endpage = getstartpage()+4;
	        }
	        //기본 시작페이지 +4
	        //조건 , 마지막 페이지 블록이면 마지막 페이지 번호
	    }
	    
	 
	    public int getcurrentblock() {
	        return currentblock;
	    }
	 
	    public void setcurrentblock(int pagenum) {//현재 페이지 블록의 번호가 몇번인지 지정해주는 함수
//	        페이지번호 / 페이지 그룹 안의 페이지 개수(5)
//	        ->나머지 있으면 더하기 1한다. -> 이 결과를 현재 블록 번호라고 부른다. cblock
	 
	        this.currentblock = pagenum/5;
	        if (pagenum%5>0) {
	            this.currentblock++;
	        }
	    }
	 
	    public int getlastblock() {
	        return lastblock;
	    }
	 
	    public void setlastblock(int totalcount) {//마지막 페이지 블록의 번호가 뭔지 지정해주는 함수
	        //전체 글 개수를 사용해서 지정한다
	        this.lastblock = totalcount / (5*this.contentnum);
	        if (totalcount%(5*this.contentnum)>0) {
	            this.lastblock++;
	        }
//	        전체 글 개수(128) / 페이지 그룹 안의 페이지 개수(5) * 한페이지당 글 개수(10)
//	        ->나머지 있으면 더하기 1한다. -> 이 결과를 마지막 블록 번호라고 부른다. last block
	    }
	 
	    public void prevnext(int pagenum) {
	        
	        if (pagenum>0 && pagenum<6) {
	            setprev(false);
	            setnext(true);
	        }
	        else if(getlastblock()==getcurrentblock()) {//5개씩 페이지의 그룹번호를 지정한다.
	            //그룹 번호가 3이라는 것은 해당 페이지 그룹이 마지막이라는 것이기에 이전 화살표만 활성화한다 
	            //이 두개가 같다면 마지막 블록이므로 이전만 있고 이후가 없다.

	            setprev(true);
	            setnext(false);        
	        }
	        else {
	            setprev(true);
	            setnext(true);
	        }
	    }
	    public int calcpage(int totalcount,int contentnum) {//전체 몇페이지까지 있을지 함수로 계산한다
	        int totalpage = totalcount/contentnum;//전체 게시물 수를 한 페이지당 몇개 보이는지로 나눈다
	        if (totalcount % contentnum>0) {//그리고 나머지가 있다면 1을 더해서 한 페이지 증가 시킨다
	            totalpage++;
	        }
	        if (totalpage<this.pagenum) {
	            this.pagenum=totalpage;
	        }
	        return totalpage;//페이지 개수를 리턴한다
	    }
	    
	    public int gettotalcount() {
	        return totalcount;
	    }
	 
	    public void settotalcount(int totalcount) {
	        this.totalcount = totalcount;
	    }
	    public int getcountlist() {
	        return countlist;
	    }
	 
	    public void setcountlist(int countlist) {
	        this.countlist = countlist;
	    }
	 
	    public int getpagenum() {
	        return pagenum;
	    }
	 
	    public void setpagenum(int pagenum) {
	        this.pagenum = pagenum;
	    }
	 
	    public int getcontentnum() {
	        return contentnum;
	    }
	 
	    public void setcontentnum(int contentnum) {
	        this.contentnum = contentnum;
	    }
	    
	    //Search ADD
	    private String searchtype;
		private String keyword;	
				
		public String getsearchtype() {
			return searchtype;
		}
		
		public void setsearchtype(String searchtype) {
			this.searchtype = searchtype;
		}
		
		public String getkeyword() {
			return keyword;
		}

		public void setkeyword(String keyword) {
			this.keyword = keyword;
		}
}

