Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihEe9-0003xi-Sv
 for ath10k@lists.infradead.org; Tue, 17 Dec 2019 15:20:28 +0000
Received: by mail-lf1-f70.google.com with SMTP id d6so1043621lfl.3
 for <ath10k@lists.infradead.org>; Tue, 17 Dec 2019 07:20:17 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 4/4] mac80211: Sync airtime weight sum with per AC synced
 sta airtime weight together
In-Reply-To: <fd7b4cb48f3510d81d227ae8020c3b6c46f4a4b0.camel@sipsolutions.net>
References: <1576221593-1086-1-git-send-email-yiboz@codeaurora.org>
 <1576221593-1086-5-git-send-email-yiboz@codeaurora.org>
 <fd7b4cb48f3510d81d227ae8020c3b6c46f4a4b0.camel@sipsolutions.net>
Date: Tue, 17 Dec 2019 16:20:14 +0100
Message-ID: <87v9qf6ksx.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Yibo Zhao <yiboz@codeaurora.org>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> I'm going to assume that Toke will review all of this and there will be
> changes, so you'd resend anyway ...

Yeah, this series doesn't even apply in its current form. I'll try to
fix that, and do a few other updates that are needed while I'm at it.
And to answer your question in the other email, yeah, this should
probably be squashed to a single patch...

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
