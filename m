Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i03AR-00027V-LC
 for ath10k@lists.infradead.org; Tue, 20 Aug 2019 12:23:18 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 81B16C08E2BD
 for <ath10k@lists.infradead.org>; Tue, 20 Aug 2019 12:23:14 +0000 (UTC)
Received: by mail-ed1-f70.google.com with SMTP id x40so4060380edm.4
 for <ath10k@lists.infradead.org>; Tue, 20 Aug 2019 05:23:14 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 2/7] ath10k: change max RX bundle size from 8 to 32 for
 sdio
In-Reply-To: <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
Date: Tue, 20 Aug 2019 14:23:10 +0200
Message-ID: <87ef1gt49d.fsf@toke.dk>
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
To: Wen Gong <wgong@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Wen Gong <wgong@codeaurora.org> writes:

> The max bundle size support by firmware is 32, change it from 8 to 32
> will help performance. This results in significant performance
> improvement on RX path.

What happens when the hardware doesn't have enough data to fill a
bundle? Does it send a smaller one, or does it wait until it can fill
it?

-Toke

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
