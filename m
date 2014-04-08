Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXWub-0007k5-Ue
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 14:22:06 +0000
From: "Shu, Nick" <Nick.Shu@spirent.com>
Subject: RE: wifi card disconnected right after assoicated with AP
Date: Tue, 8 Apr 2014 14:20:38 +0000
Message-ID: <153F35912E69C446A72CF7D6417EBADE7CF3CF@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
References: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <87ob0ckkax.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ob0ckkax.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks, Kalle:
I installed Ubuntu 13.10 server that has the Linux kernel 3.11 (this is what I read from the info) on my test server, it should have all driver and firmware to support the card.
Card is a mini PCIe that has a QCA 9880 chip in it with 3x3 antenna configuration, made by Embedded Works.
Access Point side is a Netgear AC1900 NightHawk. I set it up and using Ch153, WPA-PSK, with DHCP enabled.

I'm new in Linux (worked on Windows for most time), so I'm still learning.
I used "iw" and "wpa_supplicant" to control the card.
I failed for scan command at the beginning (posted a message last week for help) and fixed by bring up the wlan0 interface (ip link set woan0 up).
Then set net key "wpa_passphrase SSID KEY"
Start wpa with command: "wpa_supplicant -B -D nl80211 -i wlan0 -c /etc/wpa_supplicant.conf".

I actually got the card associated with the AP but couldn't get a valid IP address last Friday, so I was working on getting IP address issue.
Then on Monday, I logged in to server and found the card wlan0 is up without command "ip link set ...", also the  net key was remembered and auto associate to AP.
So something is taking over and doing association automatically for me ( I installed metwork-manager, but never use it yet).

You mentioned the card MAC is not a valid one? I though the vender should programmed a valid MAC to chip, right?

I used "iw event -r -f" to monitor the debug message, do I have to enable something to get the kernel and supplicant log?

Thanks!
Nick


-----Original Message-----
From: Kalle Valo [mailto:kvalo@qca.qualcomm.com]
Sent: Tuesday, April 08, 2014 8:44 AM
To: Shu, Nick
Cc: ath10k@lists.infradead.org
Subject: Re: wifi card disconnected right after assoicated with AP

"Shu, Nick" <Nick.Shu@spirent.com> writes:

> I'm trying to use a wifi card to associate to a access point, but got
> a strange thing here.

What card exactly? And what version of ath10k and the firmware?

> Right after associated with AP, it disconnected from AP, the pattern repeated for:
> Scan
> Authentication
> Association
> De-authenticated
> Dis-associated
> I captured the frames as below, saw a "wlan0 del station <AP's MAC>",
> why wlan0 do this local request?

Very difficult to say based on the information you provided. How do you exactly control the STA? Using iw, wpa_supplicant, network-manager or something else?

> 0.096321: wlan0 (phy #0): scan started
> 2.802464: wlan0 (phy #0): scan finished: 2412 2417 2422 2427 2432 2437
> 2442 2447 2452 2457 2462 5180 5200 5220 5240 5260
>  5280 5300 5320 5500 5520 5540 5560 5580 5660 5680 5700 5745 5765 5785 5805 5825, ""
> 0.008130: wlan0: new station c4:04:15:29:cd:2e
> 0.000462: wlan0 (phy #0): auth c4:04:15:29:cd:2e -> 00:03:07:12:34:56
> status: 0: Successful [frame: b0 00 3c 00 00 03 07

00:03:07:12:34:56 (the default MAC address) implies that there's a problem with the calibration data. Please try with firmware 10.1.467.2-1. Do you get a proper MAC address then?

Also It would be good to see both kernel logs as well as wpasupplicant debug logs. And a sniffer capture would be preferably as well.

--
Kalle Valo
E-mail confidentiality.
--------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
26750 Agoura Road, Calabasas, CA, 91302, USA.
Tel No. 1-818-676- 2300

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
