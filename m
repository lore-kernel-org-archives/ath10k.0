Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY90c-0002ib-6p
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 06:30:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: remove P2P from supported interface modes for
 10.X FW
References: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
Date: Mon, 21 Oct 2013 09:30:06 +0300
In-Reply-To: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Fri, 18 Oct 2013 12:07:57 +0200")
Message-ID: <87mwm3uoep.fsf@kamboji.qca.qualcomm.com>
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

> FW 10.X does not support P2P, stop advertising it to mac80211.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

[...]

> @@ -3478,7 +3504,11 @@ int ath10k_mac_register(struct ath10k *ar)
>  	 */
>  	ar->hw->queues = 4;
>  
> -	ar->hw->wiphy->iface_combinations = &ath10k_if_comb;
> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
> +		ar->hw->wiphy->iface_combinations = &ath10k_10x_if_comb;
> +	else
> +		ar->hw->wiphy->iface_combinations = &ath10k_if_comb;

I think it would be better to have a separate feature flag for this,
like NO_P2P or something like that. Just in case we want to disable P2P
in other firmware branches.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
