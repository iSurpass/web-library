package org.yecq.weblibrary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.yecq.weblibrary.bean.PagedData;
import org.yecq.weblibrary.service.BookService;

import javax.servlet.http.HttpSession;

/**
 *
 * @author yecq
 */
@RestController
public class BookController {

    @Autowired
    private BookService bs;

    @RequestMapping("if/list-search-book.php")
    public PagedData listSearchBook(@RequestParam("page") int page, @RequestParam("rows") int rows, @RequestParam(value = "keyword", required = false) String keyword, HttpSession session) {
        return this.bs.searchBooks(page, rows, keyword);
    }
}
