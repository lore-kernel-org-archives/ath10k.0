Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x232.google.com ([2607:f8b0:4002:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzMAZ-00039O-4N
 for ath10k@lists.infradead.org; Thu, 19 Nov 2015 10:10:25 +0000
Received: by ykfs79 with SMTP id s79so102922328ykf.1
 for <ath10k@lists.infradead.org>; Thu, 19 Nov 2015 02:09:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <trinity-4c2e549c-06f4-4928-89eb-6ec669ff3681-1447860514624@3capp-gmx-bs61>
References: <trinity-4c2e549c-06f4-4928-89eb-6ec669ff3681-1447860514624@3capp-gmx-bs61>
Date: Thu, 19 Nov 2015 11:09:57 +0100
Message-ID: <CACKGw+Fw=9EZAM1SxWcF612s=OePH0sKPc7fUywjJ=6r9yVovw@mail.gmail.com>
Subject: Re: QCA6174 hw2.1 Firmware crash when connecting to a 5GHz network
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Roman Bange <mofasofa123@gmx.de>
Cc: ath10k <ath10k@lists.infradead.org>

On 18 November 2015 at 16:28, Roman Bange <mofasofa123@gmx.de> wrote:
> Hey,
>
> im getting a firmware crash when i try to connect to a 5GHz network.
> I tested the older firmware WLAN.RM.1.1-00141, which is now provided in linux-firmware, and SW_RM.1.1.1-00157-QCARMSWPZ-1, which is provided by you in ath10k-firmware.
>
> SW_RM.1.1.1-00157-QCARMSWPZ-1 didn't crash but i wasn't able to connect either.
>
> In addition i tested a solution that worked for me with the 4.1 Kernel where i extracted the firmware out of the windows driver (and can be found here (https://github.com/sumdog/ath10k-firmware). This solution didn't worked for me too.
>
> I tested the firmware with 4.2.0-16 under Ubuntu, but experienced the same problem with the stable releases 4.2.6 and 4.3 too. I have not tested the 4.4-rc1 Kernel yet because its not compilable with the Ubuntu packages.

The firmware crash you experience with "older" firmwares got fixed in
the 000157.
It's most likely related with wrong txbf capability advertisement,
which your card (and firmware for it) does not support.

May I ask what AP you test with?

> I attached the related dmesg logs to this mail.

When you use the 000157 firmware you can see there's a successful
auth/assoc seq. but later on for some reason there's a local deauth
triggered.

[   58.966382] wlp3s0: authenticate with f0:7f:06:2a:44:2d
[   59.008957] wlp3s0: send auth to f0:7f:06:2a:44:2d (try 1/3)
[   59.009546] wlp3s0: authenticated
[   59.014268] wlp3s0: associate with f0:7f:06:2a:44:2d (try 1/3)
[   59.019139] wlp3s0: RX AssocResp from f0:7f:06:2a:44:2d (capab=0x11
status=0 aid=6)
[   59.022291] wlp3s0: associated
[   59.022324] IPv6: ADDRCONF(NETDEV_CHANGE): wlp3s0: link becomes ready
...
[   62.130412] wlp3s0: deauthenticating from f0:7f:06:2a:44:2d by
local choice (Reason: 3=DEAUTH_LEAVING)

And these steps repeat in your log.

Could you try to connect with the AP w/o the network manager (using
wpa_supplicant / wpa_cli directly)?

> Best regards,
> Roman
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
