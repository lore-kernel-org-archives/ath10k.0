Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLglq-000228-IT
 for ath10k@lists.infradead.org; Tue, 07 Apr 2020 05:27:36 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath10k: add ppdu stats support for QCA6174/QCA9377
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <0101016e82883b59-e52fb973-84a7-4c15-a236-c7a01390087b-000000@us-west-2.amazonses.com>
References: <0101016e82883b59-e52fb973-84a7-4c15-a236-c7a01390087b-000000@us-west-2.amazonses.com>
Message-Id: <20200407052718.6F4CAC433D2@smtp.codeaurora.org>
Date: Tue,  7 Apr 2020 05:27:18 +0000 (UTC)
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
To: Yu Wang <yyuwang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Yu Wang <yyuwang@codeaurora.org> wrote:

> When QCA6174/QCA9377 working in station mode, after connected
> to AP, tx bitrate is always '1.0 MBit/s' in output of command
> 'iw wlan0 link'.
> 
> That's because the parameters to calculate the tx bitrate are
> not well updated for QCA6174/QCA9377.
> 
> To fix this issue:
> 1. Add processing for HTT_T2H_MSG_TYPE_PPDU_STATS_IND which includes
>    the peer tx stats;
> 2. Map WMI_TLV_SERVICE_PEER_STATS_INFO to WMI_SERVICE_PEER_STATS to
>    enable the feature.
> 
> Tested with QCA6174 PCIe with firmware WLAN.RM.4.4.1.c3-00031.
> Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029.
> 
> Signed-off-by: Yu Wang <yyuwang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

This has new warnings:

drivers/net/wireless/ath/ath10k/htt_rx.c: In function 'ath10k_htt_process_ppdu_stats':
drivers/net/wireless/ath/ath10k/htt_rx.c:3746:21: warning: variable 'arsta' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/ath/ath10k/htt_rx.c:3751:18: warning: incorrect type in assignment (different base types)
drivers/net/wireless/ath/ath10k/htt_rx.c:3751:18:    expected unsigned char [usertype] num_ppdu
drivers/net/wireless/ath/ath10k/htt_rx.c:3751:18:    got restricted __le32 [usertype] num_ppdu

-- 
https://patchwork.kernel.org/patch/11250999/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
