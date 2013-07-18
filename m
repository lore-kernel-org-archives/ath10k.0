Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22b.google.com ([2a00:1450:4008:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UzgWL-0000E6-Vc
 for ath10k@lists.infradead.org; Thu, 18 Jul 2013 05:12:54 +0000
Received: by mail-bk0-f43.google.com with SMTP id jm2so1020294bkc.30
 for <ath10k@lists.infradead.org>; Wed, 17 Jul 2013 22:12:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51E70AB4.7080307@candelatech.com>
References: <51E70AB4.7080307@candelatech.com>
Date: Thu, 18 Jul 2013 07:12:26 +0200
Message-ID: <CA+BoTQk5GtWzmZA=TJqk4dWnMmEqC5fQJGkGguYsuLpTCca0mw@mail.gmail.com>
Subject: Re: ath10k: Firmware crash after removing VAP
From: Michal Kazior <michal.kazior@tieto.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Hi Ben,

On 17 July 2013 23:20, Ben Greear <greearb@candelatech.com> wrote:
> I had vap1 on an ath10k NIC, and wlan2 also existed.  I deleted
> the vap1, and very shortly afterwords, the firmware crashed:
>
> ath10k: firmware crashed!
> ath10k: hardware name qca988x hw2.0 version 0x4100016c
> ath10k: firmware version: 1.0.0.636
> ath10k: target register Dump Location: 0x00401930
> ath10k: target Register Dump
> ath10k: [00]: 0x4100016C 0x00000000 0x0098EEF0 0x00000000
> ath10k: [04]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [08]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [12]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [16]: 0x00000000 0x00000000 0x00000000 0x0098EEF0
> ath10k: [20]: 0x00000000 0x00401930 0x00000000 0x00000000
> ath10k: [24]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [28]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [32]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [36]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [40]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [44]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [48]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [52]: 0x00000000 0x00000000 0x00000000 0x00000000
> ath10k: [56]: 0x00000000 0x00000000 0x00000000 0x00000000

This dump looks suspicious. Are you using vanilla kernel or do you
have a ath regulatory hack patch from OpenWRT applied? If so the
channel scan list is not sent to the firmware and this will cause
firmware to crash.


> Kernel is 3.11.0-rc1+
>
>
> Is there any way short of reboot to recover from firmware
> crash currently?

I've posted some patches recently and are currently under review. You
can try applying them yourself and test it.

http://lists.infradead.org/pipermail/ath10k/2013-July/000023.html
http://lists.infradead.org/pipermail/ath10k/2013-July/000035.html


Pozdrawiam / Best regards,
Micha=B3 Kazior.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
