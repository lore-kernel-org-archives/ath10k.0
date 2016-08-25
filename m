Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Wed, 24 Aug 2016 20:38:01 -0400
From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH v2 0/6] linux-firmware: ath10k: update and add various
 firmware files
Message-ID: <20160825003801.GD20731@merlin.infradead.org>
References: <20160824113134.5625.35574.stgit@potku.adurom.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160824113134.5625.35574.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org, linux-firmware@kernel.org, ath10k@lists.infradead.org

On Wed, Aug 24, 2016 at 02:32:10PM +0300, Kalle Valo wrote:
> Hi,
> 
> here's a bigger ath10k firmware update. Support for four new hardware
> and smaller updates for existing hardware.
> 
> Kalle
> 
> v2:
> 
> * patch 4: Fix a typo in the commit log.

Applied series, thanks Kalle.

regards, --Kyle

> 
> ---
> 
> Kalle Valo (6):
>       ath10k: QCA4019 hw1.0: add firmware and board files
>       ath10k: QCA9887 hw1.0: add firmware and board files
>       ath10k: QCA9888 hw2.0: add firmware and board files
>       ath10k: QCA9984 hw1.0: add firmware and board files
>       ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.54
>       ath10k: QCA6174: update board files
> 
> 
>  WHENCE                                            |   18 +
>  ath10k/QCA4019/hw1.0/board-2.bin                  |  Bin
>  ath10k/QCA4019/hw1.0/firmware-5.bin               |  Bin
>  ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
>  ath10k/QCA6174/hw2.1/board-2.bin                  |  Bin
>  ath10k/QCA6174/hw3.0/board-2.bin                  |  Bin
>  ath10k/QCA9887/hw1.0/board.bin                    |  Bin
>  ath10k/QCA9887/hw1.0/firmware-5.bin               |  Bin
>  ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt |  328 ++++++++++++
>  ath10k/QCA9888/hw2.0/board-2.bin                  |  Bin
>  ath10k/QCA9888/hw2.0/firmware-5.bin               |  Bin
>  ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
>  ath10k/QCA988X/hw2.0/firmware-5.bin               |  Bin
>  ath10k/QCA988X/hw2.0/notice_ath10k_firmware-5.txt |   44 +-
>  ath10k/QCA9984/hw1.0/board-2.bin                  |  Bin
>  ath10k/QCA9984/hw1.0/firmware-5.bin               |  Bin
>  ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt |  589 +++++++++++++++++++++
>  17 files changed, 2134 insertions(+), 23 deletions(-)
>  create mode 100644 ath10k/QCA4019/hw1.0/board-2.bin
>  create mode 100644 ath10k/QCA4019/hw1.0/firmware-5.bin
>  create mode 100644 ath10k/QCA4019/hw1.0/notice_ath10k_firmware-5.txt
>  create mode 100644 ath10k/QCA9887/hw1.0/board.bin
>  create mode 100644 ath10k/QCA9887/hw1.0/firmware-5.bin
>  create mode 100644 ath10k/QCA9887/hw1.0/notice_ath10k_firmware-5.txt
>  create mode 100644 ath10k/QCA9888/hw2.0/board-2.bin
>  create mode 100644 ath10k/QCA9888/hw2.0/firmware-5.bin
>  create mode 100644 ath10k/QCA9888/hw2.0/notice_ath10k_firmware-5.txt
>  create mode 100644 ath10k/QCA9984/hw1.0/board-2.bin
>  create mode 100644 ath10k/QCA9984/hw1.0/firmware-5.bin
>  create mode 100644 ath10k/QCA9984/hw1.0/notice_ath10k_firmware-5.txt
> 
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
