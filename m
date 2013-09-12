Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK9g6-0006dF-7K
 for ath10k@lists.infradead.org; Thu, 12 Sep 2013 16:23:35 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 06/12] wireless: ath10k: remove unnecessary
 pci_set_drvdata()
References: <00b101ceae16$ecb87c30$c6297490$%han@samsung.com>
 <00b701ceae18$69cd1860$3d674920$%han@samsung.com>
Date: Thu, 12 Sep 2013 19:23:07 +0300
In-Reply-To: <00b701ceae18$69cd1860$3d674920$%han@samsung.com> (Jingoo Han's
 message of "Tue, 10 Sep 2013 20:25:11 +0900")
Message-ID: <87wqmmdn6c.fsf@qca.qualcomm.com>
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
To: Jingoo Han <jg1.han@samsung.com>
Cc: linux-wireless@vger.kernel.org, "'John W. Linville'" <linville@tuxdriver.com>, ath10k@lists.infradead.org

Jingoo Han <jg1.han@samsung.com> writes:

> The driver core clears the driver data to NULL after device_release
> or on probe failure. Thus, it is not needed to manually clear the
> device driver data to NULL.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
