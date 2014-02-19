Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from 0.mx.nanl.de ([2a00:1328:e101:1200::12] helo=mail.nanl.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG5En-0004YD-Ui
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 11:22:51 +0000
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
 [209.85.216.175])
 by mail.nanl.de (Postfix) with ESMTPSA id 8B84D45EB8
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 11:22:23 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id x13so224496qcv.20
 for <ath10k@lists.infradead.org>; Wed, 19 Feb 2014 03:22:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87fvnfzbg0.fsf@kamboji.qca.qualcomm.com>
References: <1391185897-29339-1-git-send-email-sven@open-mesh.com>
 <87bny5lu4a.fsf@purkki.adurom.net> <2862175.0bPvy6dDPg@bentobox>
 <87fvnfzbg0.fsf@kamboji.qca.qualcomm.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Wed, 19 Feb 2014 12:22:02 +0100
Message-ID: <CAOiHx=noWhgc5W90O1pWgjbmcVZJGwCKqvmrSUf7kAhOMRbwhQ@mail.gmail.com>
Subject: Re: [OpenWrt-Devel] [PATCHv3] wifi: Introduce 802.11ac support
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
Cc: Simon Wunderlich <simon@open-mesh.com>, Sven Eckelmann <sven@open-mesh.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, ath10k@lists.infradead.org, Matti Laakso <malaakso@elisanet.fi>

On Wed, Feb 19, 2014 at 10:41 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> (...)
> But we should try ways to mitigate the problem of having two firmware
> branches. For example, should we have a module parameter in ath10k to
> choose which firmware to use? Or is there even a way to do that
> automatically based on what interfaces are used?

I don't know if this is a good way to do it, but this is exactly what
mwl8k does. They have dedicated AP and STA firmwares, and reload if
needed when adding the apprpriate interfaces. See
<http://lxr.free-electrons.com/source/drivers/net/wireless/mwl8k.c#L4663>
for the code.


Regards
Jonas

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
