Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1acrpJ-0001e7-5p
 for ath10k@lists.infradead.org; Mon, 07 Mar 2016 09:52:25 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix firmware assert in monitor mode
Date: Mon, 7 Mar 2016 09:51:17 +0000
Message-ID: <87a8mavcoh.fsf@kamboji.qca.qualcomm.com>
References: <1456929832-6147-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1456929832-6147-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Wed, 2 Mar 2016 20:13:52 +0530")
Content-Language: en-US
Content-ID: <13AF572DF4CDF74BB9E0D6771FA142F6@qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: "greearb@candelatech.com" <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> commit 166de3f1895d ("ath10k: remove supported chain mask") had revealed
> an issue on monitor mode. Configuring NSS upon monitor interface
> creation is causing target assert in all qca9888x and qca6174 firmware.
> Firmware assert issue can be reproduced by below sequence even after
> reverting commit 166de3f1895d ("ath10k: remove supported chain mask").
>
> ip link set wlan0 down
> iw wlan0 set type monitor
> iw phy0 set antenna 7
> ip link set wlan0 up
>
> This issue is originally reported on qca9888 with 10.1 firmware.
>
> Fixes: 5572a95b4b ("ath10k: apply chainmask settings to vdev on creation")
> Reported-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Applied, thanks for fixing this. I also CCed stable.

But I'm not actually sure if the "Fixes" lines implies "Cc stable"? I
think I saw one patch going into stable like that so I have been
wondering how this works. Does anyone know?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
