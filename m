Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkHF8-0004Id-4y
 for ath10k@lists.infradead.org; Tue, 13 May 2014 18:15:58 +0000
Message-ID: <53726148.3090503@candelatech.com>
Date: Tue, 13 May 2014 11:15:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: support get/set antenna configurations.
References: <5370F41A.70202@candelatech.com>
 <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87y4y5h7mc.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Avery Pennarun <apenwarr@gmail.com>

On 05/13/2014 11:10 AM, Kalle Valo wrote:

>> +static int __ath10k_set_antenna(struct ath10k *ar, u32 tx_ant, u32 rx_ant)
>> +{
>> +	int ret;
>> +
>> +	lockdep_assert_held(&ar->conf_mutex);
>> +
>> +	ar->cfg_tx_chainmask = tx_ant;
>> +	ar->cfg_rx_chainmask = rx_ant;
>> +
>> +	if ((ar->state != ATH10K_STATE_ON) &&
>> +	    (ar->state != ATH10K_STATE_RESTARTED))
>> +		return 0;
> 
> Should we return an error value instead? Aren't we otherwise cheating by
> claiming that the command was succesful?

I think not..we store the values, and they will be applied when firmware
does come up.

We might should return error if bad bit patterns are set, but to be honest,
aside from trial and error, I'm not sure how to figure those out.  Maybe
some internal QCA docs document the allowed configurations?

>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -2558,6 +2558,8 @@ static int ath10k_wmi_main_cmd_init(struct ath10k *ar)
>>  	config.ast_skid_limit = __cpu_to_le32(TARGET_AST_SKID_LIMIT);
>>  	config.tx_chain_mask = __cpu_to_le32(TARGET_TX_CHAIN_MASK);
>>  	config.rx_chain_mask = __cpu_to_le32(TARGET_RX_CHAIN_MASK);
>> +	ar->supp_tx_chainmask = TARGET_TX_CHAIN_MASK;
>> +	ar->supp_rx_chainmask = TARGET_RX_CHAIN_MASK;
>>  	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>>  	config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>>  	config.rx_timeout_pri_be = __cpu_to_le32(TARGET_RX_TIMEOUT_LO_PRI);
>> @@ -2652,6 +2654,9 @@ static int ath10k_wmi_10x_cmd_init(struct ath10k *ar)
>>  	config.ast_skid_limit = __cpu_to_le32(TARGET_10X_AST_SKID_LIMIT);
>>  	config.tx_chain_mask = __cpu_to_le32(TARGET_10X_TX_CHAIN_MASK);
>>  	config.rx_chain_mask = __cpu_to_le32(TARGET_10X_RX_CHAIN_MASK);
>> +	/* TODO:  Have to deal with 2x2 chips if/when the come out. */
>> +	ar->supp_tx_chainmask = TARGET_10X_TX_CHAIN_MASK;
>> +	ar->supp_rx_chainmask = TARGET_10X_RX_CHAIN_MASK;
>>  	config.rx_timeout_pri_vo = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>>  	config.rx_timeout_pri_vi = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
>>  	config.rx_timeout_pri_be = __cpu_to_le32(TARGET_10X_RX_TIMEOUT_LO_PRI);
> 
> This initialisation looks out of place as we these variables have
> nothing to do with the actual WMI_INIT_CMDID command. And besides, they
> would get overwritten every time we start the firmware. Is that on
> purpose?
> 
> I think we should find more approriate place, for example
> ath10k_mac_register() would be one to look at.

It doesn't hurt that they are over-written, but probably it
can be done better.

I'm knee deep in other bugs though...maybe Avery has time to
address this.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
