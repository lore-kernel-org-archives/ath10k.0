Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTWHU-0005LV-62
 for ath10k@lists.infradead.org; Thu, 05 Mar 2015 13:57:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: Increase AST table SKID length limit
References: <1423841776-16288-1-git-send-email-sjegadee@qti.qualcomm.com>
Date: Thu, 5 Mar 2015 15:57:09 +0200
In-Reply-To: <1423841776-16288-1-git-send-email-sjegadee@qti.qualcomm.com>
 (SenthilKumar Jegadeesan's message of "Fri, 13 Feb 2015 21:06:16
 +0530")
Message-ID: <87fv9j4kei.fsf@kamboji.qca.qualcomm.com>
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
To: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com> writes:

> The current SKID length configuration causes firmware
> to reject peer creation for not able to allocate
> AST entries for peers. This issue is observed when
> least significant 3 bytes are used ramdomly to create
> client MAC addresses.
>
> AST table SKID length configuration is increased to
> maximum value to fix this issue.
>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
