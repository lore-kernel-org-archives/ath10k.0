Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNa0G-0001N9-Lg
 for ath10k@lists.infradead.org; Thu, 24 Oct 2019 10:06:02 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v6 2/3] ath10k: change max RX bundle size from 8 to 32 for
 sdio
References: <1569402639-31720-1-git-send-email-wgong@codeaurora.org>
 <1569402639-31720-3-git-send-email-wgong@codeaurora.org>
Date: Thu, 24 Oct 2019 13:05:53 +0300
In-Reply-To: <1569402639-31720-3-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Wed, 25 Sep 2019 17:10:38 +0800")
Message-ID: <87h83ysbjy.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> The max bundle size support by firmware is 32, change it from 8 to 32
> will help performance. This results in significant performance
> improvement on RX path.
>
> Tested with QCA6174 SDIO with firmware
> WLAN.RMH.4.4.1-00017-QCARMSWPZ-1
>
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/htc.h
> +++ b/drivers/net/wireless/ath/ath10k/htc.h
> @@ -39,7 +39,7 @@
>   * 4-byte aligned.
>   */
>  
> -#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        8
> +#define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        32
>  
>  enum ath10k_htc_tx_flags {
>  	ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE = 0x01,
> @@ -48,10 +48,16 @@ enum ath10k_htc_tx_flags {
>  
>  enum ath10k_htc_rx_flags {
>  	ATH10K_HTC_FLAGS_RECV_1MORE_BLOCK = 0x01,
> -	ATH10K_HTC_FLAG_TRAILER_PRESENT = 0x02,
> -	ATH10K_HTC_FLAG_BUNDLE_MASK     = 0xF0
> +	ATH10K_HTC_FLAG_TRAILER_PRESENT = 0x02
>  };

I left the comma in ATH10K_HTC_FLAG_TRAILER_PRESENT to make the diff cleaner.

> +#define ATH10K_HTC_FLAG_BUNDLE_MASK 0xF0
> +#define ATH10K_HTC_BUNDLE_EXTRA_MASK GENMASK(3, 2)
> +
> +#define ATH10K_HTC_GET_BUNDLE_COUNT(flags) \
> +	    (FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, (flags)) +  \
> +	    (FIELD_GET(ATH10K_HTC_BUNDLE_EXTRA_MASK, (flags)) << 4))

I think I asked you about the shift of 4 bits earlier but now I figured
it out (I hope) and documented it like this:

#define ATH10K_HTC_FLAG_BUNDLE_MASK GENMASK(7,4)

/* bits 2-3 are for extra bundle count bits 4-5 */
#define ATH10K_HTC_BUNDLE_EXTRA_MASK GENMASK(3, 2)
#define ATH10K_HTC_BUNDLE_EXTRA_SHIFT 4

static inline unsigned int ath10k_htc_get_bundle_count(u8 flags)
{
	unsigned int count, extra_count;

	count = FIELD_GET(ATH10K_HTC_FLAG_BUNDLE_MASK, flags);
	extra_count = FIELD_GET(ATH10K_HTC_BUNDLE_EXTRA_MASK, flags) <<
		ATH10K_HTC_BUNDLE_EXTRA_SHIFT;

	return count + extra_count;
}

As you can see I also changed the macro to a function, as I prefer C
over CPP :) And changed ATH10K_HTC_FLAG_BUNDLE_MASK to use GENMASK().

But this only compiled tested, please do properly test the patches from
pending branch and let me know if I broke something:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=afd85ca1b086695cfd26bf484442eaf3bccb6bdd

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=4225b4d50a4f6a1159dc3316d068398f1b5edb57

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=911e0fc846cfc46fb4ccd1d223cb153681ff05bd

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
