Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtYDt-0003Ev-7d
 for ath10k@lists.infradead.org; Sun, 08 Jun 2014 08:13:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k:  provide firmware crash info via debugfs.
References: <1401904902-5842-1-git-send-email-greearb@candelatech.com>
 <87y4xal6vb.fsf@kamboji.qca.qualcomm.com>
 <5391F51B.4020103@candelatech.com>
 <87zjhoj2rt.fsf@kamboji.qca.qualcomm.com>
 <53932FE1.6090506@candelatech.com>
Date: Sun, 8 Jun 2014 11:12:28 +0300
In-Reply-To: <53932FE1.6090506@candelatech.com> (Ben Greear's message of "Sat, 
 7 Jun 2014 08:29:37 -0700")
Message-ID: <87bnu3izv7.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>>>> Instead of doing atomic allocations multiple times in a loop, would it
>>>> be better to allocate just one buffer before the loop and free it
>>>> afterwards?
>>>
>>> There is no hard guarantee that the buffer lengths are the same,
>>> so I think it needs to remain as is.  Would rather not crap out
>>> because firmware suddenly got more clever...
>>
>> This is related to my earlier comment about having a max len for the
>> buffers. So why not come up with a sane max length, allocate once a
>> temporary buffer of that length and use the same buffer in the loop?
>
> I can fix it at a 4k chunk if you want.  Current firmware uses around 2k chunk
> I believe, and only two buffers, so either way it's not a lot of work for CPU.

I think we should have a max chunk size in ath10k anyway and using one
buffer makes sense in that case.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
