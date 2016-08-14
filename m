Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bYo7l-0007nL-2r
 for ath10k@lists.infradead.org; Sun, 14 Aug 2016 05:38:18 +0000
Received: by mail-wm0-x22e.google.com with SMTP id f65so41060556wmi.0
 for <ath10k@lists.infradead.org>; Sat, 13 Aug 2016 22:37:55 -0700 (PDT)
MIME-Version: 1.0
From: Andy Strohman <andy@uplevelsystems.com>
Date: Sat, 13 Aug 2016 22:37:53 -0700
Message-ID: <CAAGQ2nRKdtPiP0Bvz+P275HTjh56Lbkwfu20vnifvixzh=chsA@mail.gmail.com>
Subject: QCA988X firmware 10.1 and Broadcom stations
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

Sorry, I meant to say 10.1 in the subject.  So the pings I described
break traffic with the 10.1 firmware.   I never tested 10.2, but I am
currently evaluating 10.2.4(firmware-5.bin_10.2.4.70.54).

Andy


On Fri, Aug 12, 2016 at 7:26 PM, Andy Strohman <andy@uplevelsystems.com> wrote:
> Hello,
>
>   I have an issue with what seems to be an interoperability problem
> between the 10.2 firmware and Broadcom stations.
>
>   The symptoms look similar to what you guys were discussing in the
> thread with subject:  "Unicast packets stop being transmitted to a
> particular station."
>
> I have two machines that can reproduce the issue consistently:
>
> 1)Dell Latitude E6400 with a Broadcom BCM432b / BCM32056000 chipset.
> (The Dell Wireless 1510 Wireless-N WLAN Mini-Card Rev 4.06). The
> driver version is 5.100.245.200 and the date of the driver is
> 3/14/2012.
>
> 2)MacBook Pro (Retina, 13-inch, Early 2015).  Broadcom 4360
>
> All I need to do is ping the BCM station using a DSCP value that maps
> to the higher of the two tids in an AC.  After this, packets with the
> lower of the two tids will no longer be accepted, even though I see an
> ACK for the packet.
>
> This applies to all ACs.  So,
> ping -Q 96 stops all tid 0 traffic
> ping -Q 64 stops all tid 1 traffic
> ping -Q 160 stops all tid 4 traffic
> ping -Q 224 stops all tid 6 traffic
>
> I cannot get the larger of the two tids(per AC) to drop.
>
> Given this behavior, I think what is happening is that BCM has one PN
> counter per AC.  I noticed that 10.2 firmware appears to use one PN
> counter per tid where the most significant byte of the PN is the tid.
>  So when a packet with the larger of the two tids is transmitted from
> QCA to BCM(with it's larger most significant byte in the CCMP PN), the
> BCM counter for the whole AC gets set to this PN.   Then later, when a
> packet is received with the smaller of the two tids(with smaller MSB)
> it is dropped because BCM considers it a replay attempt.
>
> I see that QCA sets the RSN PTKSA Replay Counter capabilities to 16,
> while BCM sets to 1.  Although, I do not know what the expected
> outcome of this is supposed to be.  It's seems like BCM decides to use
> 4 - one per AC.  I also don't know how 8 tids are supposed to be
> mapped to 16 PN counters.  Any insight into this would be appreciated.
>
> I noticed with 10.2.4 that  RSN PTKSA Replay Counter capabilities is
> still set to 16.   However, instead of having a separate counter for
> each tid, there appears to be a single counter, which prevents this
> issue from consistently occurring.
>
> I intend to move to the 10.2.4 firmware to get away from this problem.
> However, with 10.2.4, I have witnessed problems where certain tids do
> not make it though while others do.  Unfortunately, last time it
> happened, I did not understand as much about this issue as I do now,
> so I did not test/observe as thoroughly as I wished I would have.
>
> Any help/insight would be much appreciated.
>
> Thanks,
>
> Andy

-- 
http://www.uplevelsystems.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
