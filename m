Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTYIs-0008Ch-DG
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 15:02:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: update wal_dbg_tx_stats structure with missing
 parameter.
References: <20140328121639.4591.17459.stgit@potku.adurom.net>
Date: Fri, 28 Mar 2014 17:02:16 +0200
In-Reply-To: <20140328121639.4591.17459.stgit@potku.adurom.net> (Kalle Valo's
 message of "Fri, 28 Mar 2014 14:16:39 +0200")
Message-ID: <8738i2v01z.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> The filed has been missing (missmatched with FW ABI)
> since 999.999.0.629 firmware release.
>
> It's very imporatant to keep these structs up to date with FW,
> due to the arithmetic we use while read the fw_stats.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
