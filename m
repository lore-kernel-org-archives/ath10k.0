Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiIZU-00019w-4g
 for ath10k@lists.infradead.org; Fri, 20 Dec 2019 13:44:02 +0000
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 304DE2465E
 for <ath10k@lists.infradead.org>; Fri, 20 Dec 2019 13:43:58 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id o18so3630293qvf.1
 for <ath10k@lists.infradead.org>; Fri, 20 Dec 2019 05:43:58 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB6006CC2E199B34B8EF53D30D922D0@BYAPR02MB6006.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB6006CC2E199B34B8EF53D30D922D0@BYAPR02MB6006.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 20 Dec 2019 08:43:46 -0500
Message-ID: <CA+5PVA5F13c2c8tjKAFk+v=ZvfSwiV5iCZMAQOsB8FrLnS28uw@mail.gmail.com>
Subject: Re: [PULL] ath10k firmware 20191220
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

On Fri, Dec 20, 2019 at 4:33 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> ath10k firmware updates and also new hardware WCN3990. Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit c4586ffaac0ca0d7045e06140b6426f2e79e96e6:
>
>   linux-firmware: Update AMD cpu microcode (2019-12-18 09:37:15 -0500)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20191220
>
> for you to fetch changes up to b142c2e0229bc89b44ac527f4f3c3def063bcbc6:
>
>   ath10k: WCN3990 hw1.0: add firmware WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1 (2019-12-20 11:18:46 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (6):
>       ath10k: QCA6174 hw3.0: update board-2.bin
>       ath10k: QCA9887 hw1.0: update firmware-5.bin to 10.2.4-1.0-00047
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00070
>       ath10k: QCA988X hw2.0: update firmware-5.bin to 10.2.4-1.0-00047
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00070
>       ath10k: WCN3990 hw1.0: add firmware WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>
>  WHENCE                                   |  12 +-
>  ath10k/QCA6174/hw3.0/board-2.bin         | Bin 567608 -> 584036 bytes
>  ath10k/QCA9887/hw1.0/firmware-5.bin      | Bin 238484 -> 238548 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin      | Bin 686996 -> 688140 bytes
>  ath10k/QCA988X/hw2.0/firmware-5.bin      | Bin 248984 -> 249044 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin      | Bin 674940 -> 675948 bytes
>  ath10k/WCN3990/hw1.0/firmware-5.bin      | Bin 0 -> 60 bytes
>  ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp | 571 +++++++++++++++++++++++++++++++
>  ath10k/WCN3990/hw1.0/wlanmdsp.mbn        | Bin 0 -> 3725044 bytes
>  9 files changed, 579 insertions(+), 4 deletions(-)
>  create mode 100644 ath10k/WCN3990/hw1.0/firmware-5.bin
>  create mode 100644 ath10k/WCN3990/hw1.0/notice.txt_wlanmdsp
>  create mode 100644 ath10k/WCN3990/hw1.0/wlanmdsp.mbn

Pulled and pushed out.  Thanks.

josh

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
