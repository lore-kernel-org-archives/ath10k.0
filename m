Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Fri, 13 Mar 2015 16:47:30 -0400
From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] ath10k: add firmware 10.2.4.45 as firmware-4.bin
Message-ID: <20150313204730.GA30928@merlin.infradead.org>
References: <1426160112-4261-1-git-send-email-kvalo@qca.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1426160112-4261-1-git-send-email-kvalo@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-firmware@kernel.org

On Thu, Mar 12, 2015 at 01:35:12PM +0200, Kalle Valo wrote:
> This is the latest firmware from 10.2.4 firmware branch.
> 
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Pardon my ignorance... It looks like your driver needs more than just
firmware-4.bin... How are distros supposed to use this? Symlink it into
firmware.bin which it seems the driver looks for?

--Kyle

> ---
>  LICENSE.QualcommAtheros_ath10k                    |   47 ++++
>  WHENCE                                            |    9 +
>  ath10k/QCA988X/hw2.0/firmware-4.bin               |  Bin 0 -> 241892 bytes
>  ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt |  301 +++++++++++++++++++++
>  4 files changed, 357 insertions(+)
>  create mode 100644 LICENSE.QualcommAtheros_ath10k
>  create mode 100644 ath10k/QCA988X/hw2.0/firmware-4.bin
>  create mode 100644 ath10k/QCA988X/hw2.0/notice_ath10k_firmware-4.txt

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
