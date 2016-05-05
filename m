Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x232.google.com ([2607:f8b0:4002:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayONJ-0000Sm-3w
 for ath10k@lists.infradead.org; Thu, 05 May 2016 18:51:49 +0000
Received: by mail-yw0-x232.google.com with SMTP id t10so155624440ywa.0
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 11:51:28 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 May 2016 14:51:27 -0400
Message-ID: <CAOiRWuXoY19XvXDo+KCTYXCAK8o2BufHLKEn408XthvnuCRYyQ@mail.gmail.com>
Subject: 802.11s channel width settings?
From: Zach Sherin <zach@netblazr.com>
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

Hi all,

I'm using 802.11s to do mesh networking with ath10k on an OpenWRT
router. My throughput across the 802.11s connections is very low,
around 22 Mbits/s maximum. When I search my device with iw[1], I am
informed that the driver believes it is operating in 20MHz channels.
When I run it in AP mode, I get much faster speeds and iw claims the
interface is acting with an 80 MHz channel.

Is there any way to increase channel widths in 802.11s? If this is an
OpenWRT question and not ath10k I'll head over to the forums, but this
seemed more a driver issue as my wireless config requests wide
channels. Any chance there's a specific version of ath10k I should
push to?

Any information would be much appreciated, and I'll be happy to answer
any questions.

Thanks,
Zach

[1]iw dev mesh info

Inteface mesh
           ifindex 19
           wdev 0x2
           addr ec:08:6b:ae:51:ac
           type mesh point
           wiphy 0
           channel 36 (5180 MHz), width: 20 MHz (no HT), center1: 5180 MHz
           txpower 27 dBm

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
