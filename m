Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgpg-0006lz-Vt
 for ath10k@lists.infradead.org; Wed, 17 Apr 2019 09:26:22 +0000
Received: by mail-ed1-f66.google.com with SMTP id x61so20338975edc.9
 for <ath10k@lists.infradead.org>; Wed, 17 Apr 2019 02:26:20 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2] ath10k: fix different tx duration output
In-Reply-To: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
References: <1555489045-18070-1-git-send-email-leiwa@codeaurora.org>
Date: Wed, 17 Apr 2019 10:26:17 +0100
Message-ID: <87mukprnie.fsf@toke.dk>
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
To: Lei Wang <leiwa@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Lei Wang <leiwa@codeaurora.org> writes:

> TX duration output of tx_stats in debugfs and station dump had big
> difference because they got tx duration value from different statistic
> data. We should use the same statistic data.

So are you sure you picked the most accurate one of the two? :)

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
