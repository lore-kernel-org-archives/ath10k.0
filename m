Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyDxQ-0007n2-Mw
 for ath10k@lists.infradead.org; Thu, 15 Aug 2019 11:30:18 +0000
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D423C2086C
 for <ath10k@lists.infradead.org>; Thu, 15 Aug 2019 11:30:15 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id g17so1492856qkk.8
 for <ath10k@lists.infradead.org>; Thu, 15 Aug 2019 04:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB6006478A57983F5B4067F54392D70@BYAPR02MB6006.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB6006478A57983F5B4067F54392D70@BYAPR02MB6006.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 Aug 2019 07:30:04 -0400
Message-ID: <CA+5PVA47DT2vcSW2c=QBT-=ZZ9muwh5_GOehoZKo3avCerPmbA@mail.gmail.com>
Subject: Re: [PULL] ath10k firmware 20190808
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-firmware@kernel.org" <linux-firmware@kernel.org>

On Thu, Aug 8, 2019 at 5:56 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi linux-firmware maintainers,
>
> here's a pull request to update some ath10k firmware images. Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit dff98c6c57383fe343407bcb7b6e775e0b87274f:
>
>   Merge branch 'master' of git://github.com/skeggsb/linux-firmware (2019-07-26 07:32:37 -0400)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20190808
>
> for you to fetch changes up to 1f0a99f6b07e24449411ccf208836b6769a5a2a4:
>
>   ath10k: QCA9984 hw1.0: update board-2.bin (2019-08-08 12:39:06 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (8):
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00140-QCARMSWPZ-1
>       ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00045
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00040
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00045
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00046
>       ath10k: QCA9984 hw1.0: update board-2.bin
>
>  WHENCE                              |  10 +++++-----
>  ath10k/QCA4019/hw1.0/board-2.bin    | Bin 449316 -> 607304 bytes
>  ath10k/QCA6174/hw3.0/firmware-6.bin | Bin 731276 -> 700988 bytes
>  ath10k/QCA9887/hw1.0/firmware-5.bin | Bin 237660 -> 238484 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin    | Bin 84928 -> 84928 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 688536 -> 686996 bytes
>  ath10k/QCA988X/hw2.0/firmware-5.bin | Bin 248840 -> 248984 bytes
>  ath10k/QCA9984/hw1.0/board-2.bin    | Bin 171916 -> 171916 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 676316 -> 674940 bytes
>  9 files changed, 5 insertions(+), 5 deletions(-)

Pulled and pushed out.  Thanks.

josh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
