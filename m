Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB4xn-0004Ny-0n
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 17:09:07 +0000
Message-ID: <54B5511D.6030206@candelatech.com>
Date: Tue, 13 Jan 2015 09:08:45 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Checking on interest in some patches...
References: <54A45615.1050401@candelatech.com>
 <878uh67qga.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <878uh67qga.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 01/13/2015 05:36 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> Previously, I was at a dead end trying to get support for CT firmware features,
>> expanded crash dump features, and other things accepted upstream.
>>
>> I am working on porting my changes to the 3.19 kernel, and was curious if
>> there is any change of opinion on possibly accepting at least some CT firmware
>> support or the crash dump features.  If so, I'll clean up and re-post once
>> I have tested them.
> 
> We have now four different firmware branches to support and I fear even
> more to come. Adding yet another branch is quite daunting from
> maintenance point of view.

No worse than the current code...and mine isn't really a new branch,
just a few small deviations from the existing 10.1 firmware.  Even if you
don't want some of the larger changes, it would be nice to get in some of
the small and easy things like ibss support, lots of vdevs, maybe tx-rate
reporting, etc.

> Crash dump support is already upstream, but what's missing is porting it
> to use Johannes' device coredump (commit 833c95456a70) and RAM dump
> part. (And I guess we also want some sort register dump?)
> 
> Last year I implemented the RAM dump part, but only did some quick
> verification and that's why I haven't submitted it yet. I think I need
> to submit it as RFC instead of bitrotting on my hard drive.

I have some well tested RAM and ROM and debuglog dump patches.  Similar
to the patches we had worked on before.  ROM and RAM require new ie header
on firmware, and 3.19 ath10k broke dbglog on upstream 10.1 firmware, but aside
from that, it works great :)

I have register dump supported over regular WMI api (shown in debugfs) in CT firmware,
but it is not part of the crash dump.  At least for me, that has not
been a problem.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
