Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ef0Qf-0001j3-BS
 for ath10k@lists.infradead.org; Fri, 26 Jan 2018 09:36:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: QCA6174 SDIO crashing after few days
References: <CAFR5RwTCNV-135E16fXJLECsart-cTjVJq8QcDB3wKH+JrsHnw@mail.gmail.com>
Date: Fri, 26 Jan 2018 11:35:59 +0200
In-Reply-To: <CAFR5RwTCNV-135E16fXJLECsart-cTjVJq8QcDB3wKH+JrsHnw@mail.gmail.com>
 (Adam Porter's message of "Thu, 25 Jan 2018 11:11:37 -0800")
Message-ID: <87lgglufls.fsf@kamboji.qca.qualcomm.com>
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
To: Adam Porter <porter.adam@gmail.com>
Cc: ath10k@lists.infradead.org

Adam Porter <porter.adam@gmail.com> writes:

> Firmware WLAN.RMH.4.1.1-00014-QCARMSWPZ-1
>
> Using branch ath10k-pending-sdio-usb

What commit id? BTW, I'm planning to add a tag everytime I rebase that
branch so that it's easier to find older commits and identify what
version is used.

> I'm using this module as an access point. After a while of uptime, it
> appears that all communication with the module ceases. Hostapd goes to
> disassociate clients due to inactivity, then I see in the log the
> resulting failures:
>
> [94216.098042] ath10k_sdio mmc0:0001:1: failed to install key for vdev
> 0 peer c8:21:58:10:b3:b4: -110
> [94219.170075] ath10k_sdio mmc0:0001:1: failed to install key for vdev
> 0 peer b8:27:eb:f2:52:22: -110
> [94219.191719] ath10k_sdio mmc0:0001:1: cipher 0 is not supported
> [94219.207948] ath10k_sdio mmc0:0001:1: failed to remove peer wep key 0: -95
> [94219.222155] ath10k_sdio mmc0:0001:1: failed to clear all peer wep
> keys for vdev 0: -95
> [94219.237937] ath10k_sdio mmc0:0001:1: failed to disassociate
> station: c8:21:58:10:b3:b4 vdev 0: -95
>
> It seems that I can reproduce this issue faster by connecting more
> clients and pushing a lot of throughput. So perhaps this is a resource
> leak in the firmware?

I would blame ath10k first :) Can you estimate how much data needs to be
transferred before this happens?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
