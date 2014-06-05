Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wsa3D-0000qb-Ey
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 15:57:59 +0000
Message-ID: <53909372.1040707@candelatech.com>
Date: Thu, 05 Jun 2014 08:57:38 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com> <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com> <538CB782.1000509@candelatech.com>
 <538CC68C.10808@gmail.com> <538CC949.5020901@candelatech.com>
 <CANUX_P2vbKD3zkwE=DvJJWpo=gEMORCBy=XFoC2YSFpmg9sr_A@mail.gmail.com>
 <538CD507.1050803@candelatech.com> <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnu7pqe2.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Emmanuel Grumbach <egrumbach@gmail.com>

On 06/05/2014 04:06 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> On 06/02/2014 12:29 PM, Emmanuel Grumbach wrote:
>>
>>> Different TLV based binary blobs concatenated. The actual encoding of
>>> each of them is another story.
>>
>> Should we try to make the 'Type' in TLV be consistent as convenient
>> across different drivers?  That might someday help auto-reporting
>> tools?
> 
> I don't see the need for that as all firmwares are so different anyway.
> As long as there's some magic string to recognize/verify for which
> firmware it is we should be ok.
> 
>> It does not resolve my interest in firmware logs interleaved with
>> kernel logs and possibly supplicant, however.
>>
>> Looks like trace-cmds could do that, but it will not be
>> running for normal users when they experience crashes.
>>
>> Any suggestions other than printk for this feature?
> 
> Why do you want to put the crash dump in kernel log, can you describe
> your "use case" here? For me it would be enough to have a UUID for each
> crash dump and then have the driver print that to kernel log:
> 
> ath10k: firmware crashed (uuid 1234567890-4321)
> 
> And then you just need to find the correct dump from the file system and
> start debugging. Would that be enough for you?

Not all systems will have fancy user-space able to deal with this.

At the very least, please leave in the current firmware crash
dump text.  That is enough to get a backtrace out of the firmware
most of the time, and almost every system that has any ability
to be debugged at all will be able to capture that text from
a kernel log file.

I like the printk for the same reason you like the trace:  It shows
things interleaved with other messages, and it is 'always on' unlike
trace, which has to be manually enabled and will not be running by default
on user's systems.

That said, I think there is no need to argue further on this.  Let's
get the debugfs dump stuff working, and maybe it will be good
enough.  It will certainly be better that what is currently
upstream.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
