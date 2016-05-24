Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5GQN-00037s-So
 for ath10k@lists.infradead.org; Tue, 24 May 2016 17:47:24 +0000
MIME-Version: 1.0
Subject: Re: [1/4] ath10k: Move rx_location_info out of struct rx_pkt_end
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1461164356-9158-2-git-send-email-vthiagar@qti.qualcomm.com>
Message-ID: <4f3064b4687744e7bf09e4c8941d117c@euamsexm01a.eu.qualcomm.com>
Date: Tue, 24 May 2016 19:46:31 +0200
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> wrote:
> Define rx_location_info in struct rx_ppdu_end_qca99x0 after
> rx_pkt_end. This is to prepare rx_ppdu_end for QCA9984 chip.
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>

Thanks, 4 patches applied to ath.git:

8f09588b2cdc ath10k: move rx_location_info out of struct rx_pkt_end
0fc7e270523b ath10k: clean up growing hw checks during safe and full reset
acc6b5593eee ath10k: define rx_ppdu_end for QCA9984
651b4cdcf97e ath10k: enable support for QCA9984

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/8890931/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
