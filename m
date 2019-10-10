Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIenF-0001x5-0F
 for ath10k@lists.infradead.org; Thu, 10 Oct 2019 20:12:14 +0000
Received: by mail-lj1-f197.google.com with SMTP id y12so1247441ljc.8
 for <ath10k@lists.infradead.org>; Thu, 10 Oct 2019 13:12:06 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v3 1/2] mac80211: Implement Airtime-based Queue Limit (AQL)
In-Reply-To: <a2cc0ebecfb055c8b667db57d0469fe69054a69c.camel@sipsolutions.net>
References: <20191010022502.141862-1-kyan@google.com>
 <20191010022502.141862-2-kyan@google.com>
 <a2cc0ebecfb055c8b667db57d0469fe69054a69c.camel@sipsolutions.net>
Date: Thu, 10 Oct 2019 22:12:03 +0200
Message-ID: <87ftk0jr70.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, yiboz@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, nbd@nbd.name

Johannes Berg <johannes@sipsolutions.net> writes:

> Hi,
>
> A couple of points...
>
> First, I'd like Toke to review & ack this if possible :-)

Sure, I'll look at it. I'm away the rest of this week, but should
hopefully get some more time next week. It may be that it will take the
form of another submission that integrates this with the previous patch
I sent that put more of the calculation into mac80211 itself...

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
