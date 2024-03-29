" Vim syntax file
" Language:     F#
" Last Change:  Sun 19 Oct 2014 11:11:44 PM CEST
" Maintainer:   Gregor Uhlenheuer <kongo2002@googlemail.com>
"
" Note:         This syntax file is a complete rewrite of the original version
"               of fs.vim from Choy Rim <choy.rim@gmail.com> and a slight
"               modified version from Thomas Schank <ThomasSchank@gmail.com>

if version < 600
    syntax clear
elseif exists('b:current_syntax')
    finish
endif

" F# is case sensitive.
syn case match

" reset 'iskeyword' setting
setl isk&vim

" Scripting/preprocessor directives
syn match    fsharpSScript "^\s*#\S\+" transparent contains=fsharpScript,fsharpRegion,fsharpPreCondit

syn match    fsharpScript contained "#"
syn keyword  fsharpScript contained quitlabels warnings directory cd load use
syn keyword  fsharpScript contained install_printer remove_printer requirethread
syn keyword  fsharpScript contained trace untrace untrace_all print_depth
syn keyword  fsharpScript contained print_length define undef if elif else endif
syn keyword  fsharpScript contained line error warning light nowarn
syn match    fsharpFunction "\v[A-Za-z0-9_]"
syn match    fsharpIdent "\v((\w|\) *) +(\( *)?)@<=[A-Za-z0-9_]+"
syn match    fsharpIdent "\v(\( *)@<=[a-z][A-Za-z0-9_]+ *(:)@="
syn match    fsharpIdent "\v(\) *)@<=[a-z][A-Za-z0-9_]+"
syn match    Constant "\v((:) *)@<=[A-Za-z0-9_]+"
syn match    Constant "\v[A-Za-z0-9_]+ *(\.)@="
syn match    Constant "\v[A-Za-z0-9_]+ *(\.)@="
syn match    Constant "\v((new +)\(?)@<=[A-Za-z0-9_]+"

" comments
syn match    fsharpSingleLineComment "//.*$" contains=fsharpTodo,@Spell
syn region   fsharpDocComment start="///" end="$" contains=fsharpTodo,fsharpXml,@Spell keepend oneline
syn region   fsharpXml matchgroup=fsharpXmlDoc start="<[^>]\+>" end="</[^>]\+>" contained contains=fsharpXml

" Double-backtick identifiers
syn region   fsharpDoubleBacktick start="``" end="``" keepend oneline


" symbol names
syn match fsharpSymbol "\%(let\|use\|mutable\|rec\|and\|private\)\@<=!\=\s\+\zs\w\+\ze\s*[^=:]*[=:]"
syn match fsharpSymbol "\%(member\)\@<=\s\+\w\+\.\zs\w\+"


" comments
syn region   fsharpMultiLineComment start="(\*" end="\*)" contains=fsharpTodo
syn keyword  fsharpTodo contained TODO FIXME XXX NOTE

" keywords
syn keyword Conditional      if elif try finally else match with then
syn keyword Repeat           for while
syn keyword fsharpKeyword    abstract as assert base begin class default delegate
syn keyword fsharpKeyword    do done downcast downto end exception
syn keyword fsharpKeyword    extern fun function global in inherit inline
syn keyword fsharpKeyword    interface lazy let member mutable
syn keyword fsharpKeyword    namespace new of override rec static struct
syn keyword fsharpKeyword    to type upcast use val void when

" Feliz keywords
syn keyword fsharpKeyword Html
syn keyword fsharpKeyword a abbr address anchor animate animateMotion animateTransform area article aside
syn keyword fsharpKeyword audio b base bdi bdo blockquote body br button canvas caption cite code col
syn keyword fsharpKeyword colgroup data datalist dd del details dfn dialog div dl dt em embed fieldSet
syn keyword fsharpKeyword figcaption figure footer form h1 h2 h3 h4 h5 h6 head header hr html i iframe
syn keyword fsharpKeyword image img input ins kbd label legend li link listItem map mark meta
syn keyword fsharpKeyword metadata meter nav noscript object ol optgroup option orderedList output p
syn keyword fsharpKeyword paragraph param picture pre progress q rb rp rt rtc ruby s samp script section
syn keyword fsharpKeyword select small source span strong style sub summary sup table tableBody tableCell
syn keyword fsharpKeyword tableHeader tableRow tbody td template text textarea textf tfoot th thead time
syn keyword fsharpKeyword title tr track u ul unorderedList var video wbr

syn keyword fsharpKeyword    async atomic break checked component const constraint
syn keyword fsharpKeyword    constructor continue decimal eager event external
syn keyword fsharpKeyword    fixed functor include method mixin object parallel
syn keyword fsharpKeyword    process pure return seq tailcall trait

" additional operator keywords (Microsoft.FSharp.Core.Operators)
syn keyword fsharpKeyword    sizeof typeof typedefof unbox ref fst snd
syn keyword fsharpKeyword    stdin stdout stderr

" math operators (Microsoft.FSharp.Core.Operators)
syn keyword fsharpKeyword    abs acos asin atan atan2 ceil cos cosh exp floor log
syn keyword fsharpKeyword    log10 pown round sign sin sinh sqrt tan tanh

syn keyword fsharpOCaml      asr land lor lsl lsr lxor mod sig

if !exists('g:fsharp_no_linq') || g:fsharp_no_linq == 0
    syn keyword fsharpLinq   orderBy select where yield
endif

" open
syn keyword fsharpOpen       open module

" exceptions
syn keyword fsharpException  failwith failwithf invalid_arg raise
syn keyword fsharpException  rethrow

" modifiers
syn keyword fsharpModifier   abstract const extern internal override private
syn keyword fsharpModifier   protected public readonly sealed static virtual
syn keyword fsharpModifier   volatile

" constants
syn keyword fsharpConstant   null
syn keyword fsharpBoolean    false true

" types
syn keyword  fsharpType      array bool byte char decimal double enum exn float
syn keyword  fsharpType      float32 int int16 int32 int64 lazy_t list nativeint
syn keyword  fsharpType      obj option sbyte single string uint uint32 uint64
syn keyword  fsharpType      uint16 unativeint unit
syn match fsharpType         "\v(type +)@<=[A-Za-z0-9_]+"

" core classes
syn match    fsharpCore      "\u\a*\." transparent contains=fsharpCoreClass

syn keyword  fsharpCoreClass Array Async Directory File List Option Path Map Set contained
syn keyword  fsharpCoreClass String Seq Tuple contained

" options
syn keyword  fsharpOption    Some None Ok Error

" operators
syn keyword fsharpOperator   not and or

syn match   fsharpFormat     display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bscdiuxXoEefFgGMOAat]\|\[\^\=.[^]]*\]\)" contained

" interpolation
syn region   fsharpInterpolation matchgroup=fsharpInterpolationBrace start="\v\{" end="\v\}" contains=ALLBUT,fsharpArrErr,fsharpScript

syn match    fsharpGeneric      "\v'[A-Za-z0-9_]+(')@!"
syn match    fsharpCharacter    "'\\\d\d\d'\|'\\[\'ntbr]'\|'.'"
syn match    fsharpCharErr      "'\\\d\d'\|'\\\d'"
syn match    fsharpCharErr      "'\\[^\'ntbr]'"
syn region   fsharpString       start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=fsharpFormat
syn region   fsharpString       start=+"""+ skip=+\\\\\|\\"+ end=+"""+ contains=fsharpFormat
syn region   fsharpString       start=+@"+ skip=+""+ end=+"+ contains=fsharpFormat
syn region   fsharpString       start=+$"+ end=+"+ contains=fsharpFormat,fsharpInterpolation,@Spell

syn match    fsharpFunDef       "->"
syn match    fsharpRefAssign    ":="
syn match    fsharpTopStop      ";;"
syn match    fsharpOperator     "\^"
syn match    fsharpOperator     "::"

syn match    fsharpOperator     "&&"
syn match    fsharpOperator     "<"
syn match    fsharpOperator     ">"
syn match    fsharpOperator     "|>"
syn match    fsharpOperator     ":>"
syn match    fsharpOperator     ":?>"
syn match    fsharpOperator     ":?"
syn match    fsharpOperator     ":"
syn match    fsharpOperator     "&&&"
syn match    fsharpOperator     "|||"
syn match    fsharpOperator     "\.\."

syn match    fsharpKeyChar      "|[^\]]"me=e-1
syn match    fsharpKeyChar      ";"
syn match    fsharpKeyChar      "\~"
syn match    fsharpKeyChar      "?"
syn match    fsharpKeyChar      "\*"
syn match    fsharpKeyChar      "+"
syn match    fsharpKeyChar      "="
syn match    fsharpKeyChar      "|"
syn match    fsharpKeyChar      "(\*)"

syn match    fsharpOperator     "<-"

syn match    fsharpNumber        "\<\d\+"
syn match    fsharpNumber        "\<-\=\d\(_\|\d\)*\(u\|u\?[yslLn]\|UL\)\?\>"
syn match    fsharpNumber        "\<-\=0[x|X]\(\x\|_\)\+\(u\|u\?[yslLn]\|UL\)\?\>"
syn match    fsharpNumber        "\<-\=0[o|O]\(\o\|_\)\+\(u\|u\?[yslLn]\|UL\)\?\>"
syn match    fsharpNumber        "\<-\=0[b|B]\([01]\|_\)\+\(u\|u\?[yslLn]\|UL\)\?\>"
syn match    fsharpFloat         "\<-\=\d\(_\|\d\)*\.\(_\|\d\)*\([eE][-+]\=\d\(_\|\d\)*\)\=\>"
syn match    fsharpFloat         "\<-\=\d\(_\|\d\)*\.\(_\|\d\)*\([eE][-+]\=\d\(_\|\d\)*\)\=\>"
syn match    fsharpFloat         "\<\d\+\.\d*"

" attributes
syn region   fsharpAttrib matchgroup=fsharpAttribute start="\[<" end=">]"

" regions
syn region   fsharpRegion matchgroup=fsharpPreCondit start="\%(end\)\@<!region.*$"
            \ end="endregion" fold contains=ALL contained

if version >= 508 || !exists("did_fs_syntax_inits")
    if version < 508
        let did_fs_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink fsharpSingleLineComment Comment
    HiLink fsharpMultiLineComment  Comment
    HiLink fsharpDocComment        Comment
    HiLink fsharpXml               Comment
    HiLink fsharpDoubleBacktick    String

    HiLink fsharpOpen              Include
    HiLink fsharpModPath           Include
    HiLink fsharpScript            Include
    HiLink fsharpPreCondit         Include

    HiLink fsharpKeyword           Keyword

    HiLink fsharpOCaml             Statement
    HiLink fsharpLinq              Statement

    HiLink fsharpSymbol            Function

    HiLink fsharpFunDef            Operator
    HiLink fsharpRefAssign         Operator
    HiLink fsharpTopStop           Operator
    HiLink fsharpKeyChar           Operator
    HiLink fsharpOperator          Operator

    HiLink fsharpBoolean           Boolean
    HiLink fsharpConstant          Constant
    HiLink fsharpCharacter         Character
    HiLink fsharpNumber            Number
    HiLink fsharpFloat             Float

    HiLink fsharpString            String
    HiLink fsharpFormat            Special

    HiLink fsharpModifier          StorageClass

    HiLink fsharpException         Error

    HiLink fsharpOption            Type
    HiLink fsharpModule            Identifier

    HiLink fsharpType              Type

    HiLink fsharpCoreClass         Typedef
    HiLink fsharpAttrib            Typedef
    HiLink fsharpXmlDoc            Typedef

    HiLink fsharpTodo              Todo

    HiLink fsharpEncl              Delimiter
    HiLink fsharpAttribute         Delimiter
    HiLink fsharpFunction          Function
    HiLink fsharpIdent             Identifier
    HiLink fsharpGeneric           Type

    delcommand HiLink
endif

let b:current_syntax = 'fsharp'

" vim: sw=4 et sts=4

