Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJxCs-0007ID-RY
 for ath10k@lists.infradead.org; Fri, 26 Apr 2019 09:31:47 +0000
Message-ID: <cd3c0dbd4f8d881c9da615504ad34612171377b2.camel@sipsolutions.net>
Subject: Re: [PATCHv5 2/9] nl80211: Add new netlink attribute for TID
 speicific retry count
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 26 Apr 2019 11:31:44 +0200
In-Reply-To: <1553592550-15282-3-git-send-email-tamizhr@codeaurora.org>
References: <1553592550-15282-1-git-send-email-tamizhr@codeaurora.org>
 <1553592550-15282-3-git-send-email-tamizhr@codeaurora.org>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On Tue, 2019-03-26 at 14:59 +0530, Tamizh chelvam wrote:
> 
> +	[NL80211_ATTR_TID_CONFIG_RETRY] = { .type = NLA_FLAG },
> +	[NL80211_ATTR_TID_CONFIG_RETRY_SHORT] = NLA_POLICY_MIN(NLA_U8, 1),
> +	[NL80211_ATTR_TID_CONFIG_RETRY_LONG] = NLA_POLICY_MIN(NLA_U8, 1),
> 
I guess it's a question of semantics, but for *TX retries* 0 should be
valid. Unless you're setting *TX attempts* (including the first one) but
that would be wrong...

So I guess you should clarify that in the documentation and really allow
0, which is sort of equivalent to no-ack but not really because it does
request an ACK.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
