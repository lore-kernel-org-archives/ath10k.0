Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG8Zj-0003Vm-OI
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 14:56:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC/RFT 4/7] ath10k: bypass htc for htt tx path
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-5-git-send-email-michal.kazior@tieto.com>
Date: Wed, 19 Feb 2014 16:56:12 +0200
In-Reply-To: <1392629563-31046-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 17 Feb 2014 10:32:40 +0100")
Message-ID: <87ppmjxib7.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Going through full HTC tx path for HTT tx is a
> waste of resources. By skipping it it's possible
> to easily submit scatter-gather to the PCI HIF for
> reduced host CPU load and improved performance.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

For a change like this the commit log needs to be more descriptive.
There's no mention about dma pools, nothing about the basic principle
how this works now etc.

> @@ -1067,9 +1067,9 @@ struct ath10k_ce_pipe *ath10k_ce_init(struct ath10k *ar,
>  	 *
>  	 * For the lack of a better place do the check here.
>  	 */
> -	BUILD_BUG_ON(TARGET_NUM_MSDU_DESC >
> +	BUILD_BUG_ON(2*TARGET_NUM_MSDU_DESC >
>  		     (CE_HTT_H2T_MSG_SRC_NENTRIES - 1));
> -	BUILD_BUG_ON(TARGET_10X_NUM_MSDU_DESC >
> +	BUILD_BUG_ON(2*TARGET_10X_NUM_MSDU_DESC >
>  		     (CE_HTT_H2T_MSG_SRC_NENTRIES - 1));
>  
>  	ret = ath10k_pci_wake(ar);
> diff --git a/drivers/net/wireless/ath/ath10k/ce.h b/drivers/net/wireless/ath/ath10k/ce.h
> index 322e929..8eb7f99 100644
> --- a/drivers/net/wireless/ath/ath10k/ce.h
> +++ b/drivers/net/wireless/ath/ath10k/ce.h
> @@ -23,7 +23,7 @@
>  
>  /* Maximum number of Copy Engine's supported */
>  #define CE_COUNT_MAX 8
> -#define CE_HTT_H2T_MSG_SRC_NENTRIES 2048
> +#define CE_HTT_H2T_MSG_SRC_NENTRIES 4096

Also document why you do these changes.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
