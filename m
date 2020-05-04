Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway33.websitewelcome.com ([192.185.147.108])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVdam-0007t9-01
 for ath10k@lists.infradead.org; Mon, 04 May 2020 16:05:20 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id 811DB3B708
 for <ath10k@lists.infradead.org>; Mon,  4 May 2020 11:04:57 -0500 (CDT)
References: <20200430213101.135134-1-arnd@arndb.de>
 <20200430213101.135134-5-arnd@arndb.de>
 <49831bca-b9cf-4b9a-1a60-f4289e9c83c0@embeddedor.com>
 <87368flxui.fsf@codeaurora.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 04/15] ath10k: fix gcc-10 zero-length-bounds warnings
Message-ID: <69f5c551-01ab-3b90-01a1-42514cd58f60@embeddedor.com>
Date: Mon, 4 May 2020 11:09:21 -0500
MIME-Version: 1.0
In-Reply-To: <87368flxui.fsf@codeaurora.org>
Content-Language: en-US
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Erik Stromdahl <erik.stromdahl@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Wen Gong <wgong@codeaurora.org>, "David S. Miller" <davem@davemloft.net>



On 5/4/20 06:54, Kalle Valo wrote:
> "Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:
> 
>> Hi Arnd,
>>
>> On 4/30/20 16:30, Arnd Bergmann wrote:
>>> gcc-10 started warning about out-of-bounds access for zero-length
>>> arrays:
>>>
>>> In file included from drivers/net/wireless/ath/ath10k/core.h:18,
>>>                  from drivers/net/wireless/ath/ath10k/htt_rx.c:8:
>>> drivers/net/wireless/ath/ath10k/htt_rx.c: In function 'ath10k_htt_rx_tx_fetch_ind':
>>> drivers/net/wireless/ath/ath10k/htt.h:1683:17: warning: array subscript 65535 is outside the bounds of an interior zero-length array 'struct htt_tx_fetch_record[0]' [-Wzero-length-bounds]
>>>  1683 |  return (void *)&ind->records[le16_to_cpu(ind->num_records)];
>>>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/net/wireless/ath/ath10k/htt.h:1676:29: note: while referencing 'records'
>>>  1676 |  struct htt_tx_fetch_record records[0];
>>>       |                             ^~~~~~~
>>>
>>> The structure was already converted to have a flexible-array member in
>>> the past, but there are two zero-length members in the end and only
>>> one of them can be a flexible-array member.
>>>
>>> Swap the two around to avoid the warning, as 'resp_ids' is not accessed
>>> in a way that causes a warning.
>>>
>>> Fixes: 3ba225b506a2 ("treewide: Replace zero-length array with flexible-array member")
>>> Fixes: 22e6b3bc5d96 ("ath10k: add new htt definitions")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/htt.h | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
>>> index e7096a73c6ca..7621f0a3dc77 100644
>>> --- a/drivers/net/wireless/ath/ath10k/htt.h
>>> +++ b/drivers/net/wireless/ath/ath10k/htt.h
>>> @@ -1673,8 +1673,8 @@ struct htt_tx_fetch_ind {
>>>  	__le32 token;
>>>  	__le16 num_resp_ids;
>>>  	__le16 num_records;
>>> -	struct htt_tx_fetch_record records[0];
>>> -	__le32 resp_ids[]; /* ath10k_htt_get_tx_fetch_ind_resp_ids() */
>>> +	__le32 resp_ids[0]; /* ath10k_htt_get_tx_fetch_ind_resp_ids() */
>>> +	struct htt_tx_fetch_record records[];
>>>  } __packed;
>>>  
>>>  static inline void *
>>>
>>
>> The treewide patch is an experimental change and, as this change only applies
>> to my -next tree, I will carry this patch in it, so other people don't have
>> to worry about this at all.
> 
> Gustavo, why do you have ath10k patches in your tree? I prefer that
> ath10k patches go through my ath.git tree so that they are reviewed and
> tested.
> 

I just wanted to test out a mechanical change. I will remove it from my tree
now and will send a patch to you so you can apply it to your ath.git tree.

Thanks!
--
Gustavo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
