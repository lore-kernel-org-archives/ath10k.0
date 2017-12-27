Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eU8oA-00006d-Ik
 for ath10k@lists.infradead.org; Wed, 27 Dec 2017 10:19:36 +0000
MIME-Version: 1.0
Subject: Re: ath10k: advertising tdls wider bandwidth support for 5GHz
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1513866642-709-1-git-send-email-bpothuno@qti.qualcomm.com>
References: <1513866642-709-1-git-send-email-bpothuno@qti.qualcomm.com>
Message-ID: <497244afaa474095914d5d6821dcdf83@euamsexm01a.eu.qualcomm.com>
Date: Wed, 27 Dec 2017 11:19:17 +0100
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
To: bpothuno@qti.qualcomm.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

bpothuno@qti.qualcomm.com wrote:

> Enable TDLS wider bandwidth support for 5GHz based on firmware wmi capabilities.
> 
> This patch is required for chipset QCA9888. Tested with firmware version
> 10.4-3.5.1-00018.
> 
> Signed-off-by: Balaji Pothunoori <bpothuno@qti.qualcomm.com>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

14d65775687c ath10k: advertise TDLS wider bandwidth support for 5GHz

-- 
https://patchwork.kernel.org/patch/10127717/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
