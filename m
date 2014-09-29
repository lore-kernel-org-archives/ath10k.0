Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYWGV-0001gy-Pn
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 08:25:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 07/10] ath10k: add fw-powerup-fail to ethtool stats.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-7-git-send-email-greearb@candelatech.com>
Date: Mon, 29 Sep 2014 11:24:36 +0300
In-Reply-To: <1411507045-18973-7-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 23 Sep 2014 14:17:22
 -0700")
Message-ID: <87a95i3kcb.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> This gives user-space a normal-ish way to detect that
> firmware has failed to start and that a reboot is
> probably required.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -1851,7 +1851,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  			    ret);
>  
>  		if (ath10k_pci_reset_mode == ATH10K_PCI_RESET_WARM_ONLY)
> -			return ret;
> +			goto out;
>  
>  		ath10k_warn(ar, "trying cold reset\n");
>  
> @@ -1859,11 +1859,17 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar)
>  		if (ret) {
>  			ath10k_err(ar, "failed to power up target using cold reset too (%d)\n",
>  				   ret);
> -			return ret;
> +			goto out;
>  		}
>  	}
>  
> -	return 0;
> +out:
> +	/* If we have failed to power-up, it may take a reboot to
> +	 * get the NIC back online.
> +	 * Set flag accordinly so that user-space can know.
> +	 */
> +	ar->fw_powerup_failed = !!ret;
> +	return ret;
>  }

Would it be better to use ATH10K_STATE_WEDGED for this and then just
export the state value to user space? Or should we have two different
states, like FW_WEDGED and HW_WEDGED?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
