Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-f173.google.com ([74.125.82.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnPU4-0006xP-0d
 for ath10k@lists.infradead.org; Thu, 22 May 2014 09:40:22 +0000
Received: by mail-we0-f173.google.com with SMTP id u57so3184993wes.4
 for <ath10k@lists.infradead.org>; Thu, 22 May 2014 02:39:57 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 22 May 2014 02:39:56 -0700
Message-ID: <CAJ+vNU23qE-H0cp9fGams0h3xVJqNJQKNgX-2r0mPiV8ioz_rA@mail.gmail.com>
Subject: help troubleshooting low throughput
From: Tim Harvey <tharvey@gateworks.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Greetings,

I could use some help troubleshooting a low throughput issue. I'm
currently using the following:
 - UNEX DAXA-O1 11ac/n/a 3x3 MIMO qca988x hw2.0
http://www.unex.com.tw/product/daxa-o1
 - 80MHz channel w/o local interference
 - ath10k git 0dbbb028a7c461777bf4a0d53780e539e6f40e14 (May 16)
 - up-to-date git of hostapd/wpa_supplicant/iw
 - fw 10.1.467.2-1 api 2 htt 2.1
 - infrastructure mode using
http://wireless.kernel.org/en/users/Drivers/ath10k/configuration#Full_hostapd_configuration

I'm using iperf for throughput tests and getting no more than 220mbps
best case, typically more like 120mbps. The rx bitrate bounces around
MCS 5 to 8 and shows 3 spatial streams so I would be expecting a much
higher throughput. The cards are in boards with a quad-core ARM 1GHz
Cortex-A9 CPU and there is no indication the system is bottle-necked.
There are no other kernel modules loaded other thank
ath10k_pci/ath10k_core/ath and debugging is disabled.

Using tcpdump/wireshark to inspect the radiotap headers I only see
packets with 'Antenna: 0' - Does this field indicate what transmitter
the pkt was received on and indicate I'm only receiving from a single
transmitter?

I've noticed 'iw phy0 info' shows 'Available Antennas: TX 0 RX 0' and
any attempt to set the antenna mask with 'iw phy set antenna' fails
with an 'Operation not supported (-95)' - does this indicate an issue
with ath10k, iw, or perhaps the card's EEPROM?

I've also noticed that 'iw wlan0 station dump' statistics show in the
rx bitrate stat that sometimes SGI is flagged and sometimes its not -
should I expect this to change like this? I was under the impression
that was a static configuration.

Thanks,

Tim

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
