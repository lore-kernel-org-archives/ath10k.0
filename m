Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTiGj-0006nj-Sc
 for ath10k@lists.infradead.org; Thu, 23 May 2019 07:36:12 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k QCA9377 firmware crashes and fails to recover
References: <CAD8Lp45wxQ3vL_ttq-yKYDxscjn2KyJVCx_vJBCn+u8Yc5QtOQ@mail.gmail.com>
Date: Thu, 23 May 2019 10:35:49 +0300
In-Reply-To: <CAD8Lp45wxQ3vL_ttq-yKYDxscjn2KyJVCx_vJBCn+u8Yc5QtOQ@mail.gmail.com>
 (Daniel Drake's message of "Wed, 22 May 2019 21:19:14 -0600")
Message-ID: <87h89lei7e.fsf@kamboji.qca.qualcomm.com>
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
To: Daniel Drake <drake@endlessm.com>
Cc: Endless Linux Upstreaming Team <linux@endlessm.com>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Daniel Drake <drake@endlessm.com> writes:

> We are experiencing failures with QCA9377 wifi, using Linux 4.18 and
> Linux 5.0 with the latest firmware version:
>
> ath10k_pci 0000:02:00.0: firmware crashed! (guid
> 54a4649a-1240-4459-9442-9d498c49de79)
> ath10k_pci 0000:02:00.0: qca9377 hw1.1 target 0x05020001 chip_id
> 0x003821ff sub 1a3b:2b31
> ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
> ath10k_pci 0000:02:00.0: firmware ver WLAN.TF.1.0-00002-QCATFSWPZ-5
> api 5 features ignore-otp crc32 c3e0d04f

Is this a regression? For example, have you tried older firmware
versions?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
