Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6ymh-0003wP-CE
 for ath10k@lists.infradead.org; Mon, 01 Oct 2018 14:02:54 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Add debugfs support to get power save state
 change of STA
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1537252467-17353-1-git-send-email-mkenna@codeaurora.org>
References: <1537252467-17353-1-git-send-email-mkenna@codeaurora.org>
Message-Id: <20181001140239.E15456079B@smtp.codeaurora.org>
Date: Mon,  1 Oct 2018 14:02:39 +0000 (UTC)
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
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Maharaja Kennadyrajan <mkenna@codeaurora.org> wrote:

> This patch helps to get the power save state change of each peer
> connected to the AP. With WMI_10_4_PEER_STA_PS_STATECHG_EVENTID
> event, ps state of each peer is reported to user space via
> debugfs.
> 
> Use the below command to get the ps state of each sta:
> cat /sys/kernel/debug/ieee80211/phyX/netdev::wlanX/stations/
> XX:XX:XX:XX:XX:XX/peer_ps_state
> 
> If STA is in power save state, we get the peer_ps_state value as 1.
> if STA is not in power save state, we get the peer_ps_state value as 0.
> If ps_state event is disabled, we get the peer_ps_state value as 2.
> 
> We can enable/disable the ps_state events using the debugfs flag
> "ps_state_enable"
> 
> echo Y > /sys/kernel/debug/ieee80211/phyX/ath10k/ps_state_enable
> 
> Y = 1 to enable and Y = 0 to disable
> 
> Tested in QCA4019 with firmware ver 10.4-3.2.1.1-00011
> 
> Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

d70c0d463f9d ath10k: add debugfs support to get power save state change of STA

-- 
https://patchwork.kernel.org/patch/10603779/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
