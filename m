Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x235.google.com ([2607:f8b0:400c:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjfVk-0005Hi-JS
 for ath10k@lists.infradead.org; Mon, 12 May 2014 01:58:37 +0000
Received: by mail-ve0-f181.google.com with SMTP id pa12so8036388veb.12
 for <ath10k@lists.infradead.org>; Sun, 11 May 2014 18:58:14 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Sun, 11 May 2014 21:57:54 -0400
Message-ID: <CAHqTa-3YUpt3jByNxiEkPGV52CoRDS-R4W33ywKVLa-Ye9d2bQ@mail.gmail.com>
Subject: Unicast packets stop being transmitted to a particular station, under
 load, when WPA2 is enabled
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
To: ath10k <ath10k@lists.infradead.org>

Version: 3.15-rc1 and ath10k-stable-3.11-8 (both via backports to kernel 3.2.26)
Firmware: 10.1.467.2-1

Steps:
- Configure ath10k as AP on channel 149, width 80 MHz, WPA2 encryption
- Connect my 2009 macbook
- Start a ping of 8.8.8.8 in the background from my macbook
- Generate some traffic.  The trigger varies, but running uTorrent or
quickly opening a lot of background tabs in Chrome usually seems to
set it off within a couple of minutes.  iperf and isoping don't seem
to cause any trouble.

Expected:
- ping keeps pinging

Actual:
- tcpdump on the ath10k host shows ICMP requests coming in, and
responses going out.
- tcpdump on the macbook shows ICMP requests going out, but no
responses coming back.
- tcpdump -I (radiotap mode) on the macbook is a little hard to
understand since it's encrypted, but it shows some packets coming out
of the ath10k (broadcasts, I think) but no unicast packets to the
macbook.
- tcpdump on the macbook *does* show broadcast packets arriving.  For
example, ARP requests and "ping -b 192.168.1.255" (my local subnet IP
address) get through.
- Disconnecting and then reconnecting the wifi on my macbook fixes the
problem until it next triggers.
- Other STAs connected to the AP are not affected when the one STA
isn't able to communicate (although each one has the potential to
trigger the problem)

Disabling encryption makes the problem go away permanently.

This is pretty quick for me to reproduce, but unfortunately I don't
have any steps to trigger it instantly, nor any command line tools
that seem to make it happen.  (For example I tried multiple parallel
'curl' processes in a loop, and no lock.)

Nothing interesting appears in the dmesg or hostapd logs at the time
of the problem.

This sounds like it could be a problem with crypto session keys, but I
don't understand why it would only be wrong in a single direction.  I
also don't think my keys are rotating this quickly, so this shouldn't
be a key rotation problem (though I don't understand very well how
that works).

It might be my imagination, but it's possible that this triggers more
quickly if my macbook has been connected for a longer period of time
before generating the traffic burst.

Anything I can check to help narrow this down?

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
