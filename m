Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XttXL-0002OT-8U
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 07:30:48 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/3] ath10k: embed supported chip ids in hw_params
References: <1416838646-18801-1-git-send-email-michal.kazior@tieto.com>
 <87vbm2whoz.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=56six2CEQ6Rzr7yMEM7UVNQ3RX9UpdgmxMEoG0+kDAA@mail.gmail.com>
Date: Thu, 27 Nov 2014 09:30:09 +0200
In-Reply-To: <CA+BoTQ=56six2CEQ6Rzr7yMEM7UVNQ3RX9UpdgmxMEoG0+kDAA@mail.gmail.com>
 (Michal Kazior's message of "Wed, 26 Nov 2014 08:54:30 +0100")
Message-ID: <87ppc9umm6.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> 2. Have a dedicatd pci-specific structure:
>
>  struct ath10k_pci_supported_chip {
>    u16 dev_id;
>    u32 chip_id;
>  };
>
>  struct ath10k_pci_supported_chip ath10k_pci_supported_chips[] = {
>    { QCA988X_2_0_DEVICE_ID, QCA988X_HW_2_0_CHIP_ID_REV },
>    // ...
>  };
>
> Probably the simplest and has least impact.

Another idea which is a variation of this:

In ath10k_core_register() we iterate through ath10k_hw_params_list and
make sure that the chip id is supported and if not, bail out. If the
chip id is found from the array continue the registration process like
in this patch. Basically this would be a whitelist check.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
