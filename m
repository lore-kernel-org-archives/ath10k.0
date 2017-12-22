Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSPWq-0007Um-OZ
 for ath10k@lists.infradead.org; Fri, 22 Dec 2017 15:46:34 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v3 08/11] ath10k: add QCA9377 usb hw_param item
Date: Fri, 22 Dec 2017 15:46:17 +0000
Message-ID: <87bmiqahpz.fsf@kamboji.qca.qualcomm.com>
References: <20170917194013.8658-1-erik.stromdahl@gmail.com>
 <20170917194013.8658-9-erik.stromdahl@gmail.com>
In-Reply-To: <20170917194013.8658-9-erik.stromdahl@gmail.com> (Erik
 Stromdahl's message of "Sun, 17 Sep 2017 21:40:10 +0200")
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Hardware parameters for QCA9377 usb devices.
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -127,6 +127,7 @@ enum qca9377_chip_id_rev {
>  /* QCA9377 1.0 definitions */
>  #define QCA9377_HW_1_0_FW_DIR          ATH10K_FW_DIR "/QCA9377/hw1.0"
>  #define QCA9377_HW_1_0_BOARD_DATA_FILE "board.bin"
> +#define QCA9377_HW_1_0_BOARD_DATA_FILE_USB "board-usb.bin"
>  #define QCA9377_HW_1_0_PATCH_LOAD_ADDR	0x1234

Not sure if we need board-usb.bin. board-2.bin already has a bus
attribute and board.bin is supposed to be used only by developers etc.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
