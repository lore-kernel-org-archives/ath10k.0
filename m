Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bDhKj-0006AM-Lp
 for ath10k@lists.infradead.org; Fri, 17 Jun 2016 00:08:26 +0000
Subject: Re: Unicast packets stop being transmitted to a particular station,
 under load, when WPA2 is enabled
References: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
 <53703B61.3050305@candelatech.com>
 <CAHqTa-3Rj-=4A3BoQoD0fb7P=jDd53KvGjxW_BnkoF_+hdWW5g@mail.gmail.com>
 <877g57bl9a.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57633DF3.3070009@candelatech.com>
Date: Thu, 16 Jun 2016 17:01:55 -0700
MIME-Version: 1.0
In-Reply-To: <877g57bl9a.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Avery Pennarun <apenwarr@gmail.com>

On 05/27/2014 02:53 AM, Kalle Valo wrote:
> Hi Avery,
>
> Avery Pennarun <apenwarr@gmail.com> writes:
>
>> On Sun, May 11, 2014 at 11:09 PM, Ben Greear <greearb@candelatech.com> wrote:
>>> Can you reproduce with any other type of station
>>> device?
>>
>> I'll try.  It's a little tricky since it seems to involve running
>> Chrome, etc, rather than my usual command-line tests for which I have
>> a wider variety of clients.
>
> did you have a chance to check with other clients? It would be good to
> know if this is macbook specific interoparibility problem or something
> else.
>

So, to resurrect an ancient thread....

I have a user (who wants to buy and sell lots and lots of QCA chipset NICS!)
of my 10.1 firmware hitting this problem.  They have a way to reproduce
it readily, though for one reason or another, I cannot reproduce it locally using what
should be an identical setup.

Their problem cannot be reproduced in a stock 10.2 firmware (firmware-3.bin, I think) on a newer kernel,
while that newer kernel does hit the problem with my 10.1 firmware.  So, it is
definitely something in the firmware.  Their system cannot use 10.2 firmware
at the moment because it is based on an older kernel.

So, I am curious if someone would like to give me a hint as to what was the actual
firmware fix for this issue.  I don't need code snippets since that stuff is
private...but just a method name and/or file or something and I should be able
to track it down and backport just that fix.  I've tried comparing obvious code
spots in 10.1 and 10.2 firmware, but nothing obvious jumps out.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
