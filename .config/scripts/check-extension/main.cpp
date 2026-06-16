// that's not quite a script, but idc, i didn't know where to put it

#include <cstddef>
#include <filesystem>
#include <iostream>

#define GREEN "\033[32m"
#define RED_BOLD "\033[1;31m"

#define RESET "\033[0m"

int main(int argc, char *argv[]) {
  if (argc < 2) {
    std::cout << RED_BOLD << "Pass a path as argument" << RESET << '\n';

    return 1;
  }

  for (std::size_t i = 1; i < argc; ++i) {
    std::filesystem::path path{argv[i]};

    if (std::filesystem::is_directory(path)) {
      std::cout << RED_BOLD << "The path is a directory: " << RESET
                << path.string() << '\n';

      continue;
    }

    if (path.extension().string() == "") {
      std::cout << GREEN << "File: " << RESET << path.string() << GREEN
                << ", doesn't have an extension" << RESET << '\n';

      continue;
    }

    std::cout << GREEN << "File: " << RESET << path.string() << GREEN
              << ", extension: " << RESET << path.extension().string() << '\n';
  }

  return 0;
}
