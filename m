Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from caladan.dune.hu ([78.24.191.180] helo=arrakis.dune.hu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aakoV-0000KS-Rz
 for ath10k@lists.infradead.org; Tue, 01 Mar 2016 13:58:13 +0000
Subject: Re: [PATCH] ath10k: Fix mgmt tx status for 10.4.3 firmware.
References: <1456782654-24723-1-git-send-email-greearb@candelatech.com>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <56D56052.2010007@openwrt.org>
Date: Tue, 1 Mar 2016 10:26:42 +0100
MIME-Version: 1.0
In-Reply-To: <1456782654-24723-1-git-send-email-greearb@candelatech.com>
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
To: greearb@candelatech.com, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 2016-02-29 22:50, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> When testing a 10.4.3 firmware in station mode, I notice that
> when the AP is powered down, the ath10k does not notice AP is gone
> because mgt frames get tx status of 3, which is not handled.
> 
> It appears that status 3 means something similar to failed-retry.
> 
> Treating it thus lets the station disconnect properly.
> 
> Tested against a non-stock 10.4.3 firmware, but likely upstream
> firmware acts similarly in this case.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
> 
> This patch is against a heavily patched tree based on 4.4, hopefully
> it can be applied to upstream code w/out too much trouble.
> 
> Someone should verify this on stock 10.4-ish firmware before applying.
> 
>  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++-
>  drivers/net/wireless/ath/ath10k/htt_rx.c | 11 +++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index c31a31f..de663a6 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -309,7 +309,9 @@ struct htt_mgmt_tx_desc {
>  enum htt_mgmt_tx_status {
>  	HTT_MGMT_TX_STATUS_OK    = 0,
>  	HTT_MGMT_TX_STATUS_RETRY = 1,
> -	HTT_MGMT_TX_STATUS_DROP  = 2
> +	HTT_MGMT_TX_STATUS_DROP  = 2,
> +	HTT_MGMT_TX_STATUS_TXFILT = 3 /* Seems to be logically similar to
> +					 RETRY failure. */
In that case the driver should probably set IEEE80211_TX_STAT_TX_FILTERED

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
