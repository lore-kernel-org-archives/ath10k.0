Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dnONH-0004Hr-JV
 for ath10k@lists.infradead.org; Thu, 31 Aug 2017 12:15:14 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: sdio: remove unused struct member
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1503516778-5835-1-git-send-email-erik.stromdahl@gmail.com>
References: <1503516778-5835-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <6796e78b3c3c42aba8799767cf21694f@euamsexm01a.eu.qualcomm.com>
Date: Thu, 31 Aug 2017 14:14:40 +0200
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> irq_wq in struct ath10k_sdio is a remnant from an earlier
> version of the sdio patchset.
> 
> Its use was removed as a result of Kalle's review, but somehow
> the struct member survived.
> 
> It is not used and can therefore safely be removed.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

30b83fff6d97 ath10k: sdio: remove unused struct member

-- 
https://patchwork.kernel.org/patch/9918195/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
