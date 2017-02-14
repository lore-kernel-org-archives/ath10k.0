Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdhKd-0006to-Th
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 17:56:07 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/4] ath10k: fetch firmware images in a loop
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <148672959257.8556.14481306395015426550.stgit@potku.adurom.net>
References: <148672959257.8556.14481306395015426550.stgit@potku.adurom.net>
Message-ID: <6706de25e5b646fda1c44984addb3318@eusanexr01a.eu.qualcomm.com>
Date: Tue, 14 Feb 2017 09:55:38 -0800
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> From: Erik Stromdahl <erik.stromdahl@gmail.com>
> 
> To make it easier to handle minimum and maximum firmware API numbers convert
> the firmware fetch functionality to a loop. If no firmware image is found print
> an error with minimum and maximum API numbers and the name of firmware
> directory. This is needed when we switch to using request_firmware_direct()
> which doesn't print any errors anymore.
> 
> Also add a new function for creating the fw file name dynamically which makes it
> easier to add new bus support, for example SDIO and USB, later.
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> [kvalo@qca.qualcomm.com: remove sdio/usb part, new error message, clarify commit log]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

4 patches applied to ath-next branch of ath.git, thanks.

1c61bedc0a72 ath10k: fetch firmware images in a loop
310c01afae01 ath10k: add directory to board data error message
9f5bcfe93315 ath10k: silence firmware file probing warnings
7be52c03bbf7 ath10k: convert warning about non-existent OTP board id to debug message

-- 
https://patchwork.kernel.org/patch/9566667/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
