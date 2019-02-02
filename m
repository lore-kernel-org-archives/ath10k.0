Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gplOa-0002gQ-81
 for ath10k@lists.infradead.org; Sat, 02 Feb 2019 02:51:05 +0000
Received: by mail-ed1-x544.google.com with SMTP id p6so7120657eds.0
 for <ath10k@lists.infradead.org>; Fri, 01 Feb 2019 18:51:01 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41])
 by smtp.gmail.com with ESMTPSA id e51sm2485945edd.35.2019.02.01.18.50.57
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Feb 2019 18:50:58 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id g22so7056106edr.7
 for <ath10k@lists.infradead.org>; Fri, 01 Feb 2019 18:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20190114153558.972-1-chunkeey@gmail.com>
In-Reply-To: <20190114153558.972-1-chunkeey@gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Fri, 1 Feb 2019 18:50:45 -0800
Message-ID: <CA+ASDXMvFZNcyTeuJ5_q62XW+hME41nPUoTxrafqDB94GqribA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mathias Kresin <dev@kresin.me>, Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

Hello!

On Mon, Jan 14, 2019 at 7:36 AM Christian Lamparter <chunkeey@gmail.com> wrote:
> Part of the "setting an alternate MAC" issue was already tackled by a
> patch from Brian Norris:
> commit 9d5804662ce1
> ("ath10k: retrieve MAC address from system firmware if provided")
> by allowing the option to specify an alternate MAC-address with the
> established device_get_mac_address() function which extracts the right
> address from DeviceTree/fwnode mac-address or local-mac-address
> properties and saves it for later.
>
> However, Ben Greear noted that the Qualcomm's ath10k firmware is liable
> to not properly calculate its rx-bssid mask in this case. This can cause
> issues in the popluar "multiple AP with a single ath10k instance"
> configurations.

I'll admit that
(a) I wasn't testing AP mode, or any similar configuration to this and
(b) I'm not super familiar with the firmware features involved here.

That's to say, this patch could very well be completely justified and
correct, but I may not the right person to analyze it.

I do have it on my list to test out though, so I'll hopefully chime in
again eventually.

Regards,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
