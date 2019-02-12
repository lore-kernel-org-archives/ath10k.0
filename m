Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXQ1-0002Bt-1R
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 12:44:11 +0000
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF49220821
 for <ath10k@lists.infradead.org>; Tue, 12 Feb 2019 12:44:07 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id y20so2642907qtm.13
 for <ath10k@lists.infradead.org>; Tue, 12 Feb 2019 04:44:07 -0800 (PST)
MIME-Version: 1.0
References: <1549035547599.95403@qca.qualcomm.com>
In-Reply-To: <1549035547599.95403@qca.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 12 Feb 2019 07:43:56 -0500
Message-ID: <CA+5PVA5cO9vpLjKezoTiBUOrZwL9tPnY9G66zC9gM9hb=CgTTQ@mail.gmail.com>
Subject: Re: [PULL] ath10k firmware 2019-02-01
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

On Fri, Feb 1, 2019 at 10:41 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> here are few ath10k firmware updates, please pull.
>
> Kalle
>
> The following changes since commit a8b75cac06f80dc1500ba385680ac5b5c1d1c4f8:
>
>   Merge tag 'add-rpi-fw' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux-firmware (2019-01-18 07:04:02 -0500)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20190201
>
> for you to fetch changes up to 6b5e23a113704867df5205f31f02ffbc3ec4453e:
>
>   ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00021 (2019-02-01 17:22:55 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (4):
>       ath10k: QCA6174 hw3.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00024
>       ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00043
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00021
>
>  WHENCE                              |   6 +++---
>  ath10k/QCA6174/hw3.0/board-2.bin    | Bin 551128 -> 567608 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin | Bin 675492 -> 688536 bytes
>  ath10k/QCA988X/hw2.0/firmware-5.bin | Bin 248200 -> 248840 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin | Bin 662084 -> 676316 bytes
>  5 files changed, 3 insertions(+), 3 deletions(-)

Pulled and pushed out.  Thanks.

josh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
