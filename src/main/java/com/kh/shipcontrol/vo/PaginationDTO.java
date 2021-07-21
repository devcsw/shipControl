package com.kh.shipcontrol.vo;

public class PaginationDTO {

	int currentPage;
	int startLine;
	int endLine;
	int wholePage;
	int perPage = 10;
	int startPage;
	int endPage;

	public PaginationDTO() {

	}

	public PaginationDTO(int currentPage, int wholePage) {
		this.currentPage = currentPage;
		this.startLine = currentPage * perPage - 9;
		this.endLine = currentPage * perPage;
		this.wholePage = wholePage;

		this.startPage = currentPage / perPage + 1;

		if (currentPage * perPage > wholePage) {
			this.endPage = wholePage;
		} else {
			this.endPage = currentPage * perPage;
		}

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

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PaginationDTO [currentPage=" + currentPage + ", startLine=" + startLine + ", endLine=" + endLine
				+ ", wholePage=" + wholePage + ", perPage=" + perPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}

}
