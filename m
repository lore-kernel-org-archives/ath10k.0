Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fpGQx-00022Q-OW
 for ath10k@lists.infradead.org; Mon, 13 Aug 2018 17:15:13 +0000
Received: by mail-lj1-x242.google.com with SMTP id j19-v6so13172726ljc.7
 for <ath10k@lists.infradead.org>; Mon, 13 Aug 2018 10:15:00 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id j64-v6sm3425850lfe.56.2018.08.13.10.14.56
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Aug 2018 10:14:58 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id l15-v6so13160838lji.6
 for <ath10k@lists.infradead.org>; Mon, 13 Aug 2018 10:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180810233948.144792-1-briannorris@chromium.org>
 <5B6F2A47.7070502@broadcom.com>
In-Reply-To: <5B6F2A47.7070502@broadcom.com>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 13 Aug 2018 10:14:44 -0700
Message-ID: <CA+ASDXOeybJAsWJtVBdLdQ=6xThJja5MaEoa3dERKZ-shkbDkg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: retrieve MAC address from firmware if provided
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, govinds@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

On Sat, Aug 11, 2018 at 11:26 AM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 8/11/2018 1:39 AM, Brian Norris wrote:
> > Devices may provide their own MAC address via system firmware (e.g.,
>
> You got me confused by using just "firmware" in the subject.

Yeah...I started by writing this patch with device tree specifically
(of_get_mac_address()), and then later found that there were generic
"device" helpers for this, which can assist with other sorts of
firmware nodes. It was easier to put a name on a device tree patch
than on a "device" patch. I suppose "system firmware" might be a
better description?

> > device tree), especially in the case where the device doesn't have a
> > useful EEPROM on which to store its MAC address (e.g., for integrated
> > Wifi).
> >
> > Use the generic device helper to retrieve the MAC address, and (if
> > present) honor it above the MAC address advertised by the card.
>
> But this put me back on track ;-)

Let me know if you have a better way to clarify. I can resend with a
slightly modified subject (s/firmware/system firmware/), or let Kalle
do it, if that's the only thing to change.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
