Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WtGC3-0004Ej-Im
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 12:57:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/4] ath10k:  provide firmware crash info via debugfs.
References: <1401904902-5842-1-git-send-email-greearb@candelatech.com>
 <87y4xal6vb.fsf@kamboji.qca.qualcomm.com>
 <5391F51B.4020103@candelatech.com>
Date: Sat, 7 Jun 2014 15:57:26 +0300
In-Reply-To: <5391F51B.4020103@candelatech.com> (Ben Greear's message of "Fri, 
 6 Jun 2014 10:06:35 -0700")
Message-ID: <87zjhoj2rt.fsf@kamboji.qca.qualcomm.com>
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

> On 06/06/2014 02:33 AM, Kalle Valo wrote:
>
>>> +					kfree(buffer);
>>> +					goto save_regs_and_restart;
>>> +				}
>>> +
>>> +				ath10k_dbg_save_fw_dbg_buffer(ar, buffer,
>>> +							      dbuf.length);
>>> +				kfree(buffer);
>> 
>> Instead of doing atomic allocations multiple times in a loop, would it
>> be better to allocate just one buffer before the loop and free it
>> afterwards?
>
> There is no hard guarantee that the buffer lengths are the same,
> so I think it needs to remain as is.  Would rather not crap out
> because firmware suddenly got more clever...

This is related to my earlier comment about having a max len for the
buffers. So why not come up with a sane max length, allocate once a
temporary buffer of that length and use the same buffer in the loop?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
