package com.infinum.springfield.resilience4j.server.interfaces;

import com.infinum.springfield.resilience4j.server.domain.book.Book;
import com.infinum.springfield.resilience4j.server.domain.book.BookRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PagedModel;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/books")
class BookController {

    private final BookRepository bookRepository;

    BookController(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    @GetMapping("/{id}")
    ResponseEntity<Book> getBookById(@PathVariable Long id) {
        return ResponseEntity.of(this.bookRepository.findById(id));
    }

    @GetMapping
    ResponseEntity<PagedModel<Book>> getAllBooks(Pageable pageable) {
        return ResponseEntity.ok(new PagedModel<>(this.bookRepository.findAll(pageable)));
    }

}
