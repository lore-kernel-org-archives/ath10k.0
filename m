Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cf5Fy-0006oO-C0
 for ath10k@lists.infradead.org; Sat, 18 Feb 2017 13:41:00 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 0/8] ath10k sdio support
Date: Sat, 18 Feb 2017 13:40:17 +0000
Message-ID: <87fujbhb29.fsf@kamboji.qca.qualcomm.com>
References: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1484342771-6160-1-git-send-email-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Fri, 13 Jan 2017 22:26:03 +0100")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hej,

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> This is the third version of the sdio RFC patch series.
> The actual sdio code (patch 6) has been subject to a massive overhaul,
> mainly as a result of Kalle's review comments.
> It no longer has any strong resemblance of the original ath6kl code from
> which it was originally based upon.
>
> Previous pathes 6 to 10 have been merged into one single patch.
>
> The previous series had a rework of the "HTC fake service" connect
> (ep 0 connect) that introduced a race between the actual endpoint
> connect and the HTC ready message. This issue has been addressed,
> and the current patches (3 and 4) has been rewritten accordingly.
>
> * overview of patches *
>
> Patches 1 to 4 are more or less identical to the previous RFC, with an
> exception for patch 3 that changes the "HTC fake service" connect
> (mentioned above).
>
> Patch 5 is a squashed version of previous patches 6 to 10.
>
> Patch 6 is the actual sdio patch
>
> Patches 7 to 8 are new and adds special sdio versions of BMI get
> target info and HTC ready.
>
> The new version was built and tested against:
> tag: ath-201701121109
>
> Erik Stromdahl (8):
>   ath10k: htc: made static function public
>   ath10k: htc: rx trailer lookahead support
>   ath10k: htc: move htc ctrl ep connect to htc_init
>   ath10k: htc: refactorization
>   ath10k: various sdio related definitions
>   ath10k: sdio support
>   ath10k: sdio get target info
>   ath10k: htc: ready_ext msg support

Sorry for not getting back to you earlier, haven't found time to look
this in detail during the last few weeks.

This is looking quite good now. I have some nitpicks (build warnings,
maybe reorder some patches etc) still but I think it's faster if I fix
those and send v4 as a proper patch (no RFC anymore), naturally
attributing you as the author. Is that ok for you?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
