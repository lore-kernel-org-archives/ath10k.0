Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ek5Bi-0005ZX-AK
 for ath10k@lists.infradead.org; Fri, 09 Feb 2018 09:41:47 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: update the IRAM banks number for QCA9377
References: <1518135631-29796-1-git-send-email-ryanhsu@codeaurora.org>
Date: Fri, 09 Feb 2018 11:41:30 +0200
In-Reply-To: <1518135631-29796-1-git-send-email-ryanhsu@codeaurora.org>
 (ryanhsu@codeaurora.org's message of "Thu, 8 Feb 2018 16:20:31 -0800")
Message-ID: <874lmqcxf9.fsf@kamboji.qca.qualcomm.com>
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
To: ryanhsu@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ryanhsu@codeaurora.org writes:

> From: Ryan Hsu <ryanhsu@codeaurora.org>
>
> QCA9377 firmware update the IRAM banks from 4 to 9.
>
> Signed-off-by: Ryan Hsu <ryanhsu@codeaurora.org>

As we discussed offline, I'll update the commit log to this:

ath10k: update the IRAM bank number for QCA9377

Prepared for new QCA9377 firmware support. With the new
firmware update, it required more IRAM banks, hence updated it.

The IRAM banks promotion won't break any backward compatibility,
as those IRAM banks were not getting used in previous firmware.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
