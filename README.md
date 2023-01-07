# neovim-tutorial
## Part 1: Vim Shortcuts
### Tutorial Video Links:
**Youtube**: [link]()\
**Bilibili**: [link]()
### Installation:
Open VScode, search ```Vim``` in ```Extensions```, and click install.
![imge](extension.png)

<br>
<br>

In the following keymappings, ```n``` stands for ```NORMAL``` mode, ```i``` stands for ```INSERT``` mode, ```v``` stands for ```VISUAL``` mode.

### Open and Close Files
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n``` | ```:w```     | Write(save) current buffer
| ```n``` | ```:q```     | Close current buffer  (would fail if you don't save first)
| ```n``` | ```:wq```    | Save and close current buffer
| ```n``` | ```:q!```     | Exit current buffer without saving
| ```n``` | ```:qa!```     | Exit all open buffers without saving
| ```n``` | ```:wqa```     | Save and exit all open buffers 



### Navigation
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```, ```v```     | ```h```     | Move left
| ```n```, ```v```     | ```j```     | Move down 
| ```n```, ```v```     | ```k```     | Move up 
| ```n```, ```v```     | ```l```     | Move right 
| ```n```, ```v```     | ```w```     | One word forward 
| ```n```, ```v```     | ```b```     | One word backward 
| ```n```, ```v```     | ```^```     | Beginning of line
| ```n```, ```v```     | ```$```     | End of line
| ```n```, ```v```     | ```gg```    | Beginning of file
| ```n```, ```v```     | ```G```     | End of file
| ```n```, ```v```     | ```{```     | One paragraph backward
| ```n```, ```v```     | ```}```     | One paragraph forward
| ```n```              | ```:[num-of-line]``` + ```Enter```     | Go to a specific line | 
| ```n```, ```v```     | ```/[search-item]``` + ```Enter``` + ```n```      | Find pattern and go to next match

### Enter ```INSERT``` Mode from ```NORMAL``` Mode
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```i```     | Insert before cursor |
| ```n```     | ```a```     | Append after cursor  |
| ```n```     | ```I```     | Insert at the beginning of the line |
| ```n```     | ```A```     | Append at the end of the line
| ```n```     | ```o```     | Insert to next line | 
| ```n```     | ```O```     | Insert to previous line | 
| ```n```     | ```O```     | Insert to previous line | 
| ```n```     | ```c``` + ```[Navigation]```| Delete from before the cursor to ```[Navigation]``` and insert. Exmaples are as follow | 
| ```n```     | ```c``` + ```w```| Delete from before the cursor to end of current word and insert  | 
| ```n```     | ```c``` + ```i``` + ```w```| Delete current word and insert  | 
| ```n```     | ```c``` + ```$```| Delete from before the cusror to end of the line and insert |
| ```i```     | ```<Esc>```     | Go back to Normal Mode, remap to ```jk``` recommended |

### Edit in ```NORMAL``` Mode
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```dd``` | Delete(cut) current line | 
| ```n```     | ```d``` + ```[Number]``` + ```d```| Delete(cut) following ```[Number]``` of lines|
| ```n```     | ```d``` + ```[Navigation]```     | Delete(cut) from before the cursor to ```[Navigation]```, similar to ```c``` + ```[Navigation]``` above|
| ```n```     | ```yy``` | Yank(cpy) current line | 
| ```n```     | ```y``` + ```[Number]``` + ```y```| Yank(copy) following ```[Number]``` of lines|
| ```n```     | ```y``` + ```[Navigation]```     | Yank(copy) from before the cursor to ```[Navigation]```, similar to ```c``` + ```[Navigation]``` above|
| ```n```     | ```p```     | Paste from what you delete or yank |
| ```n```     | ```x```     | Delete(cut) the character under the cursor|
| ```n```     | ```:%s/[foo]/[bar]/g```     | Find each occurrence of ```[foo]``` (in all lines), and replace it with ```[bar]```. More substitute commands [here](https://vim.fandom.com/wiki/Search_and_replace).|

### ```VISUAL``` mode shortcuts
| Mode        | Shortcut    | Description  |
| ----------- | ----------- | -----------  |
| ```n```     | ```v```     | Enter Visual Character Mode  |
| ```n```     | ```V```     | Enter Visual Line Mode  |
| ```n```     | ```Ctrl```+```v```| Enter Visual Block Mode  |
| ```v```     | ```<Esc>```| Exit Visual Mode, remap to ```jk``` recommended  |

### Vim settings under VSCode
1. Press ```Ctrl+Shift+p``` in VSCode
2. Find ```Preferences: Open User Settings (JSON)```, open ```settings.json```
3. Configure the file , all options are [here](https://github.com/VSCodeVim/Vim)
---

## Part 2: Neovim Setup

---
## Part 3: Neovim Language Protocol Server(LSP) Setup
