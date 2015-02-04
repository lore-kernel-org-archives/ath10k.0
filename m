Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIuHl-0006U2-8X
 for ath10k@lists.infradead.org; Wed, 04 Feb 2015 07:22:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH-RESEND] ath10k: add log level configuration for fw_dbglog
References: <1422522412-10441-1-git-send-email-sjegadee@qti.qualcomm.com>
Date: Wed, 4 Feb 2015 09:21:35 +0200
In-Reply-To: <1422522412-10441-1-git-send-email-sjegadee@qti.qualcomm.com>
 (SenthilKumar Jegadeesan's message of "Thu, 29 Jan 2015 14:36:52
 +0530")
Message-ID: <871tm6w39c.fsf@kamboji.qca.qualcomm.com>
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

> Introduce optional log level configuration for
> existing debugfs fw_dbglog.
>
> It allow users to configure desired log level
> for firmware debugs.
>
> To configure log level as WARN
>
> echo 0xffffffff  2 > /sys/kernel/debug/ieee80211/phy0/ath10k/fw_dbglog
>
> Loglevel	Value
> VERBOSE		0
> INFO		1
> WARN		2
> ERR		3
>
> Signed-off-by: SenthilKumar Jegadeesan <sjegadee@qti.qualcomm.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
