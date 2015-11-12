Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway32.websitewelcome.com ([192.185.145.102])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwGX-0004pq-2V
 for ath10k@lists.infradead.org; Thu, 12 Nov 2015 18:06:35 +0000
Received: from cm1.websitewelcome.com (cm.websitewelcome.com [192.185.0.102])
 by gateway32.websitewelcome.com (Postfix) with ESMTP id 0211E3060FAC0
 for <ath10k@lists.infradead.org>; Thu, 12 Nov 2015 11:42:47 -0600 (CST)
From: "Michael Rex" <mrex@tranzeo.com>
Subject: RE: FCC Continuous TX testing
Date: Thu, 12 Nov 2015 09:42:49 -0800
Message-ID: <00d901d11d71$8d37cf50$a7a76df0$@tranzeo.com>
MIME-Version: 1.0
Content-Language: en-ca
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
To: troth@openavr.org
Cc: theodore_roth@trimble.com, ath10k@lists.infradead.org

Ted,

You mention your product uses the mPCIe card, so I'm guessing you have an
Ethernet port.  I am of the opinion that Ethernet based devices require
maximum throughput (worst case) through radio and Ethernet at maximum cat5
length (worst case) to take proper emissions measurements and that testing
with the ART tool is not correct. The ART program, intended for testing and
developing the radio modules, does not behave the same way as Ath10k or
QCA's closed driver and so the real world product behaves differently at
maximum power with multiple chains.  This results in products shipping over
the approved limits.  I see this in the lab test reports all the time.
 
I don't see many other companies exercising the Ethernet like I am
understood to believe is required, so you may need to check with your test
lab on proper test methodology (testing to the letter instead of the 'spirit
of the rules').  It certainly is harder to pass when exercising the Ethernet
and that is why I suspect this corner is cut in other vendor testing (given
the lack of filtering on the Ethernet ports in products).

Generating maximum duty throughput (ie, transmitting UDP at full size frame)
using a utility like iperf, Ixia, Smartbits, Veriwave, etc would be my
recommended method of generating the traffic.  It is slower than
transmitting null frames for the sole purpose of RF measurements, but I
think this is the true, legal way for an Ethernet based wireless device.

Best regards,
Mike


----------------------------------------------------------------------

Message: 1
Date: Tue, 10 Nov 2015 14:53:26 -0700
From: "Theodore A. Roth" <troth@openavr.org>
To: ath10k@lists.infradead.org
Cc: Theodore Roth <theodore_roth@trimble.com>
Subject: FCC Continuous TX testing
Message-ID:
	<CAFMvBt38Ld9TUpVHWD2yKSViLjN-dX4hLWXzAK9ZxoXCUr0JcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8

We are working on a product that uses an Ath10k mini-PCIe module and we are
preparing for FCC testing.

Are there any facilities in the Ath10k driver for putting the device
into continuous
transmit mode?

Between google searches and looking in the linux-4.3.y driver source,
I don't see
anything promising. I did come across the CONFIG_NL80211_TESTMODE option,
but that hasn't yielded anything (although I still have some more digging in
the
source to do there).

I did come across references to the Atheros Radio Test tool, but could
not find any
references as to how to obtain it from QCA.

I also saw references to a QCA open source NDA program, but could not find
any
links to actually join this program. Is it still active?

Any insight from those that have done FCC testing with ath10k products would
be
greatly appreciated.

Thanks.

Ted Roth



------------------------------


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
