Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0x1A-0005tb-HX
 for ath10k@lists.infradead.org; Fri, 05 Jun 2015 19:11:01 +0000
Received: by obcej4 with SMTP id ej4so10026206obc.0
 for <ath10k@lists.infradead.org>; Fri, 05 Jun 2015 12:10:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5571D903.7060203@candelatech.com>
References: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
 <5571D903.7060203@candelatech.com>
Date: Fri, 5 Jun 2015 12:10:36 -0700
Message-ID: <CAFuUQkjP18E6fjvgZMayJYiEQtpjVUAKb+_zDmS3yBfi-QF8Cg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Fix survey information reporting
From: YanBo <dreamfly281@gmail.com>
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
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On Fri, Jun 5, 2015 at 10:14 AM, Ben Greear <greearb@candelatech.com> wrote:
> I applied these and some other related patches to my hacked-upon 4.0.4, but
> I am seeing some inconsistencies between how ath10k and ath9k
> reports survey info.  I am using my CT firmware based on 10.1.
>
> ath9k reports ever-increasing counters for the channel time
> and busy time.
>
> With ath10k, it reports the same values until I do a scan
> again, and even then, it is not additive.
>
> First, should the value only update when we do a scan?
>
> And second, should ath10k report ever increasing totals
> to match ath9k behaviour?
>

It should be match with ath9k, but the ath10k doesn't accumulate the
survey count at currently code,
I drafted a patch to fix this issue, will send to public mailist soon.

BR /Yanbo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
