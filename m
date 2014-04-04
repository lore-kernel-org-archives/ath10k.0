Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WW5Rj-0004fr-O5
 for ath10k@lists.infradead.org; Fri, 04 Apr 2014 14:50:20 +0000
Message-ID: <533EC686.40505@candelatech.com>
Date: Fri, 04 Apr 2014 07:49:42 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT 0/4] ath10k: fix flushing and tx stalls
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 04/04/2014 04:37 AM, Michal Kazior wrote:
> Hi,
>
> After digging around I've found what seems to be
> the problem with WMI Tx credit starvation and
> inability to properly flush Tx in ath10k_flush().
>
> Long story short: if a client that was asleep (as
> per what firmware thinks) goes out of range (or
> just stops responding) then Tx rots in FW/HW
> queues for a few seconds before it's discarded.
> For WMI Tx credits this means management frames
> eat up Tx credits for a few seconds (causing other
> WMI commands to timeout and return -EAGAIN/-11).
> For HTT Tx this means NullFunc frames would get
> stuck for a few seconds before completion was
> received.
>
> @Ben: Can you check if this helps you? I tested
> this briefly and at least [1/4] seems fixes the
> WMI Tx starvation. I'm hoping patches 2-4 help
> with your ath10k_flush() failures which I haven't
> been successfull in reproducing (but have observed
> improvement with purging some frames out of FW/HW
> queues).

I'm out of office for a bit, but will test this as
soon as I'm back.

Thanks for looking into this!

In general, would it make more sense to have a few more tx credits
available to mitigate the slow-to-be-processed buffers?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
