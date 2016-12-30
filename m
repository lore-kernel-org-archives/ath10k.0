Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMtIW-0006jI-6h
 for ath10k@lists.infradead.org; Fri, 30 Dec 2016 09:16:25 +0000
MIME-Version: 1.0
Subject: Re: ath10k: ignore configuring the incorrect board_id
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1482447757-23577-1-git-send-email-ryanhsu@qca.qualcomm.com>
References: <1482447757-23577-1-git-send-email-ryanhsu@qca.qualcomm.com>
Message-ID: <d97a54233b874e629fd27cd98025030e@euamsexm01a.eu.qualcomm.com>
Date: Fri, 30 Dec 2016 10:15:57 +0100
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
To: Ryan Hsu <ryanhsu@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Ryan Hsu <ryanhsu@qca.qualcomm.com> wrote:
> From: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> 
> With command to get board_id from otp, in the case of following
> 
>   boot get otp board id result 0x00000000 board_id 0 chip_id 0
>   boot using board name 'bus=pci,bmi-chip-id=0,bmi-board-id=0"
>   ...
>   failed to fetch board data for bus=pci,bmi-chip-id=0,bmi-board-id=0 from
>   ath10k/QCA6174/hw3.0/board-2.bin
> 
> The invalid board_id=0 will be used as index to search in the board-2.bin.
> 
> Ignore the case with board_id=0, as it means the otp is not carrying
> the board id information.
> 
> Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

d2e202c06ca4 ath10k: ignore configuring the incorrect board_id

-- 
https://patchwork.kernel.org/patch/9486941/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
