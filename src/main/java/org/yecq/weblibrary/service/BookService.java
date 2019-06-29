package org.yecq.weblibrary.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.yecq.weblibrary.bean.BookInfo;
import org.yecq.weblibrary.bean.PagedData;

/**
 *
 * @author yecq
 */
@Service
public class BookService {

    @Autowired
    private JdbcTemplate jdbc;

    public PagedData searchBooks(int page, int rows, String keyword) {
        PagedData ret = new PagedData();
        String sql = "select id,name,isbn,author,publisher,pubdate,url from book";
        List<Object> param = new LinkedList();
        String where = "";
        if (keyword != null && !keyword.equals("")) {
            where = " where (name like ? or author like ?)";
            param.add("%" + keyword + "%");
            param.add("%" + keyword + "%");
        }
        //分页
        int start = (page - 1) * rows;
        String limit = " limit ?,?";
        param.add(start);
        param.add(rows);

        List<Map<String, Object>> list = this.jdbc.queryForList(sql + where + limit, param.toArray());
        List<BookInfo> data = new LinkedList();
        for (Map<String, Object> item : list) {
            BookInfo b = new BookInfo();
            b.setId(Integer.parseInt(item.get("id") + ""));
            b.setName(item.get("name") + "");
            b.setIsbn(item.get("isbn") + "");
            b.setAuthor(item.get("author") + "");
            b.setPublisher(item.get("publisher") + "");
            b.setPubdate(item.get("pubdate") + "");
            b.setUrl(item.get("url") + "");
            data.add(b);
        }

        // 算总数
        param.clear();
        if (!where.equals("")) {
            param.add("%" + keyword + "%");
            param.add("%" + keyword + "%");
        }
        list = this.jdbc.queryForList("select count(*) as all1 from book" + where, param.toArray());
        int count = Integer.parseInt(list.get(0).get("all1") + "");

        ret.setPage(page);
        ret.setTotal(count);
        ret.setRows(data);

        return ret;
    }
}
