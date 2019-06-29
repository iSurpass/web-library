package org.yecq.weblibrary.bean;

import java.util.List;

/**
 *
 * @author yecq
 */
public class PagedData {
    private int page;
    private int total;
    private List rows;

    public PagedData() {
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }
}
