Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1C9B-0006PH-8J
 for ath10k@lists.infradead.org; Wed, 17 Dec 2014 10:48:01 +0000
Message-ID: <1418813252.2135.5.camel@sipsolutions.net>
Subject: Re: [PATCH v2] mac80211: notify NSS changed when IBSS and HT
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 17 Dec 2014 11:47:32 +0100
In-Reply-To: <1418806852-558-1-git-send-email-janusz.dziedzic@tieto.com>
 (sfid-20141217_100158_628858_A7FE3DB6)
References: <1418806852-558-1-git-send-email-janusz.dziedzic@tieto.com>
 (sfid-20141217_100158_628858_A7FE3DB6)
Mime-Version: 1.0
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Wed, 2014-12-17 at 10:00 +0100, Janusz Dziedzic wrote:
> When using IBSS in HT mode, we always get NSS=1
> in rc_update callback. Force NSS recalculation when
> rates updated and notify driver that NSS changed.

Applied.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
