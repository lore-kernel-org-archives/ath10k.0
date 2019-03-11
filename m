Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ElX-0004IT-0x
 for ath10k@lists.infradead.org; Mon, 11 Mar 2019 06:50:28 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCHv4 0/9] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Mon, 11 Mar 2019 12:18:12 +0530
Message-Id: <1552286901-28285-1-git-send-email-tamizhr@codeaurora.org>
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
To: johannes@sipsolutions.net, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Tamizh chelvam <tamizhr@codeaurora.org>


Add infrastructure to support per TID configurations like noack policy,
retry count, AMPDU control(disable/enable), RTSCTS control(enable/disable)
and TX rate mask configurations.
This will be useful for the driver which can supports data TID
specific configuration rather than phy level configurations.
Here NL80211_CMD_SET_TID_CONFIG added to support this operation by
accepting TID configuration.
This command can accept STA mac addreess to make the configuration
station specific rather than applying to all the connected stations
to the netdev.
And this nested command configuration can accept multiple number of
data TID specific configuration in a single command,
enum ieee80211_tid_conf_mask used to notify the driver that which
configuration got modified for the TID.

Tamizh chelvam (9):
  nl80211: New netlink command for TID specific configuration
  nl80211: Add new netlink attribute for TID speicific retry count
  nl80211: Add netlink attribute for AMPDU aggregation enable/disable
  nl80211: Add netlink attribute to enable/disable RTS_CTS
  nl80211: Add netlink attribute to configure TID specific tx rate
  mac80211: Add api to support configuring TID specific configuration
  ath10k: Add wmi command support for station specific TID config
  ath10k: Add new api to support TID specific configuration
  ath10k: Add extended TID configuration support

v4:
  * Fixed kbuild warnings.

v3:
  * Modified "nl80211: Add netlink attribute to configure TID specific tx rate" patch
    to accept multiple TX rate configuration at a time.
  * Modified noack and ampdu variable data type to int in
    "mac80211: Add api to support configuring TID specific configuration" patch to store
    default configuration.
  * Modified "ath10k: Add new api to support TID specific configuration" patch to handle
    default values for noack and ampdu. And added sta pointer sanity check in
    ath10k_mac_tid_bitrate_config function.
  * Fixed "ath10k: Add extended TID configuration support" wmi command parameters
    assigned part.

v2:
  * Added support to accept multiple TID configuration
  * Added support to configure TX rate and RTSCTS control

 drivers/net/wireless/ath/ath10k/core.c    |    4 +
 drivers/net/wireless/ath/ath10k/core.h    |    6 +
 drivers/net/wireless/ath/ath10k/mac.c     |  679 +++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath10k/wmi-ops.h |   19 +
 drivers/net/wireless/ath/ath10k/wmi.c     |   35 ++
 drivers/net/wireless/ath/ath10k/wmi.h     |   72 +++
 include/net/cfg80211.h                    |   57 +++
 include/net/mac80211.h                    |   38 ++
 include/uapi/linux/nl80211.h              |  182 ++++++++
 net/mac80211/cfg.c                        |   28 ++
 net/mac80211/driver-ops.h                 |   15 +
 net/wireless/nl80211.c                    |  253 ++++++++++-
 net/wireless/rdev-ops.h                   |   11 +
 net/wireless/trace.h                      |   18 +
 14 files changed, 1319 insertions(+), 98 deletions(-)

-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
