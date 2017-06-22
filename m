Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Thu, 22 Jun 2017 12:06:59 -0700
From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH 00/12] ath10k: firmware update 20170621
Message-ID: <20170622190659.GK13400@bombadil.infradead.org>
References: <1498120328-2017-1-git-send-email-kvalo@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1498120328-2017-1-git-send-email-kvalo@qca.qualcomm.com>
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

On Thu, Jun 22, 2017 at 11:31:56AM +0300, Kalle Valo wrote:
> Hi,
> 
> here's a set of firmware and board file updates for ath10k.
> 

applied, thanks kalle.

--kyle

> Kalle
> 
> Kalle Valo (12):
>   ath10k: QCA4019 hw1.0: update board-2.bin
>   ath10k: QCA4019 hw1.0: update firmware to 10.4-3.4-00082
>   ath10k: QCA6174 hw3.0: update board-2.bin
>   ath10k: QCA6174 hw3.0: add WLAN.RM.4.4-00022-QCARMSWPZ-2
>   ath10k: QCA9377 hw1.0: update board-2.bin
>   ath10k: QCA9887 hw1.0: update firmware to 10.2.4-1.0-00029
>   ath10k: QCA9888 hw2.0: update board-2.bin
>   ath10k: QCA9888 hw2.0: update firmware to 10.4-3.5.1-00014
>   ath10k: QCA988X hw2.0: update firmware to 10.2.4.70.63-2
>   ath10k: QCA9984 hw1.0: update board-2.bin
>   ath10k: QCA9984 hw1.0: update firmware to 10.4-3.4-00082
>   ath10k: update year in license
> 
>  LICENSE.QualcommAtheros_ath10k                    |    2 +-
>  WHENCE                                            |   13 +-
>  ath10k/QCA4019/hw1.0/board-2.bin                  |  Bin 72788 -> 109172 bytes
>  ath10k/QCA4019/hw1.0/firmware-5.bin               |  Bin 512520 -> 535412 bytes
>  ath10k/QCA6174/hw3.0/board-2.bin                  |  Bin 361924 -> 477060 bytes
>  ath10k/QCA6174/hw3.0/firmware-6.bin               |  Bin 0 -> 711408 bytes
>  ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt | 1781 +++++++++++++++++++++
>  ath10k/QCA9377/hw1.0/board-2.bin                  |  Bin 427668 -> 304308 bytes
>  ath10k/QCA9887/hw1.0/firmware-5.bin               |  Bin 234560 -> 235880 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin                  |  Bin 12148 -> 72788 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin               |  Bin 565168 -> 647460 bytes
>  ath10k/QCA988X/hw2.0/firmware-5.bin               |  Bin 248188 -> 249384 bytes
>  ath10k/QCA9984/hw1.0/board-2.bin                  |  Bin 12144 -> 121264 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin               |  Bin 591308 -> 622060 bytes
>  14 files changed, 1790 insertions(+), 6 deletions(-)
>  create mode 100644 ath10k/QCA6174/hw3.0/firmware-6.bin
>  create mode 100644 ath10k/QCA6174/hw3.0/notice_ath10k_firmware-6.txt
> 
> -- 
> 2.7.4
> 
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
