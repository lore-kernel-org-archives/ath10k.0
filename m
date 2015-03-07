Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YU9bh-0003fq-Ga
 for ath10k@lists.infradead.org; Sat, 07 Mar 2015 07:57:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix TxBF VHT capabilities for 2+ RF-chain devices
References: <1424945482-9765-1-git-send-email-michal.kazior@tieto.com>
Date: Sat, 7 Mar 2015 09:56:39 +0200
In-Reply-To: <1424945482-9765-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 26 Feb 2015 11:11:22 +0100")
Message-ID: <871tl11brc.fsf@kamboji.qca.qualcomm.com>
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

> Firmware doesn't report a complete and
> ready-to-use vht cap. Instead the driver is
> supposed to fill in the missing bits related to
> number of chains.
>
> This effectively increases Compressed Steering
> Number and Number of Sounding Dimensions in
> AssocReq frames for devices with more than one RF
> chain and should improve TxBF performance.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
