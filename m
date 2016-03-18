Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agpIJ-0001YI-Ui
 for ath10k@lists.infradead.org; Fri, 18 Mar 2016 07:58:04 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix debugfs pktlog_filter write
Date: Fri, 18 Mar 2016 07:57:32 +0000
Message-ID: <8760wki5g4.fsf@kamboji.qca.qualcomm.com>
References: <1457676999-32678-1-git-send-email-akolli@qti.qualcomm.com>
In-Reply-To: <1457676999-32678-1-git-send-email-akolli@qti.qualcomm.com>
 (akolli@qti.qualcomm.com's message of "Fri, 11 Mar 2016 11:46:39	+0530")
Content-Language: en-US
Content-ID: <1E816FD5271BAF4F95F72D0CF759C639@qualcomm.com>
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
To: "Kolli, Anilkumar" <akolli@qti.qualcomm.com>
Cc: "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<akolli@qti.qualcomm.com> writes:

> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
>
> It is observed that, we are disabling the packet log if we write same
> value to the pktlog_filter for the second time. Always enable pktlogs
> on non zero filter.
>
> Fixes: 90174455ae05 ("ath10k: add support to configure pktlog filter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
