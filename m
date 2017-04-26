Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.capitale.jabatus.fr ([109.234.163.51])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d3KHh-0003cu-Ro
 for ath10k@lists.infradead.org; Wed, 26 Apr 2017 10:34:58 +0000
From: Michael Mera <dev@michaelmera.com>
Subject: Re: [RESEND] ath10k: fix out of bounds access to local buffer
In-Reply-To: <0a7aa133740b4488a19bd95115831988@euamsexm01a.eu.qualcomm.com>
References: <20170424071157.6979-1-dev@michaelmera.com>
 <0a7aa133740b4488a19bd95115831988@euamsexm01a.eu.qualcomm.com>
Date: Wed, 26 Apr 2017 19:32:51 +0900
Message-ID: <87a873wjak.fsf@michaelmera.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:
> I fixed a checkpatch warning in the pending branch:
>
> drivers/net/wireless/ath/ath10k/debug.c:636: spaces preferred around that '-' (ctx:VxV)

Hum... but then you will have a line longer than 80 characters (81), so
another warning.
I prefered this version since I feel that splitting this line would hurt
readability and on the other hand the expression is clearly delimited
by the spaces around the ',' so I don't think spaces around the operator
add any value (except for compliance with the coding style that is).

Thanks,
Michael Mera

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
