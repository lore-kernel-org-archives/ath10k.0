Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve2pI-0007l6-T6
 for ath10k@lists.infradead.org; Wed, 06 Nov 2013 13:07:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix crash due to tasklet race.
References: <1383082737-20728-1-git-send-email-greearb@candelatech.com>
Date: Wed, 6 Nov 2013 15:06:49 +0200
In-Reply-To: <1383082737-20728-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 29 Oct 2013 14:38:57
 -0700")
Message-ID: <871u2tsmqe.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> The tasklet can run after the rings have been cleaned up,
> so check for NULL before de-referencing the ring.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

I'll drop this as Michal's patch has a proper fix for this issue.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
