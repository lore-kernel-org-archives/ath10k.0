Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrWG1-0003jP-CG
 for ath10k@lists.infradead.org; Mon, 02 Jun 2014 17:42:49 +0000
Message-ID: <538CB782.1000509@candelatech.com>
Date: Mon, 02 Jun 2014 10:42:26 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com> <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>


[Good stuff snipped, adding linux-wireless as this is a more
general issue if we are going to consider general framework]


Maybe we should start with goals before getting to implementation
details.  Here's my wish list that is ath10k specific, but probably
similar to other firmware users:

1)  We need the firmware crash text currently printed to
/var/log/messages.

2)  It would be nice to get the firmware RAM and stack dumps at time of
crash to debug more interesting crashes.

3)  It would be nice to know about firmware debug messages for
the period of time directly before the crash (maybe 2-5 minutes?)

4)  It would be nice to have this interleaved with kernel, supplicant,
and related logs.


We need a solution for different types of users.  I suspect the number
of crashes seen in the wild will be more for users nearer the top
of this list.

a) Normal Fedora/Ubuntu/etc default-installed distribution user
with ath10k NIC has wifi issues, firmware crashes, they don't
really know what firmware means or that it crashed, but some automated crash-log
tool notices and gathers debug info for automated bug reporting.

b) Slightly more advanced user actually notices the problem at coffee shop
earlier today, posts about it when they get home, and we ask for
debug info.

c) Experienced and determined user has similar issues, but is able to
reproduce the problem and/or turn on more advanced debugging efforts.

d)  Even more determined user that can and will recompile kernels and/or
try patches.


Anything that has to be enabled before-hand will not help a) and b) above.

If support is not compiled into default kernels, c) will not help you either.

If it is difficult or requires acquiring cutting edge tools not in their
distribution by default, many of c) and some of d) will just ignore the problem or use
different hardware.

If we are storing crashes for something like ethtool to report, we need
RAM and/or disk storage so the firmware RAM dumps and such can be stored until
the user and/or automated tools ask for them.  We need some way to automatically
clean up old crashes so disk/ram is not overly utilized.  For APs,
they are low on both RAM and 'disk', so storing crash logs for any
length of time may be problematic.


I am indeed biased towards using printk, but lets agree on some goals and
see if we can find a set of tools and methods that meets them.


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
