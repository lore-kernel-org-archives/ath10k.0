Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x229.google.com ([2a00:1450:4008:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5BEl-0007bx-Bq
 for ath10k@lists.infradead.org; Mon, 20 Jan 2014 09:33:43 +0000
Received: by mail-bk0-f41.google.com with SMTP id na10so123518bkb.0
 for <ath10k@lists.infradead.org>; Mon, 20 Jan 2014 01:33:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <878uudps7f.fsf@kamboji.qca.qualcomm.com>
References: <1513091.zjVOOQ7NvD@bentobox>
 <87mwitpsmn.fsf@kamboji.qca.qualcomm.com>
 <878uudps7f.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 20 Jan 2014 17:33:20 +0800
Message-ID: <CAEFj986qG4tfbzsgN6b1+0dh5SAP61-aU_Oc3YQLJPU5a8LX-g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Initial 11ac support using ath10k
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: simon@open-mesh.com, Sven Eckelmann <sven@open-mesh.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

>>  * Adhoc mode doesn't work at all
>
> That was with 10.1 firmware? AFAIK it doesn't support adhoc at all. I
> think we need to add a firmware feature flag to disable adhoc with that
> firmware.

I managed to try out the firmware version 999.999.0.636 on adhoc mode.
It works only after I fool the drv_get_tsf (currently not implemented
in ath10k) to return 0.

Also, the firmware seems only allow the legacy rate and not HT/VHT
rate in adhoc mode. FYI, drv_sta_rc_update also not implemented in
ath10k.

Let me know if you have any updates. Thanks

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
