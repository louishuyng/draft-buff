## Draft Buff

It be created to help vim user easily create new buffer with chosen language for testing or use it as presentation

## Supported Languages

- Ruby
- Typescript
- Javascript
- Golang
- Java
- Python
- Rust
- C
- C++
- Swift
- Haskell
- Scala
- Http

## Demo

[![asciicast](https://asciinema.org/a/ze3pHhThileq7uZE5KLyeWCc4.svg)](https://asciinema.org/a/ze3pHhThileq7uZE5KLyeWCc4)

## Installation

```lua
use {
  'loishy/draft-buff',
  requires = {
    'MunifTanjim/nui.nvim'
  },
}
```

## Usage

```lua
:lua require"draft-buff".select_lang()
```

## Override the default List
```lua
vim.g.draft_buff_languages = {'Http', 'Ruby', 'Javascript', 'Golang'}
```
