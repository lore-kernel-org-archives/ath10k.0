Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9pbX-0002jl-6d
 for ath10k@lists.infradead.org; Fri, 29 Mar 2019 11:23:25 +0000
From: Balaji Pothunoori <bpothuno@codeaurora.org>
Subject: [PATCH v4] iw: Add support for controlling tx power for per station
Date: Fri, 29 Mar 2019 16:53:15 +0530
Message-Id: <1553858595-21819-1-git-send-email-bpothuno@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: johannes@sipsolutions.net, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Balaji Pothunoori <bpothuno@codeaurora.org>, Ashok Raj Nagarajan <arnagara@codeaurora.org>

From: Ashok Raj Nagarajan <arnagara@codeaurora.org>

This patch allows userspace to set transmit power,
in dBm units, to a station associated to the AP.

To set a limit tx power of 20 dBm:
iw wlan0 station set <mac-addr> txpwr limit 20

To revert the user defined tx power for a station:
iw wlan0 station set <mac-addr> txpwr auto

Co-developed-by: Balaji Pothunoori <bpothuno@codeaurora.org>
Signed-off-by: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Signed-off-by: Balaji Pothunoori <bpothuno@codeaurora.org>
---
v2: modified user configured units to dBm from mBm
v3: no changes, rebased
v4: rebased and removed check for sta_txpwr
    in order to configure tx power '0'

 station.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/station.c b/station.c
index 25cbbc3..0454f87 100644
--- a/station.c
+++ b/station.c
@@ -661,6 +661,7 @@ static const struct cmd *station_set_plink;
 static const struct cmd *station_set_vlan;
 static const struct cmd *station_set_mesh_power_mode;
 static const struct cmd *station_set_airtime_weight;
+static const struct cmd *station_set_txpwr;
 
 static const struct cmd *select_station_cmd(int argc, char **argv)
 {
@@ -674,6 +675,8 @@ static const struct cmd *select_station_cmd(int argc, char **argv)
 		return station_set_mesh_power_mode;
 	if (strcmp(argv[1], "airtime_weight") == 0)
 		return station_set_airtime_weight;
+	if (strcmp(argv[1], "txpwr") == 0)
+		return station_set_txpwr;
 	return NULL;
 }
 
@@ -873,6 +876,72 @@ COMMAND_ALIAS(station, set, "<MAC address> airtime_weight <weight>",
 	"Set airtime weight for this station.",
 	select_station_cmd, station_set_airtime_weight);
 
+static int handle_station_set_txpwr(struct nl80211_state *state,
+				    struct nl_msg *msg,
+				    int argc, char **argv,
+				    enum id_input id)
+{
+	enum nl80211_tx_power_setting type;
+	unsigned char mac_addr[ETH_ALEN];
+	int sta_txpwr = 0;
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
+	NLA_PUT_U8(msg, NL80211_ATTR_STA_TX_POWER_SETTING, type);
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
+		NLA_PUT_U16(msg, NL80211_ATTR_STA_TX_POWER, sta_txpwr);
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
+COMMAND_ALIAS(station, set, "<MAC address> txpwr <auto|limit> [<tx power dBm>]",
+	NL80211_CMD_SET_STATION, 0, CIB_NETDEV, handle_station_set_txpwr,
+	"Set Tx power for this station.",
+	select_station_cmd, station_set_txpwr);
+
 static int handle_station_dump(struct nl80211_state *state,
 			       struct nl_msg *msg,
 			       int argc, char **argv,
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
