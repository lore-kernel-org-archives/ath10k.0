Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtIZC-0007Ks-6E
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 15:29:58 +0000
Message-ID: <53932FE1.6090506@candelatech.com>
Date: Sat, 07 Jun 2014 08:29:37 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] ath10k:  provide firmware crash info via debugfs.
References: <1401904902-5842-1-git-send-email-greearb@candelatech.com>	<87y4xal6vb.fsf@kamboji.qca.qualcomm.com>	<5391F51B.4020103@candelatech.com>
 <87zjhoj2rt.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87zjhoj2rt.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org



On 06/07/2014 05:57 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 06/06/2014 02:33 AM, Kalle Valo wrote:
>>
>>>> +					kfree(buffer);
>>>> +					goto save_regs_and_restart;
>>>> +				}
>>>> +
>>>> +				ath10k_dbg_save_fw_dbg_buffer(ar, buffer,
>>>> +							      dbuf.length);
>>>> +				kfree(buffer);
>>>
>>> Instead of doing atomic allocations multiple times in a loop, would it
>>> be better to allocate just one buffer before the loop and free it
>>> afterwards?
>>
>> There is no hard guarantee that the buffer lengths are the same,
>> so I think it needs to remain as is.  Would rather not crap out
>> because firmware suddenly got more clever...
>
> This is related to my earlier comment about having a max len for the
> buffers. So why not come up with a sane max length, allocate once a
> temporary buffer of that length and use the same buffer in the loop?

I can fix it at a 4k chunk if you want.  Current firmware uses around 2k chunk
I believe, and only two buffers, so either way it's not a lot of work for CPU.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
