package com.kh.shipcontrol.vo;

public class PaginationDTO {

	int currentPage;
	int startLine;
	int endLine;
	int wholePage;
	int perPage = 10;

	public PaginationDTO() {

	}

	public PaginationDTO(int currentPage) {
		this.currentPage = currentPage;
		this.startLine = currentPage * 10 - 9;
		this.endLine = currentPage * 10;

	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getStartLine() {
		return startLine;
	}

	public void setStartLine(int startLine) {
		this.startLine = startLine;
	}

	public int getEndLine() {
		return endLine;
	}

	public void setEndLine(int endLine) {
		this.endLine = endLine;
	}

	public int getWholePage() {
		return wholePage;
	}

	public void setWholePage(int wholePage) {
		this.wholePage = wholePage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	@Override
	public String toString() {
		return "PaginationDTO [currentPage=" + currentPage + ", startLine=" + startLine + ", endLine=" + endLine
				+ ", wholePage=" + wholePage + ", perPage=" + perPage + "]";
	}

}
