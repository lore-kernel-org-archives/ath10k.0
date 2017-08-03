Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddEL1-0007YD-7D
 for ath10k@lists.infradead.org; Thu, 03 Aug 2017 11:30:50 +0000
MIME-Version: 1.0
Subject: Re: ath10k: set a-mpdu reference number in ath10k (receiver)
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <B8D63297-0A88-42A3-B789-3849895CF201@frei.media>
References: <B8D63297-0A88-42A3-B789-3849895CF201@frei.media>
Message-ID: <be71938f7b3742c685e91c54cce1a7de@euamsexm01a.eu.qualcomm.com>
Date: Thu, 3 Aug 2017 13:30:19 +0200
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
To: Matthias Frei <mf@frei.media>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Matthias Frei <mf@frei.media> wrote:

> Set the a-mpdu reference number in ath10k to make it accessible in the
> receivers radiotap header. Implemented as in ath9k.  The reference number is
> needed for troubleshooting and research at the receivers site (e.g. to identify
> mpdu's that were aggregated in an a-mpdu)
> 
> Signed-off-by: Matthias Frei <mf@frei.media>
> [kvalo@qca.qualcomm.com: fix checkpatch warning, commit log cleanup]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Patch applied to ath-next branch of ath.git, thanks.

47cc0ca91c9e ath10k: set a-mpdu receiver reference number

-- 
https://patchwork.kernel.org/patch/9826931/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
