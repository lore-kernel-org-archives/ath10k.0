Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPTub-0008TU-KQ
 for ath10k@lists.infradead.org; Thu, 04 Sep 2014 10:05:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: ATH10K_DEBUGFS depends on DEBUG_FS
References: <CAFnufp1Rg2JOLM4d6g_=uF+Nrydt0Wy_4DK85bnqNHkthD9zQw@mail.gmail.com>
Date: Thu, 4 Sep 2014 13:04:38 +0300
In-Reply-To: <CAFnufp1Rg2JOLM4d6g_=uF+Nrydt0Wy_4DK85bnqNHkthD9zQw@mail.gmail.com>
 (Matteo Croce's message of "Thu, 4 Sep 2014 10:50:39 +0200")
Message-ID: <87iol3k8g9.fsf@kamboji.qca.qualcomm.com>
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
To: Matteo Croce <matteo@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Matteo Croce <matteo@openwrt.org> writes:

> enable ath10k debugfs only when debugfs is enabled,
> fixes an invalid pointer on module insert
>
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig

This is missing Signed-off-by, so I cannot take this. Please check
Documentation/SubmittingPatches and please resend.

The safest way to submit a patch is to commit with 'git commit -s' and
then submit the commit with 'git send-email'. But first do a trial run
by submitting it to yourself.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
