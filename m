Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1coRFY-0000iE-65
 for ath10k@lists.infradead.org; Thu, 16 Mar 2017 08:59:13 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix fetching channel during potential radar detection
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1488976412-8970-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1488976412-8970-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <3a929a219a774ce9b092a9167b4a9f4b@euamsexm01a.eu.qualcomm.com>
Date: Thu, 16 Mar 2017 09:58:42 +0100
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> wrote:
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
> 
> Fetch target operating channel during potential radar detection when
> the interface is just brought up, but no channel is assigned from
> userspace. In this scenario rx_channel may not be having a valid pointer
> hence fetch the target operating channel to avoid warnings as below
> which can be triggered by the commands with DFS testing over longer run
> 
> comamnds:
> iw wlan1 set type mesh
> ifconfig wlan1 up (valid tgt_oper_chan only)
> iw wlan1 cac trigger freq 5260 HT20 (valid rx_channel, tgt_oper_chan)
> iw wlan1 cac trigger freq 5280 HT20
> iw wlan1 cac trigger freq 5300 HT20
> 
> Once the CAC expires, current channel context will be removed and
> we are only left with the fallback option of using 'target operating
> channel'
> 
> Firmware and driver log:
> ath: phy1: DFS: radar found on freq=5300: id=1, pri=1125, count=5,
> count_false=4
> ath: phy1: DFS: radar found on freq=5260: id=5, pri=3151, count=6,
> count_false=11
> ath: phy1: DFS: radar found on freq=5280: id=1, pri=1351, count=6,
> count_false=4
> ath: phy1: DFS: radar found on freq=5300: id=1, pri=1125, count=5,
> count_false=4
> ath10k_pci 0001:01:00.0: failed to derive channel for radar pulse,
> treating as radar
> ath10k_pci 0001:01:00.0: failed to derive channel for radar pulse,
> treating as radar
> 
> Call trace:
> 
> WARNING: CPU: 1 PID: 2145 at
> backports-20161201-3.14.77-9ab3068/net/wireless/chan.c:265
> cfg80211_set_dfs_state+0x3c/0x88 [cfg80211]()
> 
>  Workqueue: phy1 ieee80211_dfs_radar_detected_work
> [mac80211]
> [<c0320770>] (warn_slowpath_null) from [<bf79b90c>]
> (cfg80211_set_dfs_state+0x3c/0x88 [cfg80211])
> [<bf79b90c>] (cfg80211_set_dfs_state [cfg80211]) from
> [<bf79697c>] (cfg80211_radar_event+0xc4/0x140 [cfg80211])
> [<bf79697c>] (cfg80211_radar_event [cfg80211]) from
> [<bf83c058>] (ieee80211_dfs_radar_detected_work+0xa8/0xb4 [mac80211])
> [<bf83c058>] (ieee80211_dfs_radar_detected_work
> [mac80211]) from [<c0339518>] (process_one_work+0x298/0x4a4)
> 
> Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

a28f6f27a88f ath10k: fix fetching channel during potential radar detection

-- 
https://patchwork.kernel.org/patch/9610979/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
