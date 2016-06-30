Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIaH9-0006eF-2B
 for ath10k@lists.infradead.org; Thu, 30 Jun 2016 11:36:55 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCHV2 3/3] ath10k: add testmode support for 10.4 firmware
Date: Thu, 30 Jun 2016 11:36:26 +0000
Message-ID: <87eg7e6h8n.fsf@kamboji.qca.qualcomm.com>
References: <1467018454-24530-1-git-send-email-c_traja@qti.qualcomm.com>
In-Reply-To: <1467018454-24530-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Mon, 27 Jun 2016 14:37:34 +0530")
Content-Language: en-US
Content-ID: <722E9A9BCF188542BB058710C9EEAC03@qualcomm.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

<c_traja@qti.qualcomm.com> writes:

> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>
> This patch adds testmode support for QCA99X0 chipsets which uses
> 10.4 firmware and added code swap support for UTF binary.
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>

There were few checkpatch warnings, I fixed them in the pending branch:

$ ath10k-check 
drivers/net/wireless/ath/ath10k/testmode.c:247: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/testmode.c:250: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/testmode.c:298: Alignment should match open parenthesis
drivers/net/wireless/ath/ath10k/testmode.c:325: Alignment should match open parenthesis

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
