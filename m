Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkLQC-0003Md-UB
 for ath10k@lists.infradead.org; Tue, 13 May 2014 22:43:41 +0000
Received: by mail-vc0-f176.google.com with SMTP id lg15so1386375vcb.35
 for <ath10k@lists.infradead.org>; Tue, 13 May 2014 15:43:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53729DED.6000104@candelatech.com>
References: <53729DED.6000104@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Tue, 13 May 2014 18:42:58 -0400
Message-ID: <CAHqTa-2OCz30cetjY3pALup-e0WL=YRLOkrB3Q6QmSyQBxdvhQ@mail.gmail.com>
Subject: Re: FYI: msdu-desc must be multiple of 8.
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On Tue, May 13, 2014 at 6:34 PM, Ben Greear <greearb@candelatech.com> wrote:
> I just hit strange and wonderful crashes because I managed to use
> an msdu-desc length that was not an even multiple of 8.  Firmware
> has assumption (bug, really) about this.
>
> Bug is only triggerable if you fill up tx-descs, so have to flood UDP
> to hit easily.  I was trying 812 buffers, but 808 works just fine.
> (non CT firmware will not let you do less that 1024, no matter what you
> request, btw).

What chooses the msdu-desc length?  Is there a chance that this would
happen on an unmodified driver?

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
