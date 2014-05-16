Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlI23-0003yZ-Cl
 for ath10k@lists.infradead.org; Fri, 16 May 2014 13:18:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  improve vdev map handling.
References: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
Date: Fri, 16 May 2014 16:18:11 +0300
In-Reply-To: <1398882179-17100-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Wed, 30 Apr 2014 11:22:59
 -0700")
Message-ID: <87fvk96ewc.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Check vdev map has space before calling ffs,
> fix invalid cleanup in failure to create vdev
> case.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Why? What motivated you to write this? If you saw a bug, it would be
good to document the bug in the commit log.

> This is compile-tested only.

It's two weeks since you posted this, sorry for taking so long. But have
you managed to test this by now?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
