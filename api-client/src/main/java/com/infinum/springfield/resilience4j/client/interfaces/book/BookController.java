package com.infinum.springfield.resilience4j.client.interfaces.book;

import com.infinum.springfield.resilience4j.client.application.book.BookClient;
import com.infinum.springfield.resilience4j.client.application.book.BookDto;
import com.infinum.springfield.resilience4j.client.application.shared.PagedResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
class BookController {

    private final BookClient bookClient;

    BookController(BookClient bookClient) {
        this.bookClient = bookClient;
    }

    @GetMapping("/books")
    String getBooks(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size,
            Model model) {
        PagedResponse<BookDto> bookResponse = this.bookClient.getBooks(page, size);
        model.addAttribute("books", bookResponse.content());
        model.addAttribute("pageMetadata", bookResponse.page());
        return "books";
    }
}
