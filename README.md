# Non-Standard UO Packets Repository

This repository is dedicated to documenting custom non-standard packets used by ClassicUO (web/desktop) and other external tools used to communicate with shards (e.g. the Freeshard protocol)
Also provded are example/reference implementations for consuming the packets for various UO emulators.

The packet structures are described in YAML form using Kaitai Struct, a declarative language used for describing various binary data structures.

## Packets

For each packet, you can access its Kaitai Struct definition (`.ksy` file) and a sample packet dump (`.dump` file under the `samples` directory).

1. [WebIdentity Packet](./WebIdentity.ksy) ([dump](./samples/WebIdentity.dump))
     <img align="right" src="https://github.com/ClassicUO/packets/assets/1094679/0e2a030c-1041-4286-95c4-da03b24ebcfc">
    - Used by Shards on the [Web Client](https://play.classicuo.org) for information about the user connecting via ClassicUO Web.
    - Contains a `Secret` known only by ClassicUO Web's Game Proxy and the Shard, which used to verify the packet is authentic. The client itself never sees the `Secret`.
    - The packet is sent as the `0xA4` SystemInfo packet. We chose to override the `0xA4` packet for the following reasons:
      - It's an unused packet, only sent by the OSI client, never by CUO itself. The packet handlers for ServUO/RunUO/MUO all read it, but ignore it.
      - All emulators (except Sphere) support receiving the packet before any Account/GameServer login making it a good candidate to add workarounds IP account limiters.
      - It's large enough for our use, and requires no Core modifications to enable receiving.  

## Packet Handler Implementations

This repository also includes implementations for handling the packets in various UO emulators. Please check the `implementations` directory.
If your emulator does not have any implementation you may need to implement it yourself. If you do please open a pull request and we will add it to the repository.

## Sample Packet Dumps

In the `samples` directory, you can find examples of raw packet dumps. These can be used in conjunction with the Kaitai Struct descriptions to test and experiment with the data structures.

To use a sample packet dump:

1. Download the sample you want to examine from the `samples` directory.
2. Open the [Kaitai Web IDE](https://ide.kaitai.io/).
3. In the Kaitai Web IDE, click on "Upload File" at the bottom left of the screen and select the `.ksy` packet and corresponding sample `.dump` (or drag and drop the files).
4. On the left hand file explorer double click the `.ksy` and `.dump` files.
5. The IDE should parse the binary data according to the structure defined in the `.ksy` file on the top left and display the parsed data below, with the hex data on the right.

## Contribution

Your contributions are always welcome! Please read the [contribution guidelines](./CONTRIBUTING.md) before submitting new packet structures or emulator implementations.

## License

Please see the [`LICENSE`](./LICENSE.md) file for details on the license.

---

For any questions or discussions, please open an issue on GitHub or reach us on the [CUO Discord](https://discord.gg/VdyCpjQ)
