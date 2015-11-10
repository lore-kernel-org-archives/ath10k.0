Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwGrN-0004lX-9b
 for ath10k@lists.infradead.org; Tue, 10 Nov 2015 21:53:49 +0000
Received: by obdgf3 with SMTP id gf3so8260133obd.3
 for <ath10k@lists.infradead.org>; Tue, 10 Nov 2015 13:53:26 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 10 Nov 2015 14:53:26 -0700
Message-ID: <CAFMvBt38Ld9TUpVHWD2yKSViLjN-dX4hLWXzAK9ZxoXCUr0JcA@mail.gmail.com>
Subject: FCC Continuous TX testing
From: "Theodore A. Roth" <troth@openavr.org>
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
To: ath10k@lists.infradead.org
Cc: Theodore Roth <theodore_roth@trimble.com>

We are working on a product that uses an Ath10k mini-PCIe module and we are
preparing for FCC testing.

Are there any facilities in the Ath10k driver for putting the device
into continuous
transmit mode?

Between google searches and looking in the linux-4.3.y driver source,
I don't see
anything promising. I did come across the CONFIG_NL80211_TESTMODE option,
but that hasn't yielded anything (although I still have some more digging in the
source to do there).

I did come across references to the Atheros Radio Test tool, but could
not find any
references as to how to obtain it from QCA.

I also saw references to a QCA open source NDA program, but could not find any
links to actually join this program. Is it still active?

Any insight from those that have done FCC testing with ath10k products would be
greatly appreciated.

Thanks.

Ted Roth

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
