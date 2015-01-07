Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8qoz-0008NP-0C
 for ath10k@lists.infradead.org; Wed, 07 Jan 2015 13:38:49 +0000
Message-ID: <54AD36D3.7030009@candelatech.com>
Date: Wed, 07 Jan 2015 05:38:27 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Reproducible issue in hacked 3.17 kernel, CT firmware
References: <54A2FA97.9090601@candelatech.com>
 <CA+BoTQnj4V8myJvQLpW+gCHBsMZ-avtB5H5Ts2XONv6q9oRbVg@mail.gmail.com>
In-Reply-To: <CA+BoTQnj4V8myJvQLpW+gCHBsMZ-avtB5H5Ts2XONv6q9oRbVg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>



On 01/07/2015 01:58 AM, Michal Kazior wrote:
> On 30 December 2014 at 20:18, Ben Greear <greearb@candelatech.com> wrote:
>> yeah, so maybe not reproducible upstream, but anyway...
>>
>> My test case is to re-associate 4 stations over and over again, with
>> a scan and a 5 second sleep between iterations.  After
>> a short time, something goes weird and OS is mostly hung, probably
>> because important locks are held while ath10k is timing out communication
>> to firmware.
>>
>> The last message I see from firmware is that it is deleting vdev 4.
>>
>> I do not see any indication that firmware is crashed, but something
>> is wrong, maybe mgt buffers are used up?
> [...]
>> [  342.962494] ath10k_pci 0000:04:00.0: failed to set erp slot for vdev 4: -11
>
> -11 = -EAGAIN = out of wmi-htc tx credits. I wonder what the dbg
> buffer is trying to say.
>
> Either host sent a corrupted message and clogged up firmware buffers,
> firmware is busy processing other commands (wmi mgmt tx, wmi bcn
> non-dma tx) or became confused/corrupted.

I finally got back to debugging this yesterday, and interestingly, when
I added dbglog calls in the firmware around the credit handling, the problem is 'fixed'.

Looks like it ran overnight, where as before it would fail within a few minutes.

So, maybe a race around pci memory flushing or something like that?

I'll slowly back out my debug today and see what I can see.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
