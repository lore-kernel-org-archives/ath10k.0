Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WsVHF-0004dg-Ta
 for ath10k@lists.infradead.org; Thu, 05 Jun 2014 10:52:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Firmware debugging patches?
References: <53891ACD.7070902@candelatech.com>
 <87wqczz3h9.fsf@kamboji.qca.qualcomm.com>
 <538CA904.4000508@candelatech.com>
 <87ioojz1b1.fsf@kamboji.qca.qualcomm.com>
 <538CB782.1000509@candelatech.com>
Date: Thu, 5 Jun 2014 13:51:43 +0300
In-Reply-To: <538CB782.1000509@candelatech.com> (Ben Greear's message of "Mon, 
 2 Jun 2014 10:42:26 -0700")
Message-ID: <87k38vpr28.fsf@kamboji.qca.qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Hi,

sorry for jumping in late, I get too much email as usual :/

Ben Greear <greearb@candelatech.com> writes:

> [Good stuff snipped, adding linux-wireless as this is a more
> general issue if we are going to consider general framework]
>
>
> Maybe we should start with goals before getting to implementation
> details.  Here's my wish list that is ath10k specific, but probably
> similar to other firmware users:
>
> 1)  We need the firmware crash text currently printed to
> /var/log/messages.
>
> 2)  It would be nice to get the firmware RAM and stack dumps at time of
> crash to debug more interesting crashes.
>
> 3)  It would be nice to know about firmware debug messages for
> the period of time directly before the crash (maybe 2-5 minutes?)
>
> 4)  It would be nice to have this interleaved with kernel, supplicant,
> and related logs.

I would add:

5) A generic user space interface so that the same user space tool can
   store firmware crash dumps from all wireless drivers and no need to
   reinvent the wheel.

> If we are storing crashes for something like ethtool to report, we need
> RAM and/or disk storage so the firmware RAM dumps and such can be stored until
> the user and/or automated tools ask for them.  We need some way to automatically
> clean up old crashes so disk/ram is not overly utilized.  For APs,
> they are low on both RAM and 'disk', so storing crash logs for any
> length of time may be problematic.

I think most, if not all, wireless drivers store the firmware binary in
RAM forever. I'm having hard time to believe that storing one instance
(the latest one) of firmware crash dump would make any difference.
That's why I'm not worried about RAM usage.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
