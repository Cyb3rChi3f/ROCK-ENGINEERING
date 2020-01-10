# Markdown Quickstart
It's time to learn some markdown. Click the icon on the far right of the toolbar that looks like a page in two columns named "`Toggle Side by Side F9`" on mouse-over. We will be typing on the left side and the right side will show us what it looks like when rendered.

There are two sections to this document:  
1. Formatting
2. Usage


## Formatting


### Headings
Lets start out with headers. There are 6 in total and defined in markdown
by starting your line with a pound, octothorp, or hashtag depending on what
generation you come from. Adding another to the start of the line and continuing
to add more will create the different headers:  

# Header1 - `#`
## Header2 - `##`
### Header3 - `###`
#### Header4 - `####`
##### Header5 - `#####`
###### Header6 - `######`


### Bold

To do BOLD things there are 2 ways which will make more sense when we do
both BOLD and ITALIC.
```
**BOLD**
__BOLD__
```

### Italic
```
*ITALIC*
_ITALIC_
```

> Note: Anyone want to guess how to do both bold and italic?  

***BOLD and ITALIC***  
**_BOLD and ITALIC_**  
__*BOLD and ITALIC*__  
___BOLD and ITALIC___  

```
***BOLD and ITALIC***  
**_BOLD and ITALIC_**  
__*BOLD and ITALIC*__  
___BOLD and ITALIC___  
```

> Note: Some markdown engines are just a little bit different and might only require a single `~` or only allow `bold` and `italic` with certain characters. For example, in Slack I can never get bold, italic, or strike through right in there my first try...


### Strike through

~~strike through~~  
`~~strike through~~`  


### Quotes

> This is a quote, useful for calling attention or adding exceptions etc.

`> This is a quote, useful for calling attention or adding exceptions etc.`  


### Bulleted Lists

If you start your line with a `*` or `-` you will created a bulleted item. I use `-` because I'm lazy and it doesn't require the shift key. If you want to create a sub bullet under the previous bullet you will need to indent with spaces. Typically it is `2` spaces.  

- bullet
- bullet
- bullet
  - sub bullet
  - sub bullet
    - sub sub bullet
    - sub sub bullet

```
- bullet
- bullet
- bullet
  - sub bullet
  - sub bullet
    - sub sub bullet
    - sub sub bullet
```


> Bullets get weird in most engines after 3 sub bullets.

### Numbered list

As it turns out, markdown doesn't care what the number is so you might run into places where someone is taking advantage of this and just creating a list that always has the number `1.` in it.  

1. thing
1. second thing
1. third thing

```
1. thing
1. second thing
1. third thing
```


### Horizontal Rule

```
---
```

---


### Links

Use square brackets and put what text you want to be displayed on the content
page, and then in the normal brackets you put the website url that it should
link to.

1. online link - [elastic](https://elastic.co)

`[elastic.co](https://elastic.co)`  

2. local link - [front door to this repo](../README.md)

`[front door to this repo](../README.md)`  

The above example can just be a copy paste of the url while editing the test
markdown.

This is usually most helpful by allowing you to link to other parts of your
code or documentation.  

### Code Blocks

Now, for code highlighting and blocks.

1. Code highlighting:

To call out attention to specific notes or code you can highlight items. To do
this wrap the text with the backtick character (above the TAB key).

`Hightlighed things`

```
`Highlighted things`
```

2. Code Blocks

```
This is a code block
Lots of stuff
format specific
```

```
    ```
    This is a code block
    Lots of stuff
    format specific
    ```
```

3. Syntax Highlighting

You can take code blocks to the next level by adding an extention type to the
lead block and it will highlight the text based on the language you define. A
common examples would be ` ```.sh` for Bash scripts, or ` ```.yml` for YAML config files.

```.yml
- name: Create RockNSM data directory
  file:
    path: "{{ rock_data_dir }}"
    mode: 0755
    owner: "{{ rock_data_user }}"
    group: "{{ rock_data_group }}"
    state: directory
```

> This is also engine specific though so some might not add the special code highlighting and will just ignore the extension.

### Tables

You can also create tables in markdown.

Start it with a Pipe `|` The space is not required but I think it's easier
to read with it. Followed by the first column title, Pipe, and repeat for
as many columns as you need ending with a `pipe` The second row
requires it to start with a pipe and each column needs a minimum of 3 dashes
`-`. Finally the row of text you start with a `pipe` as well add all the data/text you want in that cell of the table. Then end it with a `Pipe` and add data to the
next cell as well.

Example:
```
|Column 1|Column 2| Column 3 | Column 4 |
| --- | --- | --- | --- |
| Data1| Data2| Data3| Data4 |
| Data5 | Data6 | Data7 | Data8 |
```

### Commenting Things Out

```
<!-- This entire section of text is commented out and will be invisible until uncommented. -->
```

<!-- This entire section of text is commented out and will be invisible until uncommented. -->


## Usage

This is a really cool story Bro, but how do I use it? How do I  apply this to notes for a class? Well there is no right way, but here is _my_ way of writing all my class notes, notes for myself when I am trying something new, or working with an open source project.

I start out each of major sections with a header. If there are multiple steps
that are related to it I use sub headers to further organize or break out the
different subjects. Next I make heavy use of normal text, code blocks and
highlighting.

My rule of thumb is if its information for myself to read I write in normal text
if it is code or a command I need to run I highlight it. If it is a file
I need to modify I do a code block.

Example
```
   # Installing Nginx

   ### Initial Install
   To install nginx we need a yum repo setup. If it isn't setup refer to the
   [yum repo documentation](http://this.doesnt.exist).

   ### Configure NGINX
  After nginx is installed we need to setup our website and the reverse proxy by
  editing the main config file:  
  `sudo vi /etc/nginx/nginx.conf`

      ```
      server {
        listen 80;
        default_;
      ```
```
