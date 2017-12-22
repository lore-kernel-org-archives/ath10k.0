Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPsV-0007jo-Po
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 16:08:57 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 03/11] ath10k_sdio: DMA bounce buffers for read write
Date: Fri, 22 Dec 2017 16:08:40 +0000
Message-ID: <87lghu9247.fsf@kamboji.qca.qualcomm.com>
References: <1506793068-27445-1-git-send-email-alagusankar@silex-india.com>
 <1506793068-27445-4-git-send-email-alagusankar@silex-india.com>
In-Reply-To: <1506793068-27445-4-git-send-email-alagusankar@silex-india.com>
 (silexcommon@gmail.com's message of "Sat, 30 Sep 2017 23:07:40 +0530")
Content-Language: en-US
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
To: "silexcommon@gmail.com" <silexcommon@gmail.com>
Cc: Alagu Sankar <alagusankar@silex-india.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

silexcommon@gmail.com writes:

> From: Alagu Sankar <alagusankar@silex-india.com>
>
> Some SD host controllers still need bounce buffers for SDIO data
> transfers. While the transfers worked fine on x86 platforms,
> this is found to be required for i.MX6 based systems.
>
> Changes are similar to and derived from the ath6kl sdio driver.
>
> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>

Why is the bounce buffer needed exactly, what are the symptoms etc? To
me this sounds like an ugly workaround for a SDIO controller driver bug.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
