Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqh3b-0005of-RL
 for ath10k@lists.infradead.org; Thu, 14 Apr 2016 13:11:40 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/8] ath10k: remove deprecated firmware API 1 support
Date: Thu, 14 Apr 2016 13:11:12 +0000
Message-ID: <874mb4s5cg.fsf@kamboji.qca.qualcomm.com>
References: <20160406144355.28399.23733.stgit@potku.adurom.net>
 <20160406144445.28399.74306.stgit@potku.adurom.net>
In-Reply-To: <20160406144445.28399.74306.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 6 Apr 2016 17:44:45 +0300")
Content-Language: en-US
Content-ID: <635AA65EDC07034AA6D77327F197BB24@qualcomm.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> This has ben deprecated years ago, I haven't heard anyone using it since and
> most likely it won't even work anymore. So just remove all of it.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -35,8 +35,6 @@
>  #define QCA988X_HW_2_0_VERSION		0x4100016c
>  #define QCA988X_HW_2_0_CHIP_ID_REV	0x2
>  #define QCA988X_HW_2_0_FW_DIR		ATH10K_FW_DIR "/QCA988X/hw2.0"
> -#define QCA988X_HW_2_0_FW_FILE		"firmware.bin"
> -#define QCA988X_HW_2_0_OTP_FILE		"otp.bin"
>  #define QCA988X_HW_2_0_BOARD_DATA_FILE	"board.bin"
>  #define QCA988X_HW_2_0_PATCH_LOAD_ADDR	0x1234

I missed to remove all the other references to "firmware.bin" or
"otp.bin", for example:

#define QCA6174_HW_2_1_FW_FILE		"firmware.bin"
#define QCA6174_HW_2_1_OTP_FILE		"otp.bin"

Will send v2.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
