Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXYXM-00083w-G0
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 16:06:13 +0000
From: "Shu, Nick" <Nick.Shu@spirent.com>
Subject: RE: wifi card disconnected right after assoicated with AP
Date: Tue, 8 Apr 2014 16:05:21 +0000
Message-ID: <153F35912E69C446A72CF7D6417EBADE7CF405@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
References: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <87ob0ckkax.fsf@kamboji.qca.qualcomm.com>
 <153F35912E69C446A72CF7D6417EBADE7CF3CF@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <87fvlnlu9h.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87fvlnlu9h.fsf@kamboji.qca.qualcomm.com>
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
Yeah, I uninstalled "network-manager" and problem solved.
Now, card can associate to AP without dropping.

Now problem moved to firmware related issue, I had a valid MAC from chip vendor but it appeared as a default MAC from event message and AP's connected device field.
It couldn't get a valid IP address from AP's DHCP.

Now, I need to work on getting new driver and firmware from backports .
Thanks again
Nick

-----Original Message-----
From: Kalle Valo [mailto:kvalo@qca.qualcomm.com]
Sent: Tuesday, April 08, 2014 10:24 AM
To: Shu, Nick
Cc: ath10k@lists.infradead.org
Subject: Re: wifi card disconnected right after assoicated with AP

Hi Nick,

"Shu, Nick" <Nick.Shu@spirent.com> writes:

> I installed Ubuntu 13.10 server that has the Linux kernel 3.11 (this
> is what I read from the info) on my test server, it should have all
> driver and firmware to support the card.

In ath10k's lifetime that's ancient. I recommend using backports to get a more recent version of ath10k:

https://backports.wiki.kernel.org/index.php/Main_Page

I would not even bother try debugging the issue until you have updated ath10k and the firmware.

> Card is a mini PCIe that has a QCA 9880 chip in it with 3x3 antenna
> configuration, made by Embedded Works.
> Access Point side is a Netgear AC1900 NightHawk. I set it up and using
> Ch153, WPA-PSK, with DHCP enabled.
>
> I'm new in Linux (worked on Windows for most time), so I'm still
> learning.

Unfortunately I can only help with ath10k specific issues, I do not have time to give general Linux support. But I can give you pointers and there are other forums which can help you better with those.

> I used "iw" and "wpa_supplicant" to control the card.
> I failed for scan command at the beginning (posted a message last week
> for help) and fixed by bring up the wlan0 interface (ip link set woan0
> up).
> Then set net key "wpa_passphrase SSID KEY"
> Start wpa with command: "wpa_supplicant -B -D nl80211 -i wlan0 -c
> /etc/wpa_supplicant.conf".
>
> I actually got the card associated with the AP but couldn't get a
> valid IP address last Friday, so I was working on getting IP address
> issue.
> Then on Monday, I logged in to server and found the card wlan0 is up
> without command "ip link set ...", also the net key was remembered and
> auto associate to AP.
> So something is taking over and doing association automatically for me
> ( I installed metwork-manager, but never use it yet).

If you run wpasupplicant manually you should disable network-manager, otherwise there will be problems. IIRC one issue might be that network-manager automatically disconnects you, which might be the issue you are having.

> You mentioned the card MAC is not a valid one? I though the vender
> should programmed a valid MAC to chip, right?

Yes, the MAC address is stored in EEPROM and the firmware reads it. But older firmwares might not support newer boards and then there will be problems in reading the EEPROM. That's why I recommend using firmware 10.1.467.2-1.

> I used "iw event -r -f" to monitor the debug message, do I have to
> enable something to get the kernel and supplicant log?

wpasupplicant has it's own debug log (-dddt) and kernel log can be read with dmesg. I recommend starting from here:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug
http://wireless.kernel.org/en/users/Documentation/wpa_supplicant

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
