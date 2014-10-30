Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xjlw6-0000nP-KR
 for ath10k@lists.infradead.org; Thu, 30 Oct 2014 09:22:31 +0000
Date: Thu, 30 Oct 2014 14:54:09 +0530
From: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: handle ieee80211 header and payload tracing
 separately
Message-ID: <20141030092408.GA20221@qca.qualcomm.com>
References: <1414591778-19040-1-git-send-email-rmanohar@qti.qualcomm.com>
 <1414595144.1827.5.camel@jlt4.sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1414595144.1827.5.camel@jlt4.sipsolutions.net>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On Wed, Oct 29, 2014 at 04:05:44PM +0100, Johannes Berg wrote:
> On Wed, 2014-10-29 at 19:39 +0530, Rajkumar Manoharan wrote:
> 
> > +	u32 hdr_len = ieee80211_hdrlen(hdr->frame_control);
> 
> > +	trace_ath10k_rx_hdr(ar, hdr, hdr_len);
> > +	trace_ath10k_rx_payload(ar, skb->data + hdr_len, skb->len - hdr_len);
> 
> Another note, since you're taking my suggestion :-)
> 
> It would be worth hiding that inside the tracepoint's assign function,
> so instead of passing data/len here you'd pass the full skb, or the full
> skb data/skb len, like this:
> 
> ar, skb->data, skb->len
> 
> to both tracers. Then inside the tracer you can do the hdrlen check, and
> that way move the code into the tracing so it's not hit when tracing is
> disabled.
> 
Nice. Let me send v2. Thanks once again.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
