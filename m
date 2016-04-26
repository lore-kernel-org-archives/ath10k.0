Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aux3O-0007uW-1Z
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 07:05:03 +0000
Message-ID: <1461654272.16188.4.camel@sipsolutions.net>
Subject: Re: [PATCH v2] ath10k: remove VHT capabilities from 2.4GHz
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 26 Apr 2016 09:04:32 +0200
In-Reply-To: <5718EE7A.4030503@candelatech.com>
 (sfid-20160421_171514_734039_B1F3CF8F)
References: <1461244669-19871-1-git-send-email-kvalo@qca.qualcomm.com>
 <5718EE7A.4030503@candelatech.com> (sfid-20160421_171514_734039_B1F3CF8F)
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
To: Ben Greear <greearb@candelatech.com>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Thu, 2016-04-21 at 08:15 -0700, Ben Greear wrote:

> The thing is, it actually works just fine with the patch I posted
> to fix mac80211, and at any rate, even if the mac80211 patch isn't
> applied, the ath10k driver works just fine in HT mode.

This patch has no implications on HT, and I wasn't planning on applying
the mac80211 patch.

As I said, I have no objections to doing the (Broadcom) vendor specific
IEs for "VHT" in 2.4 GHz band, but I don't think we should advertise
the spec IEs when they're explicitly specified to be used only in the
5.2 GHz band.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
