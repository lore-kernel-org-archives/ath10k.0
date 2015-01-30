Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHBfc-000109-9w
 for ath10k@lists.infradead.org; Fri, 30 Jan 2015 13:31:36 +0000
Message-ID: <1422624670.1919.21.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/7] ath10k: implement chanctx API
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Jan 2015 14:31:10 +0100
In-Reply-To: <CA+BoTQnkqzHNWTFSc9VB4_itCK_+jC6HC8GmdMKiyrhu-Sz9Cg@mail.gmail.com>
 (sfid-20150130_142217_389536_71E3C7E4)
References: <1422607287-12289-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-1-git-send-email-michal.kazior@tieto.com>
 <1422621086-28970-3-git-send-email-michal.kazior@tieto.com>
 <1422621903.1919.7.camel@sipsolutions.net>
 <CA+BoTQkdszYWbNJcV+1dDFsaSJ3aoTuC=ORUMr_aJx7_aQmcqw@mail.gmail.com>
 <1422623054.1919.18.camel@sipsolutions.net>
 <CA+BoTQnkqzHNWTFSc9VB4_itCK_+jC6HC8GmdMKiyrhu-Sz9Cg@mail.gmail.com>
 (sfid-20150130_142217_389536_71E3C7E4)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, 2015-01-30 at 14:22 +0100, Michal Kazior wrote:

> You'd probably have to add quite a few mutex_lock(iflist_mtx) around
> drv_*() calls (not directly but somewhere at their call trees) to
> guarantee driver can use lock-free iterate() version (which doesn't
> exist yet). This could be tricky.

Well, I was thinking you'd only use it in some places now - but it does
seem a bit difficult to maintain.

We've not typically had to worry about using the synchronous versions
much since we mostly just need a single interface so we just pass it out
and use it there, or so.

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
