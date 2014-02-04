Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAl1Y-0004jT-6t
 for ath10k@lists.infradead.org; Tue, 04 Feb 2014 18:47:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k:  Print out firmware feature bits from IE.
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
Date: Tue, 4 Feb 2014 20:46:24 +0200
In-Reply-To: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 22 Jan 2014 16:05:59
 -0800")
Message-ID: <87txceogvz.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Aids in understanding excactly what a firmware is
> offering.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Patch 1 applied, still reviewing the rest.

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -470,8 +470,12 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
>  				if (index == ie_len)
>  					break;
>  
> -				if (data[index] & (1 << bit))
> +				if (data[index] & (1 << bit)) {
> +					ath10k_dbg(ATH10K_DBG_BOOT,
> +						   "Enabling feature bit: %i\n",
> +						   i);
>  					__set_bit(i, ar->fw_features);
> +				}
>  			}

I was actually hoping to have something better like ath6kl has which
prints a name for the feature:

	{ ATH6KL_FW_CAPABILITY_HOST_P2P, "host-p2p" },
	{ ATH6KL_FW_CAPABILITY_SCHED_SCAN, "sched-scan" },
	{ ATH6KL_FW_CAPABILITY_STA_P2PDEV_DUPLEX, "sta-p2pdev-duplex" },
	{ ATH6KL_FW_CAPABILITY_INACTIVITY_TIMEOUT, "inactivity-timeout" },
	{ ATH6KL_FW_CAPABILITY_RSN_CAP_OVERRIDE, "rsn-cap-override" },
	{ ATH6KL_FW_CAPABILITY_WOW_MULTICAST_FILTER, "wow-mc-filter" },

But this is something for the future.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
