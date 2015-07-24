Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZIXiz-0000i4-DF
 for ath10k@lists.infradead.org; Fri, 24 Jul 2015 07:48:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/1] ath10k: fixing wrong initialization of struct channel
References: <1437018933-25832-1-git-send-email-maninder1.s@samsung.com>
Date: Fri, 24 Jul 2015 10:48:14 +0300
In-Reply-To: <1437018933-25832-1-git-send-email-maninder1.s@samsung.com>
 (Maninder Singh's message of "Thu, 16 Jul 2015 09:25:33 +0530")
Message-ID: <87mvymf135.fsf@kamboji.qca.qualcomm.com>
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
To: Maninder Singh <maninder1.s@samsung.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, pankaj.m@samsung.com

Maninder Singh <maninder1.s@samsung.com> writes:

> chandef is initialized with NULL and on the very next line,
> we are using it to get channel, which is not correct.
>
> channel should be initialized after obtaining chandef.
>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
