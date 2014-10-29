Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjUpC-0005V4-Fh
 for ath10k@lists.infradead.org; Wed, 29 Oct 2014 15:06:15 +0000
Message-ID: <1414595144.1827.5.camel@jlt4.sipsolutions.net>
Subject: Re: [PATCH] ath10k: handle ieee80211 header and payload tracing
 separately
From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 29 Oct 2014 16:05:44 +0100
In-Reply-To: <1414591778-19040-1-git-send-email-rmanohar@qti.qualcomm.com>
 (sfid-20141029_151355_898518_23CAA0BF)
References: <1414591778-19040-1-git-send-email-rmanohar@qti.qualcomm.com>
 (sfid-20141029_151355_898518_23CAA0BF)
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, 2014-10-29 at 19:39 +0530, Rajkumar Manoharan wrote:

> +	u32 hdr_len = ieee80211_hdrlen(hdr->frame_control);

> +	trace_ath10k_rx_hdr(ar, hdr, hdr_len);
> +	trace_ath10k_rx_payload(ar, skb->data + hdr_len, skb->len - hdr_len);

Another note, since you're taking my suggestion :-)

It would be worth hiding that inside the tracepoint's assign function,
so instead of passing data/len here you'd pass the full skb, or the full
skb data/skb len, like this:

ar, skb->data, skb->len

to both tracers. Then inside the tracer you can do the hdrlen check, and
that way move the code into the tracing so it's not hit when tracing is
disabled.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
