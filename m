Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VsYvu-0003zl-WB
 for ath10k@lists.infradead.org; Mon, 16 Dec 2013 14:14:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: split the if_limits and if_comb
References: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 16 Dec 2013 16:13:36 +0200
In-Reply-To: <1386688840-12181-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 10 Dec 2013 16:20:39 +0100")
Message-ID: <87k3f4g9yn.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> Split the interface limits and inteface combination,
> to reflect the 10.X capabilites (no P2P, no STA and 8 VAP).
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Both patches applied. I did minor changes in patch 1, please double
check:

> @@ -3717,8 +3718,15 @@ int ath10k_mac_register(struct ath10k *ar)
>  	 */
>  	ar->hw->queues = 4;
>  
> -	ar->hw->wiphy->iface_combinations = ath10k_if_comb;
> -	ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_if_comb);
> +	if (!test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
> +
> +		ar->hw->wiphy->iface_combinations = ath10k_if_comb;
> +		ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_if_comb);
> +
> +	} else {
> +		ar->hw->wiphy->iface_combinations = ath10k_10x_if_comb;
> +		ar->hw->wiphy->n_iface_combinations = ARRAY_SIZE(ath10k_10x_if_comb);
> +	}

I fixed checkpatch warnings here and reversed the test to get rid
unnecessary negation operator.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
