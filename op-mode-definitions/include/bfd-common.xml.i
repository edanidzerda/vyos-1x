<!-- included start from bfd-common.xml.i -->
<node name="bfd">
  <properties>
    <help>Show Bidirectional Forwarding Detection (BFD)</help>
  </properties>
  <children>
    <node name="peer">
      <properties>
        <help>Show all Bidirectional Forwarding Detection (BFD) peer status</help>
      </properties>
      <command>vtysh -c "show bfd peers"</command>
      <children>
        <leafNode name="counters">
          <properties>
            <help>Show Bidirectional Forwarding Detection (BFD) peer counters</help>
          </properties>
          <command>vtysh -c "show bfd peers counters"</command>
        </leafNode>
      </children>
    </node>
    <tagNode name="peer">
      <properties>
        <help>Show Bidirectional Forwarding Detection (BFD) peer status</help>
        <completionHelp>
          <script>vtysh -c "show bfd peers" | awk '/[:blank:]*peer/ { printf "%s\n", $2 }'</script>
        </completionHelp>
      </properties>
      <command>vtysh -c "show bfd peers" | awk -v BFD_PEER=$5 'BEGIN { regex = sprintf("(peer %s.*)vrf", BFD_PEER) } { if (match($0, regex, bfd_peer_value)) peer=bfd_peer_value[1] } END { if (peer) system("vtysh -c \"show bfd " peer "\"") }'</command>
      <children>
        <leafNode name="counters">
          <properties>
            <help>Show Bidirectional Forwarding Detection (BFD) peer counters</help>
          </properties>
          <command>vtysh -c "show bfd peers" | awk -v BFD_PEER=$5 'BEGIN { regex = sprintf("(peer %s.*)vrf", BFD_PEER) } { if (match($0, regex, bfd_peer_value)) peer=bfd_peer_value[1] } END { if (peer) system("vtysh -c \"show bfd " peer " counters\"") }'</command>
        </leafNode>
      </children>
    </tagNode>
    <node name="peers">
      <properties>
        <help>Show Bidirectional Forwarding Detection peers</help>
      </properties>
      <command>vtysh -c "show bfd peers"</command>
      <children>
        <leafNode name="brief">
          <properties>
            <help>Show Bidirectional Forwarding Detection (BFD) peers brief</help>
          </properties>
          <command>vtysh -c "show bfd peers brief"</command>
        </leafNode>
      </children>
    </node>
  </children>
</node>
<!-- included end -->
