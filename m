Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrVjZ-0006fG-3n
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 17:09:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
Date: Mon, 2 Jun 2014 20:08:50 +0300
In-Reply-To: <538CA904.4000508@candelatech.com> (Ben Greear's message of "Mon, 
 02 Jun 2014 09:40:36 -0700")
Message-ID: <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> On 06/02/2014 09:21 AM, Kalle Valo wrote:
>> Ben Greear <greearb@candelatech.com> writes:
>> 
>>> I have a bunch of patches that can dump some firmware debug logs,
>>> stack, and exception stacks as ascii hex. Ath10k firmware-having folks
>>> can use private tools to extract and decode useful info from this.
>> 
>> You mean via printk? That sounds ugly.
>
> It is fairly ugly, but it is easy to ask someone to just email you
> a snippet of /var/log/messages.  I am certainly open to suggestions
> for how to do it better.

I already gave suggestions :)

> And, even if it is ugly, hopefully the firmware crashes will become
> more rare and so most folks won't see so much of this.
>
>> There was talk on linux-wireless about how to handle firmware crash
>> dumps in a generic way. One proposal was to use ethtool and an event for
>> this. Before that I was thinking of using trace points. Maybe we should
>> support both?
>
> I think it must not be anything that has to be turned on by users,
> otherwise we will not see a lot of useful reports from any
> normal-ish users, and so we will lose a great deal of coverage.
>
> Perhaps the more verbose dump info could be disabled by default,
> and enabled with a debug-level setting (which even relatively
> unsophisticated, or just folks that can't be bothered to jump
> through hoops) could enable on their systems.

My main concern is about maintaining that functionality in ath10k, not
about dumping stuff to kernel log. With different firmware versions etc
it will become a pain to maintain that in kernel. But if we push all the
necessary information to user space we can have that complexity in user
space, which is a lot easier to maintain.

> Trace points do not meet this level of simplicity in my experience.

You should try it more. To me it's the best thing in the field of kernel
debugging for a long time.

>> We should come up with an extensible format how to provide the firmware
>> crash logs to user space, for example using some TLV based format, which
>> contain all the necessary information (hw details, firmware version,
>> memory dumps and whatnot). But ath10k should not have any parsing of the
>> dumps, that should happen in user space.
>
> Actually decoding ath10k firmware (and probably every other close-sourced
> firmware is necessarily going to be something unique for that firmware),
> so aside from transporting the data to user-space, there is probably
> very little that can be shared.

Of course. But we should have a generic interface for providing the
crash data to user space.

> Also, for the ath10k debug-log WMI messages, you often need to see what
> comes before the crash to be useful.  If we are printing this to logs
> in ascii hex (enabled by an ath10k debug-level setting), then we can easily
> get that info from /var/log/messages or equivalent.  Putting the firmware
> dumps in the same file seems logical to me.  You also get to see the
> context of the rest of the kernel logs, including wifi stack prints,
> other kernel warnings/errors, etc.

This is exactly why I push for trace points. You can have all wireless
related messages, including hostapd and firmware logs, in one file.
That's extremely convenient.

> And, I have some pretty well tested patches and user-space tools
> already written to support this, so we could have this feature
> in ath10k almost immediately...  I have already send my user-space
> decode app to QCA, so they can freely propagate it to anyone they wish
> (typically just those under NDA I assume).
>
> So, I think that 'ugliness' of seeing a lot of ascii hex in
> /var/log/messages is a fairly small price to pay.  I will post some
> patches for consideration and suggestions for improvement when I get
> my changes properly rebased onto your latest tree and get some
> minimal testing done on the rebase...

I get the feeling that you push for this only because you have worked
like this before. I still think that using printk() is not the way
forward and we should use more advanced methods for firmware logs.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
