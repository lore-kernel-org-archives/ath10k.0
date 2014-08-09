Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFzYb-0005er-1A
 for ath10k@lists.infradead.org; Sat, 09 Aug 2014 05:51:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5 0/7] ath10k: firmware crash dump
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <53E541E6.50707@candelatech.com>
Date: Sat, 9 Aug 2014 08:50:36 +0300
In-Reply-To: <53E541E6.50707@candelatech.com> (Ben Greear's message of "Fri, 8
 Aug 2014 14:32:22 -0700")
Message-ID: <87lhqyw6s3.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> On 08/08/2014 01:28 PM, Kalle Valo wrote:
>> Hi,
>> 
>> here's my reworked Ben's patchset adding firmware crash dump support to ath10k.
>> Unfortunately this crashes when reading the stack dump from the firmware but
>> time run out for me to fix that and I wanted to send this for comments anyway.
>> 
>> I did quite a lot of changes, basically to simplify the code, remove ifdefs and
>> so on. Here's some sort of list what I did:
>> 
>> * dump_data->tv_sec and tv_nsec to 64 bits (because long can be 32 bits
>>   on some platforms)
>
> I did u32 on purpose because I know how to do ntohl, htonl if I need
> to flip the machine order in user-space.

On my 32-bit box I got a compiler warning for this and that's why I
changed it to u64.

> Is there something similar for 64-bit numbers?

At least I haven't heard anything. But it should be easy to implement on
your own.

>> * latest crash dump is always stored (instead of the oldest unread)
>
> At least with the kernel, the first crash is normally the most useful,
> so I figured the same would be true of the firmware (a firmware crash
> is excellent way to find hidden bugs in the driver, so upon crash/reload,
> it is more likely that the driver will be screwed up and thus mis-configure
> firmware...)

Think of an AP with 3 month uptime where firmware crashes once in June
and second time in August and when you retrieve the crash dump you get
the one from June. I find that very unintuitive.

I think in your use case we should have a tool which stores all crash
dumps based on events from the kernel, that way you have access to all
of them. But for the simple case we should just provide the latest dump.

>> * atomic allocation in ath10k_pci_dump_dbglog() is bad. Should we
>>   allocate a big buffer with vmalloc and use that?
>
> dbglog entries are probably never going to be large, they are currently
> in the 2k range, so vmalloc is likely overkill.

But what would be the downside from using vmalloc? This is not in
hotpath or anything like that. With vmalloc we don't need to worry about
using precious unfragmented memory.

> If you want it allocated at startup, just choose a 4k buffer size, can
> put the buffer right in the debug struct or something like that so you
> don't even have more memory management to deal with. It will waste 4k
> of RAM for normal use, however.

Ok. But I think we can leave this as is and fix it later.

>> * what should ath10k_fw_error_dump_open() do if firmware hasn't
>>   crashed? check crashed_since_read and return zero len file? or an
>>   error code? -ENOMSG?
>
> Maybe a mostly empty crash log with just the header, should be easy enough
> to figure out it's not really a crash.  If we use udev to gather these,
> it is likely to be stupid shell scripts doing a lot of the work, so
> being clever on return codes might not be helpful.

But with cp in that case you also get an empty file, right? That way
it's easy to detect that there's no crash dump available.

What is the benefit from providing an empty header to user space? I
don't get that.

>> * should the crash dump file actually be in little endian? would that
>>   be easier/simpler?
>
> I think it is about the same amount of work in user-space, so I'd
> keep the kernel simple and dump in the CPU's endian-ness.  I don't
> care that much either way, however.

I don't care much either. But IIRC Michal suggested something like that.

>> * should ath10k_pci_hif_dump_area() hold the lock all the time? That
>>   way we would guarantee that changes to ath10k_fw_crash_data are
>>   atomic.
>
> I don't think it's worth trying to do that.

Thought more about this and I think we need it. Otherwise we have a
theoretical race that uuid and the dumpt content are from separate
crashes. I'll take a look if there's anything preventing do all the
dumps in atomic context.

> I'll go dig through the patches in a bit..have to figure out why systemd
> is fcked up on my lab machine first. :P

But wasn't systemd supposed to fix all of our problems? ;)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
