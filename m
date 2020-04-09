Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMZKM-0007Kx-Dy
 for ath10k@lists.infradead.org; Thu, 09 Apr 2020 15:42:54 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v9 3/4] ath10k: add htt TX bundle for sdio
References: <20200212080415.31265-1-wgong@codeaurora.org>
 <20200212080415.31265-4-wgong@codeaurora.org>
 <87pncgu2ba.fsf@kamboji.qca.qualcomm.com>
 <36ee3bed6f7cd200df0755209ec6bbc2@codeaurora.org>
Date: Thu, 09 Apr 2020 18:42:41 +0300
In-Reply-To: <36ee3bed6f7cd200df0755209ec6bbc2@codeaurora.org> (Wen Gong's
 message of "Thu, 09 Apr 2020 23:29:20 +0800")
Message-ID: <87lfn4u0lq.fsf@kamboji.qca.qualcomm.com>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> On 2020-04-09 23:05, Kalle Valo wrote:
>
>>> +		ep->tx_credits -= credits;
>>> +		ath10k_dbg(ar, ATH10K_DBG_HTC,
>>> +			   "htc ep %d consumed %d credits (total %d)\n",
>>
>> "htc ep %d consumed %d credits total %d\n"
>>
>> [...]
>>
>>> +	ath10k_dbg(ar, ATH10K_DBG_HTC, "bundle skb: len:%d\n",
>>> bundle_skb->len);
>>
>> "htc bundle skb len %d\n"
>>
>> In other words, start with "htc" and don't use colons or parenthesis.
>> This applies to most of debug messages in this patch.
>
> I will change the log and other log and sent v10.
> but "ath10k: disable TX complete indication of htt for sdio" and
> "ath10k: change ATH10K_SDIO_BUS_REQUEST_MAX_NUM from 64 to 1024" has
> appied to ath-next,
> so I only need to send the left 2 patches:
> "ath10k: add htt TX bundle for sdio" and "ath10k: enable alt data of
> TX path for sdio", right?

Correct, I already applied patches 1 and 2. But before you resend
patches 3-4 did you see my question about creating a new thread, is it
really necessary?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
