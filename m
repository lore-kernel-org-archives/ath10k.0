Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMr4t-000832-0h
 for ath10k@lists.infradead.org; Tue, 22 Oct 2019 10:07:48 +0000
Received: by mail-oi1-x244.google.com with SMTP id g81so13650748oib.8
 for <ath10k@lists.infradead.org>; Tue, 22 Oct 2019 03:07:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
References: <1571734629-18028-1-git-send-email-zhichen@codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 22 Oct 2019 12:07:44 +0200
Message-ID: <CAKR_QVLDFBVMDDP4mPYVNdpT9TA3podNeQMpVJQwE7A5eG=0kA@mail.gmail.com>
Subject: Re: [PATCH RFC] Revert "ath10k: fix DMA related firmware crashes on
 multiple devices"
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
To: Zhi Chen <zhichen@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 22/10/2019, Zhi Chen <zhichen@codeaurora.org> wrote:
> This reverts commit 76d164f582150fd0259ec0fcbc485470bcd8033e.
> PCIe hung issue was observed on multiple platforms. The issue was
> reproduced
> when DUT was configured as AP and associated with 50+ STAs.
>
> With PCIe protocol analyzer, we can see DMA Read crossing 4KB boundary when
> issue happened. It broke PCIe spec and caused PCIe stuck.
>
> Tested:  IPQ8064 + QCA9984 with firmware 10.4-3.10-00047
>          QCS404 + QCA9984 with firmware 10.4-3.9.0.2--00044
>          Synaptics AS370 + QCA9888  with firmware 10.4-3.9.0.2--00040
>
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/hw.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h
> b/drivers/net/wireless/ath/ath10k/hw.h
> index 35a3623..17f620b 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -753,7 +753,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
>  #define TARGET_10X_MAX_FRAG_ENTRIES		0
>
>  /* 10.2 parameters */
> -#define TARGET_10_2_DMA_BURST_SIZE		0
> +#define TARGET_10_2_DMA_BURST_SIZE		1
>
>  /* Target specific defines for WMI-TLV firmware */
>  #define TARGET_TLV_NUM_VDEVS			4
> @@ -813,7 +813,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
>
>  #define TARGET_10_4_TX_DBG_LOG_SIZE		1024
>  #define TARGET_10_4_NUM_WDS_ENTRIES		32
> -#define TARGET_10_4_DMA_BURST_SIZE		0
> +#define TARGET_10_4_DMA_BURST_SIZE		1
>  #define TARGET_10_4_MAC_AGGR_DELIM		0
>  #define TARGET_10_4_RX_SKIP_DEFRAG_TIMEOUT_DUP_DETECTION_CHECK 1
>  #define TARGET_10_4_VOW_CONFIG			0
> --
> 2.7.4
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

What about main and 10x firmware branch?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
