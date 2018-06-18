Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fV15u-00086O-97
 for ath10k@lists.infradead.org; Mon, 18 Jun 2018 20:49:47 +0000
Message-ID: <1529354967.3092.43.camel@sipsolutions.net>
Subject: Re: [PATCH] ath10k: add dynamic vlan support
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 18 Jun 2018 22:49:27 +0200
In-Reply-To: <b94186ea-e76e-1940-365b-4ca72abad77f@dd-wrt.com>
References: <1524232653-22573-1-git-send-email-mpubbise@codeaurora.org>
 <87r2n5auvq.fsf@kamboji.qca.qualcomm.com>
 <aa04534d-9677-f42e-a239-b230093ef2f5@dd-wrt.com>
 <f8d6d13943ccac22f363d7d4f53d645c@codeaurora.org>
 <1526637270.3805.15.camel@sipsolutions.net>
 <59ff8201-fc1b-8579-d5a9-f4b08621f5ec@codeaurora.org>
 <1527069018.3759.15.camel@sipsolutions.net>
 <988f350d-a6eb-1733-4a2f-43a87053e96a@codeaurora.org>
 <1527071997.3759.18.camel@sipsolutions.net>
 <b94186ea-e76e-1940-365b-4ca72abad77f@dd-wrt.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, Manikanta Pubbisetty <mpubbise@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Thu, 2018-05-24 at 06:41 +0200, Sebastian Gottschall wrote:
> 
> mmh not sure. it might not check the capabilitiy, but it sets the 
> interface type to IFTYPE_AP_VLAN
> for wds sta interfaces. that might collide

That was my point - if it doesn't check the capability then we can
remove it without impacting backward compatibility, and add it back in
another bit saying "AP-VLAN for 4-addr only".

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
