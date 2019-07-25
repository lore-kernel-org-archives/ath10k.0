Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqTHp-0006yW-0p
 for ath10k@lists.infradead.org; Thu, 25 Jul 2019 02:15:18 +0000
Subject: RE: [PATCH] ath10k: add mic bytes for pmf management packet
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Thu, 25 Jul 2019 02:15:03 +0000
Message-ID: <5d573271132e40f99326019d3d94827b@aptaiexm02f.ap.qualcomm.com>
References: <1560757079-19266-1-git-send-email-wgong@codeaurora.org>
 <136d04d4-671b-8dde-2abd-63070b07bd26@candelatech.com>
 <9403fef58374427fa76fb32ee64ee333@aptaiexm02f.ap.qualcomm.com>
 <87v9vrzl8d.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87v9vrzl8d.fsf@kamboji.qca.qualcomm.com>
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
To: "kvalo@codeaurora.org" <kvalo@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Kalle Valo
> Sent: Wednesday, July 24, 2019 8:11 PM
> To: Wen Gong <wgong@qti.qualcomm.com>
> Cc: Ben Greear <greearb@candelatech.com>; linux-wireless@vger.kernel.org;
> ath10k@lists.infradead.org; Wen Gong <wgong@codeaurora.org>
> Subject: [EXT] Re: [PATCH] ath10k: add mic bytes for pmf management
> packet
> > seems the ieee80211_is_robust_mgmt_frame_tx is not
> > match my change.
> 
> So what's the conclusion, can I take this patch?
> 
Yes, you can take this patch.
> --
> Kalle Valo
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
