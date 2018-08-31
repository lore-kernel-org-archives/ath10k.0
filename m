Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fvi5r-0003ic-VL
 for ath10k@lists.infradead.org; Fri, 31 Aug 2018 12:00:23 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 3/4] ath10k: add extended per sta tx statistics support
References: <1533561223-342-1-git-send-email-akolli@codeaurora.org>
 <1533561223-342-4-git-send-email-akolli@codeaurora.org>
Date: Fri, 31 Aug 2018 14:59:48 +0300
In-Reply-To: <1533561223-342-4-git-send-email-akolli@codeaurora.org>
 (Anilkumar Kolli's message of "Mon, 6 Aug 2018 18:43:42 +0530")
Message-ID: <87r2ied9vv.fsf@kamboji.qca.qualcomm.com>
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
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Anilkumar Kolli <akolli@codeaurora.org> writes:

> This patch adds per station tx statistics support.
>
> Per station tx stats include
>  - pkts/bytes transmitted at all possible rates(mcs/nss/bw/gi).
>  - ACK fails count
>  - ampdu bytes/pkts transmitted at all possible rates(mcs/nss/bw/gi).
>  - BA fails count
>
> Tested on QCA9984/QCA4019/QCA988x
> Firmware: 10.4-3.5.3-00057
> 	  10.2.4-1.0-00037
>
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>

[...]

> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -4958,10 +4958,15 @@ enum wmi_rate_preamble {
>  #define ATH10K_HW_GI(flags)		(((flags) >> 5) & 0x1)
>  #define ATH10K_HW_RATECODE(rate, nss, preamble) \
>  	(((preamble) << 6) | ((nss) << 4) | (rate))
> -
> -#define VHT_MCS_NUM     10
> -#define VHT_BW_NUM      4
> -#define VHT_NSS_NUM     4
> +#define ATH10K_HW_AMPDU(flags)		(flags & 0x1)
> +#define ATH10K_HW_BA_FAIL(flags)	(((flags) >> 1) & 0x3)
> +
> +#define NUM_VHT_MCS	10
> +#define NUM_BW		4
> +#define NUM_NSS	4
> +#define NUM_LEGACY	12
> +#define NUM_GI		2
> +#define NUM_HT_MCS	32

Why are you renaming these to use NUM_ prefix? That looks odd to me,
usually the "NUM" is the last.

If changing something, you should add ATH10K_ prefix to missing defines.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
