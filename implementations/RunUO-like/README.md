# ServUO/ModernUO Packet implementations

To install the packet handlers you will need to copy/paste the code into your `Scripts` (or equivalent) project.
We recommend you create a new folder called `ClassicUO` and paste the files into that folder.

# Emulator specific files

ServUO/ModernUO, are similar but require supplemental files depending on which one you're using, which we've organised with suffixes on the files:

## ServUO

Copy only:

```bash
.
├── Network.cs
├── Network.ServUO.cs
└── WebIdentity.cs
```


## ModernUO

Copy only:

```bash
.
├── Network.cs
├── Network.ModernUO.cs
└── WebIdentity.cs
```