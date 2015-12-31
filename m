Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEd56-0007CR-Cx
 for ath10k@lists.infradead.org; Thu, 31 Dec 2015 13:15:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: wake up device before accessing registers
References: <1449740667-25901-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Thu, 31 Dec 2015 15:14:32 +0200
In-Reply-To: <1449740667-25901-1-git-send-email-rmanohar@qti.qualcomm.com>
 (Rajkumar Manoharan's message of "Thu, 10 Dec 2015 15:14:26 +0530")
Message-ID: <8760zeoj47.fsf@kamboji.qca.qualcomm.com>
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> writes:

> commit 1aaf8efba0ae ("ath10k: disable PCI PS for QCA988X
> and QCA99X0") partially reverts pci soc powersave support added by
> commit 77258d409ce4 ("ath10k: enable pci soc powersaving"). While
> reverting the change, pci wake up function is called after accessing
> pci registers instead of prior to access. The assumption is that chip
> is woken up before accessing its registers.Though this change does not
> fix any known issues, this might help to avoid unknown or low power
> platform specific issues.
>
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Both patches applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
