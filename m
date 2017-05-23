Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDBkR-0006Mo-9h
 for ath10k@lists.infradead.org; Tue, 23 May 2017 15:29:25 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fix reported HT MCS rates with NSS > 1
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <20170511090930.18205-1-sven.eckelmann@openmesh.com>
References: <20170511090930.18205-1-sven.eckelmann@openmesh.com>
Message-ID: <0a29ec25ec374a12adbc222af9a7dda1@euamsexm01a.eu.qualcomm.com>
Date: Tue, 23 May 2017 17:28:55 +0200
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: akolli@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> wrote:
> The QCA4019 firmware 10.4-3.2.1-00050 reports only HT MCS rates between
> 0-9. But 802.11n MCS rates can be larger than that. For example a 2x2
> device can send with up to MCS 15.
> 
> The firmware encodes the higher MCS rates using the NSS field. The actual
> calculation is not documented by QCA but it seems like the NSS field can be
> mapped for HT rates to following MCS offsets:
> 
>  * NSS 1: 0
>  * NSS 2: 8
>  * NSS 3: 16
>  * NSS 4: 24
> 
> This offset therefore has to be added for HT rates before they are stored
> in the rate_info struct.
> 
> Fixes: cec17c382140 ("ath10k: add per peer htt tx stats support for 10.4")
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>

Patch applied to ath-next branch of ath.git, thanks.

c1dd8016ae02 ath10k: fix reported HT MCS rates with NSS > 1

-- 
https://patchwork.kernel.org/patch/9721111/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
