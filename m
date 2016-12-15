Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHZ5O-0004vh-Eg
 for ath10k@lists.infradead.org; Thu, 15 Dec 2016 16:40:51 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 11/11] ath10k: Added sdio support
Date: Thu, 15 Dec 2016 16:40:24 +0000
Message-ID: <87oa0duow8.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-12-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-12-git-send-email-erik.stromdahl@gmail.com>
 (Erik Stromdahl's message of "Fri, 18 Nov 2016 20:22:51 +0100")
Content-Language: en-US
Content-ID: <C1CB1C435A64B941B3BD0E3DCF876604@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Initial HIF sdio/mailbox implementation.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/Kconfig  |    6 +
>  drivers/net/wireless/ath/ath10k/Makefile |    3 +
>  drivers/net/wireless/ath/ath10k/sdio.c   | 1860 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/sdio.h   |  276 +++++
>  4 files changed, 2145 insertions(+)
>  create mode 100644 drivers/net/wireless/ath/ath10k/sdio.c
>  create mode 100644 drivers/net/wireless/ath/ath10k/sdio.h

AFAIK the sdio firmware binary is different from pci and usb. And as all
the firmware images need to coexist in the same repository I suspect we
can't continue to use firmware-N.bin for both pcie and sdio (and in
future usb). So should we somehow rename the sdio firmware filename to
something else, like firmware-sdio-N.bin?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
