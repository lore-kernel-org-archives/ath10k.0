Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyDIc-0001wh-77
 for ath10k@lists.infradead.org; Mon, 25 Feb 2019 10:15:53 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Add peer param map for tlv and non-tlv
References: <1550556576-19803-1-git-send-email-pillair@codeaurora.org>
Date: Mon, 25 Feb 2019 12:15:43 +0200
In-Reply-To: <1550556576-19803-1-git-send-email-pillair@codeaurora.org>
 (Rakesh Pillai's message of "Tue, 19 Feb 2019 11:39:36 +0530")
Message-ID: <87bm30mawg.fsf@kamboji.qca.qualcomm.com>
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
To: Rakesh Pillai <pillair@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> writes:

> The peer param id for PEER_PARAM_USE_FIXED_PWR
> is different for tlv and non-tlv firmware. This
> causes incorrect peer param to be set by the driver
> to the firmware(tlv/non-tlv).
>
> Create seperate peer param map for tlv and non-tlv
> firmware and attach the peer param id based on the
> firmware type during the init.
>
> Tested HW: WCN3990
> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
> This change is dependent on the below patchset
> ath10k: add support for controlling tx power to a station (https://patchwork.kernel.org/patch/9562405/)

You got me really confused, that patch is two years old :) But I think
you mean this v3 patch (oddly the one submitted in 2017 was also v3?):

[v3,3/3] ath10k: add support for controlling tx power to a station

https://patchwork.kernel.org/patch/10825293/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
