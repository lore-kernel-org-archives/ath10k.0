Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSvuS-0004DO-Fx
 for ath10k@lists.infradead.org; Mon, 27 Apr 2020 05:02:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: add statistics of tx retries and tx failed when tx
 complete disable
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200423024134.10601-1-wgong@codeaurora.org>
References: <20200423024134.10601-1-wgong@codeaurora.org>
Message-Id: <20200427050223.078CBC433F2@smtp.codeaurora.org>
Date: Mon, 27 Apr 2020 05:02:23 +0000 (UTC)
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> wrote:

> When tx complete is disabled, all tx status will be set with status
> HTT_TX_COMPL_STATE_ACK and indicate to mac80211 by ieee80211_tx_status,
> then it does not have the statistics for retries and failed packets.
> count of tx retries and tx failed of command "iw wlan0 station dump"
> are both 0. If tx complete is not disabled, then firmware report the
> tx status and ath10k indicate the status to mac80211, then mac80211
> save the statistics and command "iw wlan0 station dump" show them.
> 
> for example:
> localhost ~ # iw dev wlan0 station dump
> Station 3c:28:6d:96:fd:69 (on wlan0)
> 	inactive time:	5 ms
> 	rx bytes:	1325012
> 	rx packets:	6477
> 	tx bytes:	85264
> 	tx packets:	518
> 	tx retries:	0
> 	tx failed:	0
> 
> This patch only effect chips with tx complete disabled, e.g. SDIO.
> 
> with this patch, output of command "iw dev wlan0 station dump":
> Station c4:04:15:5d:97:22 (on wlan0)
>         inactive time:  608 ms
>         rx bytes:       180366
>         rx packets:     991
>         tx bytes:       98765577
>         tx packets:     64624
>         tx retries:     14682
>         tx failed:      47086
> 
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00042.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

59a022cc14cf ath10k: add statistics of tx retries and tx failed when tx complete disable

-- 
https://patchwork.kernel.org/patch/11504903/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
