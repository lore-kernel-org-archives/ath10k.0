Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIx4M-0006P2-A6
 for ath10k@lists.infradead.org; Mon, 19 Dec 2016 12:29:31 +0000
Received: by mail-qt0-x233.google.com with SMTP id w33so145014550qtc.3
 for <ath10k@lists.infradead.org>; Mon, 19 Dec 2016 04:29:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <000301d258ae$79b8be70$6d2a3b50$@gmail.com>
References: <000301d258ae$79b8be70$6d2a3b50$@gmail.com>
From: Bruno Antunes <baantunes@gmail.com>
Date: Mon, 19 Dec 2016 12:28:48 +0000
Message-ID: <CABUTiXVO_v5ujfvu=DB+gwj8YQFFuU9SYa0+_+SeTrWFO9o1Kg@mail.gmail.com>
Subject: Re: Compex WLE900VX wireless driver
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
To: Mikhail Sokolovskyy <msokolovskii@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

On 17 December 2016 at 21:42, Mikhail Sokolovskyy
<msokolovskii@gmail.com> wrote:
> HI to all!
>

> The card doesn't want to start at ac mode at all. The OS is ClearOS which is

That can be the hostapd configuration file or hostapd version.

> based on Red Hat products. Here is the output for "ethtool -i wlp2s0"
>
> driver: ath10k_pci
> version: 3.10.0-327.36.3.v7.x86_64
> firmware-version: 999.999.0.636

Is there any reason to use this firmware version?

You can upgrade to more recent versions:
https://github.com/kvalo/ath10k-firmware

Some info and instructions can be found here:
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware

Regards,
Bruno

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
