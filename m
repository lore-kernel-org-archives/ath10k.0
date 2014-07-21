Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9INh-0001zh-5A
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 18:32:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k tx to a Macbook Pro stalls
References: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
Date: Mon, 21 Jul 2014 21:31:47 +0300
In-Reply-To: <CALCETrUXvbhkKDAvEw+643mKZtJzcJtPGhxbo35r3h=rCMOWwA@mail.gmail.com>
 (Andy Lutomirski's message of "Mon, 21 Jul 2014 10:04:48 -0700")
Message-ID: <87vbqqwoks.fsf@kamboji.qca.qualcomm.com>
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
To: Andy Lutomirski <luto@amacapital.net>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Andy Lutomirski <luto@amacapital.net> writes:

> On my Archer C7 v2, as soon as the MBP tries to do something like
> playing a video, it seems like frames *to* the MBP no longer get
> there.  At the very least, arp replies don't get there.

A multicast problem? Can you run for example 'arping -b <macbook's ip>'
to check if multicast stops working at some point? What if you hardcode
the ARP address, do unicast packets go to the macbook still?

If there are multicast problems, my first suspect is always power save.
Is there a way to disable power save on the macbook for narrowing down
the problem?

Also we had discussion about macbook problems before and aggreation came
up as one suspect. Now we have a debugfs interface to change aggregation
settings, but I doubt openwrt has that yet. Check the archives for more.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
