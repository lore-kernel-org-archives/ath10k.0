Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkHAz-0002lb-Eg
 for ath10k@lists.infradead.org; Tue, 13 May 2014 18:11:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
Date: Tue, 13 May 2014 21:10:51 +0300
In-Reply-To: <1399942355-19993-1-git-send-email-apenwarr@gmail.com> (Avery
 Pennarun's message of "Mon, 12 May 2014 20:52:35 -0400")
Message-ID: <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Tested with CT firmware, but should work on standard
> firmware as well.

I think this is unnecessary as it works with the standard firmware,
right?

> Verified that target's tx/rx chain register is set appropriately,
> and that the tx rate goes down as number of chains
> decrease, but I did not actually try to verify antenna
> ceased to transmit when disabled.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> Tested-by: Avery Pennarun <apenwarr@gmail.com>

I'm no lawyer, but I think that when person A resends person B's patch
then person A should add Signed-off-by line as well. And then that would
make Tested-by line moot as well.

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -440,6 +440,12 @@ struct ath10k {
>  	bool radar_enabled;
>  	int num_started_vdevs;
>  
> +	/* Protected by conf-mutex */
> +	unsigned char supp_tx_chainmask;
> +	unsigned char supp_rx_chainmask;
> +	unsigned char cfg_tx_chainmask;
> +	unsigned char cfg_rx_chainmask;

char is a bit odd here, as we are not storing characters here. Would u8
be better?

> +static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&ar->conf_mutex);
> +
> +	ar->cfg_tx_chainmask = tx_ant;
> +	ar->cfg_rx_chainmask = rx_ant;
> +
> +	if ((ar->state != ATH10K_STATE_ON) &&
> +	    (ar->state != ATH10K_STATE_RESTARTED))
> +		return 0;

Should we return an error value instead? Aren't we otherwise cheating by
claiming that the command was succesful?

> +static int ath10k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
> +{
> +	struct ath10k *ar = hw->priv;
> +	int ret;
> +
> +	mutex_lock(&ar->conf_mutex);
> +	ret = __ath10k_set_antenna(ar, tx_ant, rx_ant);
> +	mutex_unlock(&ar->conf_mutex);
> +	return ret;
> +}
> +
> +

One empty line is enough here.

> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2558,6 +2558,8 @@ static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
>  	config.ast_skid_limit = __cpu_to_le32(TARGET_AST_SKID_LIMIT);
>  	config.tx_chain_mask = __cpu_to_le32(TARGET_TX_CHAIN_MASK);
>  	config.rx_chain_mask = __cpu_to_le32(TARGET_RX_CHAIN_MASK);
> +	ar->supp_tx_chainmask = TARGET_TX_CHAIN_MASK;
> +	ar->supp_rx_chainmask = TARGET_RX_CHAIN_MASK;
>  	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>  	config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>  	config.rx_timeout_pri_be = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
> @@ -2652,6 +2654,9 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
>  	config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
>  	config.tx_chain_mask = __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
>  	config.rx_chain_mask = __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
> +	/* TODO:  Have to deal with 2x2 chips if/when the come out. */
> +	ar->supp_tx_chainmask = TARGET_10X_TX_CHAIN_MASK;
> +	ar->supp_rx_chainmask = TARGET_10X_RX_CHAIN_MASK;
>  	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>  	config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>  	config.rx_timeout_pri_be = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);

This initialisation looks out of place as we these variables have
nothing to do with the actual WMI_INIT_CMDID command. And besides, they
would get overwritten every time we start the firmware. Is that on
purpose?

I think we should find more approriate place, for example
ath10k_mac_register() would be one to look at.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
