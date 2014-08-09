Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG9sL-00057P-Uc
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 16:52:14 +0000
Message-ID: <53E651A5.2030500@candelatech.com>
Date: Sat, 09 Aug 2014 09:51:49 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/7] ath10k: firmware crash dump
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <53E541E6.50707@candelatech.com> <87lhqyw6s3.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87lhqyw6s3.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org



On 08/08/2014 10:50 PM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
>
>> On 08/08/2014 01:28 PM, Kalle Valo wrote:
>>> Hi,
>>>
>>> here's my reworked Ben's patchset adding firmware crash dump support to ath10k.
>>> Unfortunately this crashes when reading the stack dump from the firmware but
>>> time run out for me to fix that and I wanted to send this for comments anyway.
>>>
>>> I did quite a lot of changes, basically to simplify the code, remove ifdefs and
>>> so on. Here's some sort of list what I did:
>>>
>>> * dump_data->tv_sec and tv_nsec to 64 bits (because long can be 32 bits
>>>    on some platforms)
>>
>> I did u32 on purpose because I know how to do ntohl, htonl if I need
>> to flip the machine order in user-space.
>
> On my 32-bit box I got a compiler warning for this and that's why I
> changed it to u64.

Casting could have fixed that I imagine.

>> Is there something similar for 64-bit numbers?
>
> At least I haven't heard anything. But it should be easy to implement on
> your own.

Sure...it's not a big deal, likely there will be at most two different apps
that ever decode this anyway (mine and qca's).


>>> * latest crash dump is always stored (instead of the oldest unread)
>>
>> At least with the kernel, the first crash is normally the most useful,
>> so I figured the same would be true of the firmware (a firmware crash
>> is excellent way to find hidden bugs in the driver, so upon crash/reload,
>> it is more likely that the driver will be screwed up and thus mis-configure
>> firmware...)
>
> Think of an AP with 3 month uptime where firmware crashes once in June
> and second time in August and when you retrieve the crash dump you get
> the one from June. I find that very unintuitive.

AP should have gathered the crash the first time, but again, not a big deal,
as I would gather the crash logs as soon as they happen anyway.

>>> * what should ath10k_fw_error_dump_open() do if firmware hasn't
>>>    crashed? check crashed_since_read and return zero len file? or an
>>>    error code? -ENOMSG?
>>
>> Maybe a mostly empty crash log with just the header, should be easy enough
>> to figure out it's not really a crash.  If we use udev to gather these,
>> it is likely to be stupid shell scripts doing a lot of the work, so
>> being clever on return codes might not be helpful.
>
> But with cp in that case you also get an empty file, right? That way
> it's easy to detect that there's no crash dump available.
>
> What is the benefit from providing an empty header to user space? I
> don't get that.

An empty file could be any sort of error or mis-configuration
...but an empty header means the infrastructure is working properly.

I think with all of this, it mostly a matter of opinion, and whatever
you choose should be fine with me.  If we find any serious issues, we
can of course fix it later.

>> I'll go dig through the patches in a bit..have to figure out why systemd
>> is fcked up on my lab machine first. :P
>
> But wasn't systemd supposed to fix all of our problems? ;)

On Fedora 19, the latest update forgot how to enable/disable programs.  It must
have a zero-regression-test policy as well as it's other issues :P

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
