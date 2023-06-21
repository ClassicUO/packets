# ClassicUO Desktop and Web Non-Standard UO Packets Repository

This repository is dedicated to documenting the non-standard Ultima Online (UO) packet structures used by ClassicUO Desktop and Web clients, and providing implementations for various UO emulators.

The packet structures are described in YAML form using Kaitai Struct, a declarative language used for describing various binary data structures.

## Custom Kaitai Struct Packets

Below is a list of custom packets used by ClassicUO Desktop and Web clients. For each packet, you can access its Kaitai Struct description (`.ksy` file) and a sample packet dump (`.dump` file).

1. [WebIdentity Packet](./WebIdentity.ksy) ([dump](./samples/WebIdentity.dump))
    - Used by Shards on the [Web Client](https://play.classicuo.org) for information about the user connecting via ClassicUO Web.
    - Contains a `Secret` known only by ClassicUO Web's Game Proxy and the Shard, which used to verify the packet is authentic. The client itself never sees the `Secret`.
    - The packet is sent as the 0xA4 SystemInfo packet. We chose to override the 0xA4 SystemInfo packet for the following reasons:
      - It's an unused packet, only sent by the OSI client, never by CUO itself. The packet handlers for ServUO/RunUO/MUO all read it, but ignore it.
      - All emulators support receiving the packet before any Account/GameServer login making it a good candidate to workaround IPLimiter.
      - It's large enough for our use, and requires no Core modifications to enable receiving.

## Packet Handler Implementations

This repository also includes implementations for handling the packets in various UO emulators. Please check the `implementations` directory for the code examples.
If your emulator does not have any implementation you may need to implement it yourself. If you do please open a pull request and we will add it to the repository.

## Sample Packet Dumps

In the `samples` directory, you can find examples of raw packet dumps. These can be used in conjunction with the Kaitai Struct descriptions to test and experiment with the data structures.

To use a sample packet dump:

1. Download the sample you want to examine from the `samples` directory.
2. Open the [Kaitai Web IDE](https://ide.kaitai.io/).
3. In the Kaitai Web IDE, click on "File" and then "Open" (or simply drag and drop the file) to open your sample packet dump.
4. Click on "View" then "Select .ksy > Local file" to select the `.ksy` file corresponding to your sample packet dump.
5. The IDE should parse the binary data according to the structure defined in the `.ksy` file and display the parsed data.

## Contribution

Your contributions are always welcome! Please read the contribution guidelines before submitting new packet structures or emulator implementations.

## License

Please see the `LICENSE` file for details on the license.

---

For any questions or discussions, please open an issue on GitHub or reach us on the [CUO Discord](https://discord.gg/VdyCpjQ)