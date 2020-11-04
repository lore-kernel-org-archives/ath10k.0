Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaS4B-0003kj-Q5
 for ath10k@lists.infradead.org; Wed, 04 Nov 2020 23:19:53 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i26so154580pgl.5
 for <ath10k@lists.infradead.org>; Wed, 04 Nov 2020 15:19:47 -0800 (PST)
Date: Wed, 4 Nov 2020 15:18:38 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [RFC 1/2] nl80211: add common API to configure SAR power
 limitations.
Message-ID: <20201104231838.GB3212577@google.com>
References: <1600753775-4745-1-git-send-email-cjhuang@codeaurora.org>
 <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6649b0c2ff988c2ae8723ea633f86cc12da43d95.camel@sipsolutions.net>
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
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless@vger.kernel.org, dianders@chromium.org, ath10k@lists.infradead.org, kuabhs@google.com

On Mon, Sep 28, 2020 at 02:36:09PM +0200, Johannes Berg wrote:
> > +#define NUM_MAX_NL80211_SAR_FREQ_RANGES 0xfe
> 
> but I'm not sure what these are used for in the first place, they seem
> more like internal implementation details?

I think the MAX value does have some utility in the API -- as mentioned
in other comments, if we're requiring that user space must SET all
ranges at the same time, then we need an expected way for user space to
SET a "don't care" or "MAX" or "null" value for a band. So if there's
some new band (e.g., 6 GHz?) that user space was not previously aware
of, it will know to use this placeholder.

I think that's kind of approximately what the purpose of this was? It's
not super clear in the documentation, so maybe that should be clarified
in writing in v2.

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
