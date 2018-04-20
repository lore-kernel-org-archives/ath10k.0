Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9VTx-0001Xp-DC
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 12:49:43 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCHv2] ath10k: fix kernel panic while reading tpc_stats
References: <1521739904-17927-1-git-send-email-tamizhr@codeaurora.org>
 <87d0zqrg5c.fsf@kamboji.qca.qualcomm.com>
 <091e88a3479502f30683054f89c9da33@codeaurora.org>
Date: Fri, 20 Apr 2018 15:49:27 +0300
In-Reply-To: <091e88a3479502f30683054f89c9da33@codeaurora.org> (Tamizh
 chelvam's message of "Tue, 27 Mar 2018 12:09:54 +0530")
Message-ID: <87efjagi08.fsf@kamboji.qca.qualcomm.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Tamizh chelvam <tamizhr@codeaurora.org> writes:

> On 2018-03-26 21:19, Kalle Valo wrote:
>> Tamizh chelvam <tamizhr@codeaurora.org> writes:
>>
>>> @@ -4455,6 +4461,8 @@ void ath10k_wmi_event_pdev_tpc_config(struct
>>> ath10k *ar, struct sk_buff *skb)
>>>  		   __le32_to_cpu(ev->twice_max_rd_power) / 2,
>>>  		   __le32_to_cpu(ev->num_tx_chain),
>>>  		   __le32_to_cpu(ev->rate_max));
>>> +exit:
>>> +	complete(&ar->debug.tpc_complete);
>>>  }
>>
>> And why do you need this anyway? The commit log doesn't explain that.
>
> Previously this complete call was not there in the error case and
> without this we will get "failed to request tpc config stats: -110"
> along with the error message and this is a timeout warning. I've added
> this since we have received the event and the warning message is
> incorrect. I'll remove this complete call here since it is a harmless
> message and send the next version of a patch.

Yeah, that's a good idea. If you want to add the complete it's better to
do that in it's own patch (and with a proper explanation in the commit
log).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
