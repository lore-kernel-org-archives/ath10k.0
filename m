Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mars.blocktrron.ovh ([2001:41d0:401:3000::cbd]
 helo=mail.blocktrron.ovh)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j48J8-0006T9-Be
 for ath10k@lists.infradead.org; Tue, 18 Feb 2020 19:13:24 +0000
Received: from [IPv6:2001:bc8:3540:20:51e2:f66e:658a:5eed] (unknown
 [IPv6:2001:bc8:3540:20:51e2:f66e:658a:5eed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id E910322F8A
 for <ath10k@lists.infradead.org>; Tue, 18 Feb 2020 20:12:59 +0100 (CET)
From: David Bauer <mail@david-bauer.net>
Subject: Management rate-control on IPQ4019
Message-ID: <20543d04-7847-8a4f-7882-78c2f42c98c0@david-bauer.net>
Date: Tue, 18 Feb 2020 20:12:59 +0100
MIME-Version: 1.0
Content-Language: en-US
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

Hello,

while playing around with the 2.4GHz WiFi part of the IPQ4019, i was 
expecting being able to set the rate at which IPQ4019 transmits it's beacon
frames.

Using OpenWrt, setting "legacy_rates=0" on the radio leads to only advertising
802.11g speeds, however the beacons are still sent out at 1 Mbit/s. Using a QCA9984,
the beacons are correctly sent out at the lowest 802.11g rate (6 Mbit/s). So i assume
this is either a bug in the ath10k firmware or a hardware-shortcoming. Has anyone else
experienced this bug and is it likely we'll see it fixed in a later firmware release?

Hardware: IPQ4029 (Aruba AP-303)
Firmware  Version: 10.4-3.6-00140 / 10.4-3.5.3-00078

Best wishes
David

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
