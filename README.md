# <img src="/Docs/Logo/debug.png" alt="Logo" width="48" align="left"/>  Debug

[![Powershellgallery Badge][psgallery-badge]][psgallery-status]

A collection of debugging tools for helping to develop modern PowerShell applications.

For example: objects color highlighting, various code metrics and performance benchmarks.

![example 06](/Docs/Screenshots/006.png)

## Install
```powershell
PS> Install-Module Debug
```

The Module is using:
- [ColoredText](https://github.com/n8tb1t/ColoredText) - for highlighting.
- [Parser](https://github.com/n8tb1t/Parser) for the syntax analysis.

Projects using `Debug`:
- [SystemCleaner](https://github.com/n8tb1t/SystemCleaner).

## Features:

- Highlights `Format-List`.
- Highlights `Format-Table`.
- Highlights `Format-Custom`.
- Highlights `Get-Member`.
- Fully adjustable.
- Tab completion in ISE and Console.
- Lots of syntactic sugar.
- Numerous helper classes for code<br>
  analysis and debugging porpuses **IN DEVELOPMENT**

## Disclaimer:

In order to get the most out of color highlighted modules, and enjoy their full potential,<br>
it is highly recommended to use the [ConEmu console](https://conemu.github.io/) with the [Oceans16 theme](https://github.com/joonro/ConEmu-Color-Themes)!<br>
Also, check out the other numerous themes over there, maybe you'll find one you like even better!

## `Debug-Object`

The `debug` function wraps around the `PowerShell` formatting `Cmdlets`<br>
and highlights their output with multiple colors.

It prints, objects, collections, hashtables and any other<br>
data structures in the nice, human-readable form!

`Debug-Object` or just `debug`:

| Argument    | Default   | Description |
| ---------   | -------   | ----------- |
`-Object`     | Mandatory | Object to Highlight.
`-View`       |`List`     | Output format `List`, `Members`, `Method`, `Property`, `Tree`, `Table`.
`-Depth`      |`1`        | The depth of the `Tree View`.
`-TableStyle` |`Rows`     | `Table View` output style `Rows`, `Columns`

## Autocompletion

This could be helpful while working in the console, to autocomplete the available local variables.

![example 01](/Docs/Screenshots/001.png)

## Table View

The Table View is fully functional, though still in development and change-prone with a high probability!

Right now, it does not mimic the exact output of the `Format-Table` `Cmdlet`, rather than using some inner technique to prepare the object for highlighting.

```PowerShell
debug $hashTable Table

debug (Get-Process) Table
debug (Get-Process) -View Table

Get-Process | debug -View Table

Get-Module | debug -View Table -TableStyle Rows

debug (Get-InstalledModule) Table -TableStyle Columns
```

![example 07](/Docs/Screenshots/007.png)

![example 08](/Docs/Screenshots/008.png)

## List View

```PowerShell
Get-Date | debug

$host | debug
$host | debug -View List

debug $host
debug $host List
```
![example 02](/Docs/Screenshots/002.png)

![example 03](/Docs/Screenshots/003.png)

## Tree View

```PowerShell
debug $host 1

debug $host Tree

$host | debug -View Tree
$host | debug -Depth 2
```

![example 04](/Docs/Screenshots/004.png)

## Object Members (Methods And Properties) View

```PowerShell
debug $host Members
debug $host -View Members
$host | debug -View Members

debug $host Method
debug $host -View Method
$host | debug -View Method

debug $host Property
debug $host -View Property
$host | debug -View Property
```

![example 05](/Docs/Screenshots/005.png)

[psgallery-badge]: https://img.shields.io/badge/PowerShell_Gallery-1.0.5-green.svg
[psgallery-status]: https://www.powershellgallery.com/packages/Debug/1.0.5
