Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bfqYN-00017O-NE
 for ath10k@lists.infradead.org; Fri, 02 Sep 2016 15:39:13 +0000
MIME-Version: 1.0
Subject: Re: [v2] ath10k: fix group privacy action frame decryption for qca4019
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20160809063151.25993-1-rmanohar@qti.qualcomm.com>
Message-ID: <65f8ff55122f4a19af3edd2facb8ea9e@euamsexm01a.eu.qualcomm.com>
Date: Fri, 2 Sep 2016 17:38:24 +0200
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, rmanohar@codeaurora.org

Rajkumar Manoharan <rmanohar@qti.qualcomm.com> wrote:
> Recent commit 'mac80211: Encrypt "Group addressed privacy" action frames'
> encrypts group privacy action frames. But qca99x0 family chipset delivers
> broadcast/multicast management frames as encrypted and it should be
> decrypted by mac80211. Setting RX_FLAG_DECRYPTED stats for those frames
> is breaking mesh connection establishment.
> 
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>

Thanks, 1 patch applied to ath-next branch of ath.git:

7d42298eb43d ath10k: fix group privacy action frame decryption for qca4019

-- 
Sent by pwcli
https://patchwork.kernel.org/patch/9270363/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
