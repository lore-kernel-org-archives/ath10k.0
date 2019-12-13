Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifhiB-0003gR-F7
 for ath10k@lists.infradead.org; Fri, 13 Dec 2019 09:58:16 +0000
Message-ID: <fd7b4cb48f3510d81d227ae8020c3b6c46f4a4b0.camel@sipsolutions.net>
Subject: Re: [PATCH 4/4] mac80211: Sync airtime weight sum with per AC
 synced sta airtime weight together
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 13 Dec 2019 10:58:09 +0100
In-Reply-To: <1576221593-1086-5-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082437_402312_070F042E)
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-5-git-send-email-yiboz@codeaurora.org>
 (sfid-20191213_082437_402312_070F042E)
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
To: Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org


I'm going to assume that Toke will review all of this and there will be
changes, so you'd resend anyway ...

> - * @airtime_weight: station weight for airtime fairness calculation purposes
> + * @airtime_weight: station per-AC weight for airtime fairness calculation
> + * purposes

If you do, please replace the "*<space>purposes" by "*<tab>purposes" :-)

(otherwise I can just fix that myself too, but ...)

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
