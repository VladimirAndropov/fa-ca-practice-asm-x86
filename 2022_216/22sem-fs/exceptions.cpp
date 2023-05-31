#include <iostream>
#include <thread>
#include <future>

void func(std::promise<int> p) {
    // throw std::logic_error("hello");
    try {
        throw std::logic_error("hello");
    } catch (...) {
        p.set_exception(std::current_exception());
    }
}


int main() {
    std::promise<int> p;
    std::future<int> f = p.get_future();


    // поймаем исключение
    std::thread thr(func, std::move(p));
    try {
        f.get();
    } catch (...) {
        std::cout << "fixed" << std::endl;
    }
    thr.join();
}
