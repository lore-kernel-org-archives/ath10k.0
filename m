Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-f173.google.com ([209.85.217.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Ibp-0000J9-D7
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 18:46:49 +0000
Received: by mail-lb0-f173.google.com with SMTP id p9so1873291lbv.4
 for <ath10k@lists.infradead.org>; Mon, 21 Jul 2014 11:46:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Mon, 21 Jul 2014 11:46:03 -0700
Message-ID: <CALCETrXwiNFyX0XBFTuugzD3qoMzMgR29BU0MJF5-r=7emuFmw@mail.gmail.com>
Subject: Re: ath10k tx to a Macbook Pro stalls
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Mon, Jul 21, 2014 at 11:31 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Andy Lutomirski <luto@amacapital.net> writes:
>
>> On my Archer C7 v2, as soon as the MBP tries to do something like
>> playing a video, it seems like frames *to* the MBP no longer get
>> there.  At the very least, arp replies don't get there.
>
> A multicast problem? Can you run for example 'arping -b <macbook's ip>'
> to check if multicast stops working at some point? What if you hardcode
> the ARP address, do unicast packets go to the macbook still?

I thought that ARP replies were unicast.  Certainly my laptop replies
to ARP requests with a unicast frame to the requester.

I was also unable to ping the MBP from my laptop, which suggests that
broadcasts were also not being received.  But I could have gotten
confused there.

>
> If there are multicast problems, my first suspect is always power save.
> Is there a way to disable power save on the macbook for narrowing down
> the problem?

No clue.  I'll take a look.

>
> Also we had discussion about macbook problems before and aggreation came
> up as one suspect. Now we have a debugfs interface to change aggregation
> settings, but I doubt openwrt has that yet. Check the archives for more.

This problem seems to be sporadic enough that it's hard to tell, but
changing the AP's mode from VHT80 to HT40 seems to have solved the
problem.

I'll try to reproduce this later tonight and see if I can learn more.

--Andy

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
