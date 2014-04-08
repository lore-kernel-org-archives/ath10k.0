Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXXsv-00050q-3A
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 15:24:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: wifi card disconnected right after assoicated with AP
References: <153F35912E69C446A72CF7D6417EBADE7CF38D@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 <87ob0ckkax.fsf@kamboji.qca.qualcomm.com>
 <153F35912E69C446A72CF7D6417EBADE7CF3CF@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
Date: Tue, 8 Apr 2014 18:23:54 +0300
In-Reply-To: <153F35912E69C446A72CF7D6417EBADE7CF3CF@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
 (Nick Shu's message of "Tue, 8 Apr 2014 14:20:38 +0000")
Message-ID: <87fvlnlu9h.fsf@kamboji.qca.qualcomm.com>
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
To: "Shu, Nick" <Nick.Shu@spirent.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi Nick,

"Shu, Nick" <Nick.Shu@spirent.com> writes:

> I installed Ubuntu 13.10 server that has the Linux kernel 3.11 (this
> is what I read from the info) on my test server, it should have all
> driver and firmware to support the card.

In ath10k's lifetime that's ancient. I recommend using backports to get
a more recent version of ath10k:

https://backports.wiki.kernel.org/index.php/Main_Page

I would not even bother try debugging the issue until you have updated
ath10k and the firmware.

> Card is a mini PCIe that has a QCA 9880 chip in it with 3x3 antenna
> configuration, made by Embedded Works.
> Access Point side is a Netgear AC1900 NightHawk. I set it up and using
> Ch153, WPA-PSK, with DHCP enabled.
>
> I'm new in Linux (worked on Windows for most time), so I'm still
> learning.

Unfortunately I can only help with ath10k specific issues, I do not have
time to give general Linux support. But I can give you pointers and
there are other forums which can help you better with those.

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

If you run wpasupplicant manually you should disable network-manager,
otherwise there will be problems. IIRC one issue might be that
network-manager automatically disconnects you, which might be the issue
you are having.

> You mentioned the card MAC is not a valid one? I though the vender
> should programmed a valid MAC to chip, right?

Yes, the MAC address is stored in EEPROM and the firmware reads it. But
older firmwares might not support newer boards and then there will be
problems in reading the EEPROM. That's why I recommend using firmware
10.1.467.2-1.

> I used "iw event -r -f" to monitor the debug message, do I have to
> enable something to get the kernel and supplicant log?

wpasupplicant has it's own debug log (-dddt) and kernel log can be read
with dmesg. I recommend starting from here:

http://wireless.kernel.org/en/users/Drivers/ath10k/debug
http://wireless.kernel.org/en/users/Documentation/wpa_supplicant

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
