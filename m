Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLQcG-0001Jl-Pm
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 07:54:29 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHv3 3/3] ath10k: add testmode support for 10.4 firmware
Date: Fri, 8 Jul 2016 07:54:00 +0000
Message-ID: <87r3b41s6f.fsf@kamboji.qca.qualcomm.com>
References: <1467356835-31836-1-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1467356835-31836-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Fri, 1 Jul 2016 12:37:15 +0530")
Content-Language: en-US
Content-ID: <A5FEB93442F53245B026F9AF6356C6EE@qualcomm.com>
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
To: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "tamizhchelvam@codeaurora.org" <tamizhchelvam@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<c_traja@qti.qualcomm.com> writes:

> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>
> This patch adds testmode support for 10.4 based chipsets
> and added code swap support for UTF binary.
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

This patch introduced new checkpatch warnings:

drivers/net/wireless/ath/ath10k/testmode.c:247: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/testmode.c:250: Alignment should match open parenthesis

I fixed these in the pending branch.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
