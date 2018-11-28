Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS0OG-0001gW-Ce
 for ath10k@lists.infradead.org; Wed, 28 Nov 2018 14:00:36 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: update HOST capability qmi message
References: <20181119113101.23359-1-govinds@codeaurora.org>
Date: Wed, 28 Nov 2018 16:00:16 +0200
In-Reply-To: <20181119113101.23359-1-govinds@codeaurora.org> (Govind Singh's
 message of "Mon, 19 Nov 2018 17:01:01 +0530")
Message-ID: <87lg5d715b.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> writes:

> HOST capability interface data structures are updated
> in HL3.1 fw version. Update the qmi host capability
> members for compatibility across different firmware
> versions.
> With this change HL2.0 fw upgrade is required as this
> change breaks the backward compatibility with HL2.0 fw.

The last sentence is not making any sense to me, does it have a typo or
am I missing something?

If there's a typo I can fix it, no need to resend.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
