Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcver-0005VN-FW
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 14:29:31 +0000
Message-ID: <57BF009B.4030008@candelatech.com>
Date: Thu, 25 Aug 2016 07:28:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCHv3 2/2] ath10k: Allow setting coverage class
References: <20160825132522.30994-1-benjamin@sipsolutions.net>
 <20160825132522.30994-3-benjamin@sipsolutions.net>
In-Reply-To: <20160825132522.30994-3-benjamin@sipsolutions.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Benjamin Berg <benjamin@sipsolutions.net>, ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Simon Wunderlich <sw@simonwunderlich.de>



On 08/25/2016 06:25 AM, Benjamin Berg wrote:
> Unfortunately ath10k does not generally allow modifying the coverage class
> with the stock firmware and Qualcomm has so far refused to implement this
> feature so that it can be properly supported in ath10k. If we however know
> the registers that need to be modified for proper operation with a higher
> coverage class, then we can do these modifications from the driver.
>
> This patch implements this hack for first generation cards which are based
> on a core that is similar to ath9k. The registers are modified in place and
> need to be re-written every time the firmware sets them. To achieve this
> the register status is verified after certain WMI events from the firmware.
>
> The coverage class may not be modified temporarily right after the card
> re-initializes the registers. This is for example the case during scanning.
>
> Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for initially
> working on a userspace support for this. This patch wouldn't have been
> possible without this documentation.



> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index d246288..8ccc8cf 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -4879,6 +4879,12 @@ exit:
>   	return 0;
>   }
>
> +static inline void ath10k_wmi_queue_set_coverage_class_work(struct ath10k *ar)
> +{
> +	if (ar->hw_params.hw_ops->set_coverage_class)
> +		queue_work(ar->workqueue, &ar->set_coverage_class_work);
> +}

Maybe this should first check to see if the user has specified a coverage class
before it attempts to do any work at all?

That way, if user does not set anything, then the behaviour does not change
in any significant way?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
