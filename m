Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKoSS-0003sP-8p
 for ath10k@lists.infradead.org; Thu, 30 Jul 2015 14:05:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add QCA99X0 to supported device list
References: <1437478567-11339-1-git-send-email-vthiagar@qti.qualcomm.com>
Date: Thu, 30 Jul 2015 17:04:43 +0300
In-Reply-To: <1437478567-11339-1-git-send-email-vthiagar@qti.qualcomm.com>
 (Vasanthakumar Thiagarajan's message of "Tue, 21 Jul 2015 17:06:07
 +0530")
Message-ID: <87vbd13fno.fsf@kamboji.qca.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:

> Add vendor/device id of QCA99X0 V2.0 to pci id table and
> QCA99X0_HW_2_0_CHIP_ID_REV to ath10k_pci_supp_chips[] for
> QCA99X0 to get detected by the driver.
>
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, applied. I just modified the commit log to make it a bit clear
that QCA99X0 is now working:

    ath10k: add QCA99X0 to supported device list
    
    Add vendor/device id of QCA99X0 V2.0 to pci id table and
    QCA99X0_HW_2_0_CHIP_ID_REV to ath10k_pci_supp_chips[] for
    QCA99X0 to get detected by the driver.
    
    kvalo: now QCA99X0 family of chipsets is supported by ath10k. Tested
    client, AP and monitor mode with QCA9990.
    
    Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
