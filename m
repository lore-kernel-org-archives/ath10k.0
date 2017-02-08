Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbR1c-00055M-Az
 for ath10k@lists.infradead.org; Wed, 08 Feb 2017 12:07:06 +0000
From: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
Subject: [PATCH v3] iw: Add support for controlling tx power for per station
Date: Wed, 8 Feb 2017 17:31:17 +0530
Message-ID: <1486555277-25258-1-git-send-email-arnagara@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: johannes@sipsolutions.net
Cc: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, arnagara@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

This patch allows userspace to set transmit power, in mBm units, to a
station associated to the AP.

To set a limit tx power of 2000 mBm:
iw wlan0 station set <mac-addr> txpwr limit 2000

To revert the user defined tx power for a station:
iw wlan0 station set <mac-addr> txpwr auto

Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
---
v3:
	- rebased

 station.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/station.c b/station.c
index f3e3da8..8364593 100644
--- a/station.c
+++ b/station.c
@@ -569,6 +569,7 @@ COMMAND(station, del, "<MAC address> [subtype <subtype>] [reason-code <code>]",
 static const struct cmd *station_set_plink;
 static const struct cmd *station_set_vlan;
 static const struct cmd *station_set_mesh_power_mode;
+static const struct cmd *station_set_txpwr;
 
 static const struct cmd *select_station_cmd(int argc, char **argv)
 {
@@ -580,6 +581,8 @@ static const struct cmd *select_station_cmd(int argc, char **argv)
 		return station_set_vlan;
 	if (strcmp(argv[1], "mesh_power_mode") == 0)
 		return station_set_mesh_power_mode;
+	if (strcmp(argv[1], "txpwr") == 0)
+		return station_set_txpwr;
 	return NULL;
 }
 
@@ -731,6 +734,72 @@ COMMAND_ALIAS(station, set, "<MAC address> mesh_power_mode "
 	"Set link-specific mesh power mode for this station",
 	select_station_cmd, station_set_mesh_power_mode);
 
+static int handle_station_set_txpwr(struct nl80211_state *state,
+				    struct nl_msg *msg,
+				    int argc, char **argv,
+				    enum id_input id)
+{
+	enum nl80211_tx_power_setting type;
+	unsigned char mac_addr[ETH_ALEN];
+	unsigned int sta_txpwr = 0;
+	char *err = NULL;
+
+	if (argc != 3 && argc != 4)
+		return 1;
+
+	if (mac_addr_a2n(mac_addr, argv[0])) {
+		fprintf(stderr, "invalid mac address\n");
+		return 2;
+	}
+
+	NLA_PUT(msg, NL80211_ATTR_MAC, ETH_ALEN, mac_addr);
+	argc--;
+	argv++;
+
+	if (strcmp("txpwr", argv[0]) != 0)
+		return 1;
+	argc--;
+	argv++;
+
+	if (!strcmp(argv[0], "auto"))
+		type = NL80211_TX_POWER_AUTOMATIC;
+	else if (!strcmp(argv[0], "limit"))
+		type = NL80211_TX_POWER_LIMITED;
+	else {
+		printf("Invalid parameter: %s\n", argv[0]);
+		return 2;
+	}
+
+	NLA_PUT_U32(msg, NL80211_ATTR_STA_TX_POWER_SETTING, type);
+
+	if (type != NL80211_TX_POWER_AUTOMATIC) {
+		if (argc != 2) {
+			printf("Missing TX power level argument.\n");
+			return 2;
+		}
+
+		argc--;
+		argv++;
+
+		sta_txpwr = strtoul(argv[0], &err, 0);
+		NLA_PUT_U32(msg, NL80211_ATTR_STA_TX_POWER, sta_txpwr);
+	}
+
+	argc--;
+	argv++;
+
+	if (argc)
+		return 1;
+
+	return 0;
+ nla_put_failure:
+	return -ENOBUFS;
+}
+COMMAND_ALIAS(station, set, "<MAC address> txpwr <auto|limit> [<tx power mBm>]",
+	NL80211_CMD_SET_STATION, 0, CIB_NETDEV, handle_station_set_txpwr,
+	"Set Tx power for this station.",
+	select_station_cmd, station_set_txpwr);
+
 static int handle_station_dump(struct nl80211_state *state,
 			       struct nl_msg *msg,
 			       int argc, char **argv,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
