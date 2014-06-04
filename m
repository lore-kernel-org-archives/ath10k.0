Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x22e.google.com ([2607:f8b0:4003:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsGnB-0004Yj-K1
 for ath10k@lists.infradead.org; Wed, 04 Jun 2014 19:24:10 +0000
Received: by mail-oa0-f46.google.com with SMTP id g18so8373325oah.5
 for <ath10k@lists.infradead.org>; Wed, 04 Jun 2014 12:23:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <538CD507.1050803@candelatech.com>
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
 <538CB782.1000509@candelatech.com> <538CC68C.10808@gmail.com>
 <538CC949.5020901@candelatech.com>
 <CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>
 <538CD507.1050803@candelatech.com>
Date: Wed, 4 Jun 2014 22:23:47 +0300
Message-ID: <CANUX_P1iaTtFccraAF_p1dFZ3SJFpdNfF=i=eAVXP8yM3GrM4A@mail.gmail.com>
Subject: Re: Firmware debugging patches?
From: Emmanuel Grumbach <egrumbach@gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

>
>>>>> a) Normal Fedora/Ubuntu/etc default-installed distribution user
>>>>> with ath10k NIC has wifi issues, firmware crashes, they don't
>>>>> really know what firmware means or that it crashed, but some automated crash-log
>>>>> tool notices and gathers debug info for automated bug reporting.
>>>>
>>>> I am working on that for our firmware. I recently added such capability relying on udev to notify the userspace that something bad happens. I gather all the data and prepare a binary file that is sent through debugfs (pulled by a script triggered by udev). I remember the first crash only.
>>>
>>> How is this binary blob encoded?
>>
>> Different TLV based binary blobs concatenated. The actual encoding of
>> each of them is another story.
>
> Should we try to make the 'Type' in TLV be consistent as convenient
> across different drivers?  That might someday help auto-reporting tools?
>
> Do you have a link to your patch that defines the types you used?
>

Take a look at 1bd3cbc1a0e9ed977a6bd470c5bc7bd36fd87e26.
But I am adding more and more content to this file.

>>> At least for drivers that can recover from firmware crashes, I think
>>> we should continue to report crashes, not just the first.
>>>
>>
>> I remember the first until udev kicks the script that will empty the
>> buffer. Then I take the second crash's log.
>
> Sounds good enough to me.
>
>>> Maybe could store another one after initial crash has been read
>>> and 1 minute has elapsed, or if initial crash has not been read
>>> in 1 day, or something like that.
>>>
>>> Also, if we use debugfs then we require upstream kernels to have this
>>> compiled in and mounted if we want to handle this class of user.
>>
>> Agreed. I rely on debugfs. But this is "just" the way to reach the filesystem.
>> Give me another way and I am fine with it.
>> FWIW Ubuntu which is not exactly the distribution of the super
>> advanced users has it mounted by default.
>
> That sounds promising...Looks like Fedora 20 does as well, so maybe
> debugfs will be good enough for crash dumps.
>
>
> It does not resolve my interest in firmware logs interleaved with
> kernel logs and possibly supplicant, however.
>
> Looks like trace-cmds could do that, but it will not be
> running for normal users when they experience crashes.
>
> Any suggestions other than printk for this feature?

I seems you found a way already :)

>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
