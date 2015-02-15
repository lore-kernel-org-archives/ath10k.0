Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YN0vw-000821-Nq
 for ath10k@lists.infradead.org; Sun, 15 Feb 2015 15:16:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add TxBF support
References: <1422611452-21105-1-git-send-email-michal.kazior@tieto.com>
Date: Sun, 15 Feb 2015 17:16:06 +0200
In-Reply-To: <1422611452-21105-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 30 Jan 2015 10:50:52 +0100")
Message-ID: <87r3trgq89.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> If firmware advertises support for TxBF then the
> driver has to instruct the firmware accordingly
> during runtime. Without this patch connecting to
> an AP with beamformer support would yield abysmal
> Rx performance.
>
> This has been tested with wmi-tlv and qca6174
> while acting as a STA beamformee only.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied to ath.git.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
