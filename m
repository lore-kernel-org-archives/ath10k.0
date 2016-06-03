Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1b8sSa-0008CP-1A
 for ath10k@lists.infradead.org; Fri, 03 Jun 2016 17:00:37 +0000
Subject: Re: [PATCH 2/2] ath10k: remove 10.1 firmware support
References: <20160603153328.11947-1-rmanohar@qti.qualcomm.com>
 <20160603153328.11947-2-rmanohar@qti.qualcomm.com>
 <5751A6D5.7080901@candelatech.com>
 <743182bcbd1efbdb576bcc51b0215300@codeaurora.org>
 <87shwuuuct.fsf@kamboji.qca.qualcomm.com> <5751AE44.8050607@candelatech.com>
 <87oa7iut9x.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5751B480.2060106@candelatech.com>
Date: Fri, 3 Jun 2016 09:46:56 -0700
MIME-Version: 1.0
In-Reply-To: <87oa7iut9x.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>

On 06/03/2016 09:33 AM, Valo, Kalle wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>>>> Is it possible to upgrade CT firmware to 10.2 WMI/HTT interfaces?
>>>
>>> That's a good idea. That shouldn't be too hard, right? I don't think HTT needs
>>> any changes, but for WMI few commands and ids need to be changed.
>>
>> I was thinking the 10.2 mgt-over-htt API would be trouble-some to make work on
>> 10.1 firmware.
>
> Yeah, that would be harder. But I don't see Rajkumar removing support
> for that (yet) or am I missing something?

What I mean is that to just make my 10.1 firmware act like 10.2 would require
my 10.1 to suddenly support 10.2's mgt-over-htt.  I think that will be difficult,
and there is plenty of risk that some subtle WMI change would cause hard-to-detect
bugs.

I have done an initial port of my 10.1 changes to 10.2, it is just that the
result is poor, and so I quit messing with 10.2 and re-focussed on 10.1
for the time being.

Another way to help with this problem in general is to quit adding so many
new firmware API.  It is a lot easier to make a new firmware backwards compat
than it is to make an old firmware forwards compat.  When you are designing your
WMI changes in new firmware, do it with care, and then you can reuse the vast bulk
of your driver.  I managed to add quite a few new features to my 10.1 in this
manner, and the driver patches (mostly keyed off of feature flags) are not that
invasive.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
