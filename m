Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnnJV-0000bs-4v
 for ath10k@lists.infradead.org; Fri, 23 May 2014 11:07:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  fix rssi reporting.
References: <1400178894-26206-1-git-send-email-greearb@candelatech.com>
Date: Fri, 23 May 2014 14:06:33 +0300
In-Reply-To: <1400178894-26206-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Thu, 15 May 2014 11:34:54
 -0700")
Message-ID: <8738g0vjnq.fsf@kamboji.qca.qualcomm.com>
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
> When the driver cannot provide proper rssi, mark
> status with RX_FLAG_NO_SIGNAL_VAL so that stack
> properly ignores it.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Based on the discussion I'm dropping this patch.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
