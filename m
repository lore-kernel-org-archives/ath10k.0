Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqz6c-0003A7-1p
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 07:55:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: FAILED: patch "[PATCH] ath10k: fix DMA related firmware crashes
 on multiple devices" failed to apply to 4.2-stable tree
References: <144591193618264@kroah.com>
Date: Tue, 27 Oct 2015 09:55:04 +0200
In-Reply-To: <144591193618264@kroah.com> (gregkh@linuxfoundation.org's message
 of "Tue, 27 Oct 2015 11:12:16 +0900")
Message-ID: <87io5sycdj.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: nbd@openwrt.org

Hi,

any volunteers to port this patch to 4.2? Should be simple to do but
important.

Kalle

<gregkh@linuxfoundation.org> writes:

> The patch below does not apply to the 4.2-stable tree.
> If someone wants it applied there, or to any other stable or longterm
> tree, then please email the backport, including the original git commit
> id to <stable@vger.kernel.org>.
>
> thanks,
>
> greg k-h
>
> ------------------ original commit in Linus's tree ------------------
>
> From 76d164f582150fd0259ec0fcbc485470bcd8033e Mon Sep 17 00:00:00 2001
> From: Felix Fietkau <nbd@openwrt.org>
> Date: Thu, 17 Sep 2015 14:29:07 +0300
> Subject: [PATCH] ath10k: fix DMA related firmware crashes on multiple devices
>
> Some platforms really don't like DMA bursts of 256 bytes, and this
> causes the firmware to crash when sending beacons.
> Also, changing this based on the firmware version does not seem to make
> much sense, so use 128 bytes for all versions.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Felix Fietkau <nbd@openwrt.org>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 23afcda2de96..678d72af4a9d 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -337,7 +337,7 @@ enum ath10k_hw_rate_cck {
>  #define TARGET_10X_MAX_FRAG_ENTRIES		0
>  
>  /* 10.2 parameters */
> -#define TARGET_10_2_DMA_BURST_SIZE		1
> +#define TARGET_10_2_DMA_BURST_SIZE		0
>  
>  /* Target specific defines for WMI-TLV firmware */
>  #define TARGET_TLV_NUM_VDEVS			4
> @@ -391,7 +391,7 @@ enum ath10k_hw_rate_cck {
>  
>  #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
>  #define TARGET_10_4_NUM_WDS_ENTRIES		32
> -#define TARGET_10_4_DMA_BURST_SIZE		1
> +#define TARGET_10_4_DMA_BURST_SIZE		0
>  #define TARGET_10_4_MAC_AGGR_DELIM		0
>  #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
>  #define TARGET_10_4_VOW_CONFIG			0
>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
