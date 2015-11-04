Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu1sp-00072Y-7s
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 17:30:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv2] ath10k: consolidate if statements in
 ath10k_wmi_event_mgmt_rx
References: <1445323300-17431-1-git-send-email-manikanta.pubbisetty@gmail.com>
Date: Wed, 4 Nov 2015 19:29:23 +0200
In-Reply-To: <1445323300-17431-1-git-send-email-manikanta.pubbisetty@gmail.com>
 (manikanta pubbisetty's message of "Tue, 20 Oct 2015 12:11:40 +0530")
Message-ID: <87fv0ld66k.fsf@kamboji.qca.qualcomm.com>
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
To: manikanta.pubbisetty@gmail.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

manikanta.pubbisetty@gmail.com writes:

> From: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>
>
> This patch replaces mutliple if conditional checks with a single if condition
> in WMI management rx handler. Found during code review.
>
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@gmail.com>

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
