Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrVIA-0004rZ-TK
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 16:40:59 +0000
Message-ID: <538CA904.4000508@candelatech.com>
Date: Mon, 02 Jun 2014 09:40:36 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
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

On 06/02/2014 09:21 AM, Kalle Valo wrote:
> Ben Greear <greearb@candelatech.com> writes:
> 
>> I have a bunch of patches that can dump some firmware debug logs,
>> stack, and exception stacks as ascii hex. Ath10k firmware-having folks
>> can use private tools to extract and decode useful info from this.
> 
> You mean via printk? That sounds ugly.

It is fairly ugly, but it is easy to ask someone to just email you
a snippet of /var/log/messages.  I am certainly open to suggestions
for how to do it better.

And, even if it is ugly, hopefully the firmware crashes will become
more rare and so most folks won't see so much of this.

> There was talk on linux-wireless about how to handle firmware crash
> dumps in a generic way. One proposal was to use ethtool and an event for
> this. Before that I was thinking of using trace points. Maybe we should
> support both?

I think it must not be anything that has to be turned on by users,
otherwise we will not see a lot of useful reports from any
normal-ish users, and so we will lose a great deal of coverage.

Perhaps the more verbose dump info could be disabled by default,
and enabled with a debug-level setting (which even relatively
unsophisticated, or just folks that can't be bothered to jump
through hoops) could enable on their systems.

Trace points do not meet this level of simplicity in my experience.

> We should come up with an extensible format how to provide the firmware
> crash logs to user space, for example using some TLV based format, which
> contain all the necessary information (hw details, firmware version,
> memory dumps and whatnot). But ath10k should not have any parsing of the
> dumps, that should happen in user space.

Actually decoding ath10k firmware (and probably every other close-sourced
firmware is necessarily going to be something unique for that firmware),
so aside from transporting the data to user-space, there is probably
very little that can be shared.

Also, for the ath10k debug-log WMI messages, you often need to see what
comes before the crash to be useful.  If we are printing this to logs
in ascii hex (enabled by an ath10k debug-level setting), then we can easily
get that info from /var/log/messages or equivalent.  Putting the firmware
dumps in the same file seems logical to me.  You also get to see the
context of the rest of the kernel logs, including wifi stack prints,
other kernel warnings/errors, etc.

And, I have some pretty well tested patches and user-space tools
already written to support this, so we could have this feature
in ath10k almost immediately...  I have already send my user-space
decode app to QCA, so they can freely propagate it to anyone they wish
(typically just those under NDA I assume).


So, I think that 'ugliness' of seeing a lot of ascii hex in
/var/log/messages is a fairly small price to pay.  I will post some
patches for consideration and suggestions for improvement when I get
my changes properly rebased onto your latest tree and get some
minimal testing done on the rebase...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
