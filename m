Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuUH-0001Lu-2g
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:19:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 04/10] ath10k: make firmware text debug messages more
 verbose.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-4-git-send-email-greearb@candelatech.com>
Date: Mon, 24 Nov 2014 16:19:06 +0200
In-Reply-To: <1411507045-18973-4-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 23 Sep 2014 14:17:19
 -0700")
Message-ID: <87sih865r9.fsf@kamboji.qca.qualcomm.com>
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
> There are not many of these messages producted by the
> firmware, but they are generally fairly useful, so print
> them at info level.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Thanks, applied. Though I did change the commit log:

commit 3be004c3aa4341c7c2461b37612a3a7a3323579d
Author: Ben Greear <greearb@candelatech.com>
Date:   Tue Sep 23 14:17:19 2014 -0700

    ath10k: add ATH10K_DBG_WMI_PRINT debug level
    
    There are not many of these messages producted by the
    firmware, but they are generally fairly useful, so make it easy to print them
    with a separate debug level.
    
    kvalo: fix commit log, rename debug level
    
    Signed-off-by: Ben Greear <greearb@candelatech.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
