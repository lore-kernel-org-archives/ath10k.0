Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG3kj-0001UA-Py
 for ath10k@lists.infradead.org; Wed, 19 Feb 2014 09:47:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [OpenWrt-Devel] [PATCHv3] wifi: Introduce 802.11ac support
References: <1391185897-29339-1-git-send-email-sven@open-mesh.com>
 <87bny5lu4a.fsf@purkki.adurom.net> <2862175.0bPvy6dDPg@bentobox>
 <DUB122-W428FBB95DD2338614F9EB5CB990@phx.gbl>
Date: Wed, 19 Feb 2014 11:47:14 +0200
In-Reply-To: <DUB122-W428FBB95DD2338614F9EB5CB990@phx.gbl> (Matti Laakso's
 message of "Mon, 17 Feb 2014 21:13:48 +0100")
Message-ID: <87bny3zb6l.fsf@kamboji.qca.qualcomm.com>
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
To: Matti Laakso <malaakso@elisanet.fi>
Cc: Simon Wunderlich <simon@open-mesh.com>, Sven Eckelmann <sven@open-mesh.com>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, ath10k@lists.infradead.org

(Adding ath10k@lists.infradead.org)

> I think AP is by far the most common use case for OpenWrt, and DFS support for
> example is only for the AP-branch firmware (as I found out after some intense
> study of the ath10k/cfg80211/mac80211 source

Oh, I didn't know that. But that's not suprising as almost all of AP
mode testing happens with 10.1 firmware.

> -- maybe the firmware features should be better documented...)

Sure, it's just lack of time on my part. Any help with documentation
would be appreciated.

> Does AP firmware support plain STA operation?

Yes, but not that well tested.

> If it does, AP firmware should no doubt be the default in OpenWrt.

I fully agree. This should be the first stage.

> If not, then we should maybe think of a way to support both.

For the second stage I think we should try improve how to make it easier
to switch between firmwares (see my previous email).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
