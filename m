Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZbpm-0006Xw-BI
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 09:38:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Drop probe responses when too many are queued
References: <1441019095-2364-1-git-send-email-nataraja@qti.qualcomm.com>
Date: Wed, 9 Sep 2015 12:37:57 +0300
In-Reply-To: <1441019095-2364-1-git-send-email-nataraja@qti.qualcomm.com>
 (Vivek Natarajan's message of "Mon, 31 Aug 2015 16:34:55 +0530")
Message-ID: <87y4gg7x1m.fsf@kamboji.qca.qualcomm.com>
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
To: Vivek Natarajan <nataraja@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vivek Natarajan <nataraja@qti.qualcomm.com> writes:

> In a noisy environment, when multiple interfaces are created,
> the management tx descriptors are fully occupied by the probe
> responses from all the interfaces. This prevents a new station
> from a successful association.
>
> Fix this by limiting the probe responses when the specified
> threshold limit is reached.
>
> Signed-off-by: Vivek Natarajan <nataraja@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
