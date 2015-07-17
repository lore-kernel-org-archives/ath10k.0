Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZG6X5-0004cW-TD
 for ath10k@lists.infradead.org; Fri, 17 Jul 2015 14:22:36 +0000
Received: by oibn4 with SMTP id n4so71560848oib.3
 for <ath10k@lists.infradead.org>; Fri, 17 Jul 2015 07:22:14 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 Jul 2015 10:22:14 -0400
Message-ID: <CAJUS3XmLr0qHHRtZndkus03ueYBCPLiv=Oc=FBpowx8BYYB5WA@mail.gmail.com>
Subject: reading fw_stats: Connection timed out
From: Martin Hicks <mort@bork.org>
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

Hi,

I've been testing with QCA988x cards (PCI ID 168c:003c) and if I try
to read the fw_stats file I get "Connection timed out".  It does seem
to work on x86, but fails on PPC and MIPS.  This makes me suspect an
endianness issue somewhere.

I set debug_mask to 0x432 and when I cat fw_stats I see many, many of
the following messages:

[72975.965554] ath10k_pci 0000:01:00.0: wmi request stats 0x0000000d
[72975.965614] ath10k_pci 0000:01:00.0: WMI_UPDATE_STATS_EVENTID

followed by:

[72975.965700] ath10k_pci 0000:01:00.0: failed to request fw stats: -110

On a 32-bit powerpc Freescale CPU.  Running linux 4.1.0 kernel.

[73143.760963] ath10k_pci 0000:01:00.0: qca988x hw2.0 (0x4100016c,
0x043222ff) fw 10.2.4.48 api 4 htt 2.1 wmi 5 cal otp max_sta 128
The wireless card is running in station mode.

Any ideas on where this problem might be?  Any other information I can provide?
Thanks,
mh

-- 
Martin Hicks P.Eng.      |         mort@bork.org
Bork Consulting Inc.     |   +1 (613) 266-2296

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
